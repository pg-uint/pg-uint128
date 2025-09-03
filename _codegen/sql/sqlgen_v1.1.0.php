<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.0.0_types.php';
require_once __DIR__ . '/sqlgen_v1.1.0_types.php';

$types = getV1_1_0_Types();
$buf = '';

foreach ($types as $type) {
    $buf .= "CREATE TYPE {$type->type->pgName};\n";
}

foreach ($types as $type) {
    $buf .= $type->toSQL(EXT_NAME) . "\n";;
}

$buf .= "\n\n-- Cross types ops\n";

/** @var array<string, Type[]> $CROSS_TYPES */
$CROSS_TYPES = buildCrossTypes(V1_1_UINT_TYPES, V1_1_INT_TYPES);

$crossTests = [];

foreach (genSQLForCrossTypes($types, $CROSS_TYPES) as $typConfig) {
    $buf .= $typConfig->toSQL(EXT_NAME) . "\n\n";

    $crossTests[$typConfig->type->pgName] = $typConfig->toSQLTests();
}

/**
 * Cross type conversion from previous version
 * @return Generator<TypeConfig>
 */
function buildV1_0_0_CrossTypesSQL(): Generator
{
    global $types;
    $V1_0_0_Types = getV1_0_0_Types();

    $crossTypes = array_map(static fn (TypeConfig $typConfig) => $typConfig->type, $types);

    /** @var array<string, string[]> $processedCastPairs */
    $processedCastPairs = [];

    foreach ($V1_0_0_Types as $type) {
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
            crossTypesOnly: true,
        );

        foreach ($crossTypes as $crossType) {
            $processedCastPairs[$type->type->pgName][] = $crossType->pgName;
            $processedCastPairs[$crossType->pgName][] = $type->type->pgName;
        }

        yield $typConfig;
    }
}

$crossTestsWithOldTypes = [];

foreach (buildV1_0_0_CrossTypesSQL() as $typConfig) {
    $buf .= $typConfig->toSQL(EXT_NAME) . "\n\n";

    $crossTestsWithOldTypes[$typConfig->type->pgName] = $typConfig->toSQLTests();
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

foreach ($crossTestsWithOldTypes as $oldTypName => [$test, $expected]) {
    $testFileName = "sql/test_1.1.0_{$oldTypName}.sql";
    $expectedFileName = "expected/test_1.1.0_{$oldTypName}.out";

    file_put_contents($testFileName, $test);
    file_put_contents($expectedFileName, $expected);

    echo "{$testFileName} successfully generated\n";
    echo "{$expectedFileName} successfully generated\n";
}

return;
