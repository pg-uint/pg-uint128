<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';

require_once __DIR__ . '/sqlgen_v1.2.0_types.php';

$VERSION_NUM = 1300;
$types = getV1_2_0_Types();

$buf = '';

foreach ($types as $type) {
    // Skip builtin types, this block is only for the extension types
    if ($type->type->builtIn) continue;

    $buf .= $type->toSQLTypeDef($VERSION_NUM) . "\n";

    foreach ($type->ops as $op) {
        $buf .= genSQLOperatorFunc($op->op, $type->type, $type->type) . "\n";
    }
    foreach ($type->ops as $op) {
        $buf .= genSQLOperator($op->op, $type->type, $type->type) . "\n";
    }

    $buf .= $type->toSQLOperatorFamily($VERSION_NUM) . "\n";

    $buf .= "\n";
}

// Generate cross type operators
foreach ($types as $type) {
    $buf .= "\n-- Cross-type operators for {$type->type->pgName}\n\n";

    foreach ($type->ops as $op) {
        foreach ($op->types as $opType) {
            $buf .= genSQLOperatorFunc($op->op, $type->type, $opType) . "\n";
        }
    }

    foreach ($type->ops as $op) {
        foreach ($op->types as $opType) {
            $buf .= genSQLOperator($op->op, $type->type, $opType) . "\n";
        }
    }
}

foreach ($types as $type) {
    // Skip builtin types, this block is only for the extension types
    if ($type->type->builtIn) continue;

    $buf .= $type->toSQLAggOps($VERSION_NUM) . "\n";
    $buf .= $type->toSQLRanges($VERSION_NUM) . "\n";
    $buf .= $type->toSQLGenSeries($VERSION_NUM) . "\n";
}

foreach ($types as $type) {
    $buf .= "-- Cast functions for {$type->type->pgName}\n\n";

    foreach ($type->casts as $cast) {
        $buf .= $type->toSQLCastFunctions($VERSION_NUM, $cast);
    }

    $buf .= "-- Casts for {$type->type->pgName}\n\n";

    foreach ($type->casts as $cast) {
        $buf .= $type->toSQLCast($VERSION_NUM, $cast);
    }

    foreach ($type->inOutCasts as $cast) {
        $buf .= $type->toSQLInOutCast($VERSION_NUM, $cast);
    }

    $buf .= "\n";
}

$fileName = "uint128--1.3.0.sql";
file_put_contents($fileName, $buf);
echo "$fileName successfully generated\n";

$rows = [];
foreach (Op::cases() as $op) {
    $cfg = $op->config();
    $commutator = $cfg->commutator === null ? 'NULL' : "'$cfg->commutator'";
    $sameTypeOnly = $cfg->commutatorSameTypeOnly ? 'true' : 'false';
    $rows[] = "    ('$cfg->sign', $commutator, $sameTypeOnly)";
}
$values = implode(",\n", $rows);

$sql = <<<SQL
-- ALTER OPERATOR cannot remove or replace an existing commutator.
-- Update only extension members, preserving operator OIDs and dependent objects.
WITH config(sign, commutator, same_type_only) AS (
    VALUES
$values
),
desired AS (
    SELECT
        o.oid,
        CASE
            WHEN config.commutator IS NULL
            OR (config.same_type_only AND o.oprleft <> o.oprright) THEN 0::oid
            ELSE c.oid
        END AS commutator
    FROM pg_catalog.pg_operator o
    JOIN pg_catalog.pg_depend d ON
        d.classid = 'pg_catalog.pg_operator'::regclass
        AND d.objid = o.oid
        AND d.refclassid = 'pg_catalog.pg_extension'::regclass
        AND d.deptype = 'e'
    JOIN pg_catalog.pg_extension e ON e.oid = d.refobjid AND e.extname = 'uint128'
    JOIN config ON config.sign = o.oprname
    LEFT JOIN pg_catalog.pg_operator c ON
        c.oprnamespace = o.oprnamespace
        AND c.oprname = config.commutator
        AND c.oprleft = o.oprright
        AND c.oprright = o.oprleft
        AND c.oprresult = o.oprresult
        AND c.oprcode <> 0
)
UPDATE pg_catalog.pg_operator o
SET oprcom = desired.commutator
FROM desired
WHERE o.oid = desired.oid AND o.oprcom IS DISTINCT FROM desired.commutator;

SQL;

$fileName = 'uint128--1.2.0--1.3.0.sql';
file_put_contents($fileName, $sql);
echo "$fileName successfully generated\n";
