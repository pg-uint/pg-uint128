<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';

/** @var array<TypeConfig> $V1_1_1_Types */
$V1_1_1_Types = [
    new TypeConfig(
        type: UINT8,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT16,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT32,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT64,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT128,
        alignment: 'char',
        passByValue: false,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),

    new TypeConfig(
        type: INT8,
        alignment: 'char',
        passByValue: true,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: INT128,
        alignment: 'char',
        passByValue: false,
        ops: [],
        casts: [JSON, JSONB],
        crossTypesOnly: true,
        aggOps: AGG_OPS,
    ),
];

/**
 * @type Type[]
 */
const V1_1_1_UINT_TYPES = [
    UINT8,
    UINT16,
    UINT32,
    UINT64,
    UINT128,
];

/**
 * @type Type[]
 */
const V1_1_1_INT_TYPES = [
    INT8,
    INT128,
];

/**
 * @return array<TypeConfig>
 */
function getV1_1_1_Types(): array
{
    global $V1_1_1_Types;

    return $V1_1_1_Types;
}
