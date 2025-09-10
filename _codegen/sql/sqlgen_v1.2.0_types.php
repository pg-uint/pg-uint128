<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';

/**
 * @param array<Type> $types
 * @return array<Type>
 */
function typesExcept(array $types, Type $except): array
{
    $idx = array_search($except, $types, true);
    if ($idx === false) {
        return $types;
    }

    $crossTypes = [];

    array_push($crossTypes, ...array_slice($types, 0, $idx));
    array_push($crossTypes, ...array_slice($types, $idx + 1));

    return $crossTypes;
}

/**
 * @return array
 */
function makeDefaultTypeOps(Type $type): array
{
    if ($type->builtIn) {
        $defaultUintOpsTypes = typesExcept([
            ...CUSTOM_INT_TYPES,
            ...UINT_TYPES,
        ], $type);
    } else {
        $defaultUintOpsTypes = typesExcept([
            ...INT_TYPES,
            ...UINT_TYPES,
        ], $type);
    }

    return [
        new TypeOpConfig(Op::Eq, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Ne, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Gt, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Lt, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Ge, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Le, types: $defaultUintOpsTypes, inverseTypes: false),

        new TypeOpConfig(Op::Add, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Sub, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Mul, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Div, types: $defaultUintOpsTypes, inverseTypes: false),
        new TypeOpConfig(Op::Mod, types: $defaultUintOpsTypes, inverseTypes: false),

        new TypeOpConfig(Op::Xor),
        new TypeOpConfig(Op::And),
        new TypeOpConfig(Op::Or),
        new TypeOpConfig(Op::Not),
        new TypeOpConfig(Op::Shl),
        new TypeOpConfig(Op::Shr),
    ];
}

/** @var array<TypeConfig> $V1_2_0_Types */
$V1_2_0_Types = [
    new TypeConfig(
        type: UINT8,
        alignment: 'char',
        passByValue: true,
        ops: makeDefaultTypeOps(UINT8),
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT8), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT16,
        alignment: 'int2',
        passByValue: true,
        ops: makeDefaultTypeOps(UINT16),
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT16), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT32,
        alignment: 'int4',
        passByValue: true,
        ops: makeDefaultTypeOps(UINT32),
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT32), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT64,
        alignment: 'double',
        passByValue: true,
        ops: makeDefaultTypeOps(UINT64),
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT64), FLOAT4, FLOAT8, JSON, JSONB],
        inOutCasts: [NUMERIC],
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT128,
        alignment: 'char',
        passByValue: false,
        ops: makeDefaultTypeOps(UINT128),
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT128), FLOAT4, FLOAT8, JSON, JSONB, UUID],
        inOutCasts: [NUMERIC],
        aggOps: AGG_OPS,
    ),

    new TypeConfig(
        type: INT8,
        alignment: 'char',
        passByValue: true,
        ops: makeDefaultTypeOps(INT8),
        casts: [...UINT_TYPES, ...typesExcept(INT_TYPES, INT8), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: INT16,
        alignment: 'int2',
        passByValue: true,
        ops: makeDefaultTypeOps(INT16),
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: INT32,
        alignment: 'int4',
        passByValue: true,
        ops: makeDefaultTypeOps(INT32),
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: INT64,
        alignment: 'double',
        passByValue: true,
        ops: makeDefaultTypeOps(INT64),
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: INT128,
        alignment: 'char',
        passByValue: false,
        ops: makeDefaultTypeOps(INT128),
        casts: [...UINT_TYPES, ...typesExcept(INT_TYPES, INT128), FLOAT4, FLOAT8, JSON, JSONB],
        inOutCasts: [NUMERIC],
        aggOps: AGG_OPS,
    ),

    new TypeConfig(
        type: NUMERIC,
        alignment: 'char',
        passByValue: false,
        casts: [UINT8, UINT16, UINT32, INT8],
        inOutCasts: [UINT64, UINT128, INT128],
    ),

    new TypeConfig(
        type: FLOAT4,
        alignment: 'int4',
        passByValue: true,
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),

    new TypeConfig(
        type: FLOAT8,
        alignment: 'double',
        passByValue: true,
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),

    new TypeConfig(
        type: JSON,
        alignment: 'char',
        passByValue: false,
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: JSONB,
        alignment: 'char',
        passByValue: false,
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: UUID,
        alignment: 'char',
        passByValue: false,
        casts: [UINT128],
    ),
];

/**
 * @type Type[]
 */
const V1_2_0_UINT_TYPES = [
    UINT8,
    UINT16,
    UINT32,
    UINT64,
    UINT128,
];

/**
 * @type Type[]
 */
const V1_2_0_INT_TYPES = [
    INT8,
    INT128,
];

/**
 * @return array<TypeConfig>
 */
function getV1_2_0_Types(): array
{
    global $V1_2_0_Types;

    return $V1_2_0_Types;
}
