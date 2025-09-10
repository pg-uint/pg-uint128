<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.2.0_types.php';

$VERSION_NUM = 1200;

$types = getV1_2_0_Types();
$buf = '';

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
            AND (p.castsource, p.casttarget) NOT IN (
                ('int16'::regtype, 'numeric'::regtype),
                ('numeric'::regtype, 'int16'::regtype),
                ('uint16'::regtype, 'numeric'::regtype),
                ('numeric'::regtype, 'uint16'::regtype),
                ('uint8'::regtype, 'numeric'::regtype),
                ('numeric'::regtype, 'uint8'::regtype)
            )
        ORDER BY 3, 4
    LOOP
        RAISE NOTICE 'Dropping cast (% -> %)', r.castsource::regtype, r.casttarget::regtype;
        EXECUTE format('DROP CAST (%I AS %I)', r.castsource::regtype, r.casttarget::regtype);

        IF r.castfunc IS NOT NULL AND r.castfunc > 0 THEN
            RAISE NOTICE 'Dropping cast func %', r.castfunc::regprocedure;
            EXECUTE format('DROP FUNCTION %I', r.castfunc::regprocedure);
        END IF;
    END LOOP;
END $$;
SQL;
$buf .= "\n\n";

foreach ($types as $type) {
    $buf .= "-- Type {$type->type->pgName} block\n\n";

    $buf .= "-- Cast functions {$type->type->pgName} block\n\n";

    foreach ($type->casts as $cast) {
        $buf .= $type->toSQLCastFunctions($VERSION_NUM, $cast) . "\n";
    }
}

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

$fileName = "uint128--1.1.1--1.2.0.sql";
file_put_contents($fileName, $buf);
echo "$fileName successfully generated\n";

@mkdir("sql");
@mkdir("expected");
