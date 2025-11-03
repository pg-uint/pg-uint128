<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.2.0_types.php';

$VERSION_NUM = 1200;

$types = getV1_2_0_Types();
$buf = '';

foreach ($types as $type) {
    $buf .= "-- Type {$type->type->pgName} block\n\n";

    $buf .= "-- Cast functions {$type->type->pgName} block\n\n";

    foreach ($type->casts as $cast) {
        $buf .= $type->toSQLCastFunctions($VERSION_NUM, $cast, true) . "\n";
    }
}

$buf .= "-- Cleanup old casts \n\n";
$buf .= <<<SQL
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT
            p.oid,
            p.castfunc,
            p.castsource,
            p.casttarget
        FROM
            pg_catalog.pg_extension AS e
        JOIN pg_catalog.pg_depend AS d ON d.refobjid = e.oid
        JOIN pg_catalog.pg_cast AS p ON p.oid = d.objid
        JOIN pg_type AS t ON t.oid = p.casttarget AND t.typtype NOT IN ('r', 'm')
        JOIN pg_type AS t2 ON t2.oid = p.castsource AND t2.typtype NOT IN ('r', 'm')
        WHERE
            d.deptype = 'e'
            AND e.extname = 'uint128'
        ORDER BY 3, 4
    LOOP
        RAISE NOTICE 'Dropping cast (% -> %)', r.castsource::regtype, r.casttarget::regtype;
        EXECUTE format('DROP CAST (%s AS %s)', r.castsource::regtype, r.casttarget::regtype);

--         IF r.castfunc IS NOT NULL AND r.castfunc > 0 THEN
--             RAISE NOTICE 'Dropping cast func %', r.castfunc::regprocedure;
--             EXECUTE format('DROP FUNCTION %s', r.castfunc::regprocedure);
--         END IF;
    END LOOP;
END $$;
SQL;
$buf .= "\n\n";

foreach ($types as $type) {
    $buf .= "-- Casts {$type->type->pgName} block\n\n";

    foreach ($type->casts as $cast) {
        $buf .= $type->toSQLCast($VERSION_NUM, $cast);
    }

    foreach ($type->inOutCasts as $cast) {
        $buf .= $type->toSQLInOutCast($VERSION_NUM, $cast);
    }

    $buf .= "\n";
}

$buf .= "-- Cleanup old cast functions\n\n";
$buf .= <<<SQL
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT
            p.oid,
            p.castfunc,
            p.castsource,
            p.casttarget
        FROM
            pg_catalog.pg_extension AS e
        JOIN pg_catalog.pg_depend AS d ON d.refobjid = e.oid
        JOIN pg_catalog.pg_cast AS p ON p.oid = d.objid
        JOIN pg_type AS t ON t.oid = p.casttarget AND t.typtype NOT IN ('r', 'm')
        JOIN pg_type AS t2 ON t2.oid = p.castsource AND t2.typtype NOT IN ('r', 'm')
        WHERE
            d.deptype = 'e'
            AND e.extname = 'uint128'
        ORDER BY 3, 4
    LOOP
--         RAISE NOTICE 'Dropping cast (% -> %)', r.castsource::regtype, r.casttarget::regtype;
--         EXECUTE format('DROP CAST (%s AS %s)', r.castsource::regtype, r.casttarget::regtype);

        IF r.castfunc IS NOT NULL AND r.castfunc > 0 AND r.castfunc::regprocedure::text LIKE '%_to_%' THEN
            RAISE NOTICE 'Dropping cast func %', r.castfunc::regprocedure;
            EXECUTE format('DROP FUNCTION %s', r.castfunc::regprocedure);
        END IF;
    END LOOP;
END $$;
SQL;
$buf .= "\n\n";

$fileName = "uint128--1.1.1--1.2.0.sql";
file_put_contents($fileName, $buf);
echo "$fileName successfully generated\n";

// Full version dump below

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

$fileName = "uint128--1.2.0.sql";
file_put_contents($fileName, $buf);
echo "$fileName successfully generated\n";

@mkdir("sql");
@mkdir("expected");
