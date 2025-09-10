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

/** @var array<TypeConfig> $V1_2_0_Types */
$V1_2_0_Types = [
    new TypeConfig(
        type: UINT8,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT8), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT16,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT16), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT32,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT32), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT64,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT64), FLOAT4, FLOAT8, JSON, JSONB],
        inOutCasts: [NUMERIC],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT128,
        alignment: 'char',
        passByValue: false,
        ops: [],
        casts: [...INT_TYPES, ...typesExcept(UINT_TYPES, UINT128), FLOAT4, FLOAT8, JSON, JSONB, UUID],
        inOutCasts: [NUMERIC],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),

    new TypeConfig(
        type: INT8,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [...UINT_TYPES, ...typesExcept(INT_TYPES, INT8), NUMERIC, FLOAT4, FLOAT8, JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: INT16,
        alignment: 'char',
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: INT32,
        alignment: 'char',
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: INT64,
        alignment: 'char',
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),
    new TypeConfig(
        type: INT128,
        alignment: 'char',
        passByValue: false,
        ops: [],
        casts: [...UINT_TYPES, ...typesExcept(INT_TYPES, INT128), FLOAT4, FLOAT8, JSON, JSONB],
        inOutCasts: [NUMERIC],
        crossTypesOnly: true,
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
        alignment: 'char',
        passByValue: false,
        casts: [...UINT_TYPES, ...CUSTOM_INT_TYPES],
    ),

    new TypeConfig(
        type: FLOAT8,
        alignment: 'char',
        passByValue: false,
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
