<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';

/** @var array<TypeConfig> $types */
$types = [
    new TypeConfig(
        type: UINT8,
        alignment: 'char',
        passByValue: true,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: INT_CAST_TYPES,
        aggOps: AGG_OPS,
    ),

    new TypeConfig(
        type: INT8,
        alignment: 'char',
        passByValue: true,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: array_merge(INT_CAST_TYPES),
        aggOps: AGG_OPS,
    ),
];

/**
 * @type Type[]
 */
const V1_1_UINT_TYPES = [
    UINT8,
    UINT16,
    UINT32,
    UINT64,
    UINT128,
];

/**
 * @type Type[]
 */
const V1_1_INT_TYPES = [
    INT8,
    INT128,
];

$buf = '';

foreach ($types as $type) {
    $buf .= "CREATE TYPE {$type->type->pgName};\n";
}

foreach ($types as $type) {
    $buf .= $type->toSQL(EXT_NAME) . "\n";;
}

$buf .= "\n\n-- Cross types ops\n";

/** @var array<string, Type[]> $CROSS_TYPES */
$CROSS_TYPES = [];

/**
 * @var Type $uintType
 */
foreach (V1_1_UINT_TYPES as $idx => $uintType) {
    $crossTypes = [];

    array_push($crossTypes, ...array_slice(V1_1_UINT_TYPES, 0, $idx));
    array_push($crossTypes, ...array_slice(V1_1_UINT_TYPES, $idx + 1));
    array_push($crossTypes, ...V1_1_INT_TYPES);

    $CROSS_TYPES[$uintType->pgName] = $crossTypes;
}

/**
 * @var Type $intType
 */
foreach (V1_1_INT_TYPES as $idx => $intType) {
    $crossTypes = [];

    array_push($crossTypes, ...array_slice(V1_1_INT_TYPES, 0, $idx));
    array_push($crossTypes, ...array_slice(V1_1_INT_TYPES, $idx + 1));
    array_push($crossTypes, ...V1_1_UINT_TYPES);

    $CROSS_TYPES[$intType->pgName] = $crossTypes;
}

/** @var array<string, string[]> $processedCastPairs */
$processedCastPairs = [];

$crossTests = [
];

// Cross types conversions
foreach ($types as $type) {
    /** @var array<Type> $crossTypes */
    $crossTypes = $CROSS_TYPES[$type->type->pgName] ?? [];
    if ($crossTypes === []) {
        continue;
    }

    $typConfig = new TypeConfig(
        type: $type->type,
        alignment: $type->alignment,
        passByValue: $type->passByValue,
        ops: array_values(array_filter(array_map(function (TypeOpConfig $typeCfg) use ($crossTypes) {
            return match ($typeCfg->op) {
                // Bitwise doesn't scale between types
                Op::Not, Op::And, Op::Or, Op::Xor, Op::Shl, Op::Shr => null,
                default => new TypeOpConfig(
                    op: $typeCfg->op,
                    types: $crossTypes,
                )
            };
        }, $type->ops))),
        // Prevent generation duplicate casts
        casts: array_values(
            array_filter($crossTypes, static function (Type $crossType) use ($type, $processedCastPairs) {
                if (!array_key_exists($crossType->pgName, $processedCastPairs)) {
                    return true;
                }

                return !in_array($type->name, $processedCastPairs[$crossType->pgName], true);
            })
        ),
        crossTypesOnly: true,
    );

    foreach ($crossTypes as $crossType) {
        $processedCastPairs[$type->type->pgName][] = $crossType->pgName;
        $processedCastPairs[$crossType->pgName][] = $type->type->pgName;
    }

    $buf .= $typConfig->toSQL(EXT_NAME) . "\n\n";

    $crossTests[$type->type->pgName] = $typConfig->toSQLTests();
}

file_put_contents("uint128--1.0.1--1.1.0.sql", $buf);
echo "uint128--1.0.1--1.1.0.sql successfully generated\n";

@mkdir("sql");
@mkdir("expected");

foreach ($types as $type) {
    [$test, $expected] = $type->toSQLTests();

    $crossTest = $crossTests[$type->type->pgName] ?? [];
    if ($crossTest !== []) {
        $test .= "\n\n" . $crossTest[0];
        $expected .= $crossTest[1];
    }

    file_put_contents("sql/test_{$type->type->pgName}.sql", $test);
    file_put_contents("expected/test_{$type->type->pgName}.out", $expected);

    echo "sql/test_{$type->type->pgName}.sql successfully generated\n";
    echo "expected/test_{$type->type->pgName}.out successfully generated\n";
}

return;
