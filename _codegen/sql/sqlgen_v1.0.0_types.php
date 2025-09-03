<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';

/** @var array<TypeConfig> $types */
$V1_0_0_Types = [
    new TypeConfig(
        type: UINT128,
        alignment: 'char',
        passByValue: false,
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
        casts: array_merge(INT_CAST_TYPES, [UUID]),
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT64,
        alignment: 'double',
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
        type: UINT32,
        alignment: 'int4',
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
        type: UINT16,
        alignment: 'int2',
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
        type: INT128,
        alignment: 'char',
        passByValue: false,
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
const V1_0_0_UINT_TYPES = [
    UINT16,
    UINT32,
    UINT64,
    UINT128,
];

/**
 * @type Type[]
 */
const V1_0_0_INT_TYPES = [
    INT128,
];

/**
 * @return array<TypeConfig>
 */
function getV1_0_0_Types(): array
{
    global $V1_0_0_Types;

    return $V1_0_0_Types;
}
