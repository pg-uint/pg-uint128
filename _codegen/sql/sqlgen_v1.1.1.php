<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.1.1_types.php';

$types = getV1_1_1_Types();
$buf = '';

function genCastFunc(Type $left, Type $right): string
{
    $EXT_TYPE = $right->pgName;
    $extName = EXT_NAME;

    return <<<EOF
CREATE FUNCTION {$left->pgName}_from_$EXT_TYPE($EXT_TYPE) RETURNS {$left->pgName}
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$left->pgName}_from_$EXT_TYPE';

CREATE FUNCTION {$left->pgName}_to_$EXT_TYPE($left->pgName) RETURNS {$EXT_TYPE}
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$left->pgName}_to_$EXT_TYPE';


EOF;

}

foreach ($types as $type) {
    $buf .= $type->toSQL(EXT_NAME) . "\n";

    // Fast casts to numeric
    if (in_array($type->type, [INT8, UINT8, UINT16, UINT32], true)) {
        $buf .= "-- Numeric casts block\n\n";

        $buf .= genCastFunc($type->type, NUMERIC);

        $buf .= <<<SQL
DROP CAST (numeric AS {$type->type->pgName});
CREATE CAST (numeric AS {$type->type->pgName}) WITH FUNCTION {$type->type->pgName}_from_numeric(numeric) AS ASSIGNMENT;

DROP CAST ({$type->type->pgName} AS numeric);
CREATE CAST ({$type->type->pgName} AS numeric) WITH FUNCTION {$type->type->pgName}_to_numeric({$type->type->pgName}) AS IMPLICIT;
SQL;

        $buf .= "\n";
    }
}

$fileName = "uint128--1.1.0--1.1.1.sql";
file_put_contents($fileName, $buf);
echo "$fileName successfully generated\n";

@mkdir("sql");
@mkdir("expected");

function getJSONTest(Type $type): array
{
    $test = '';
    $expected = '';

    // To JSON

    $q = "SELECT (0::$type->pgName)::json;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("json", "0", false);

    // To JSON

    $q = "SELECT json_build_object('some', 0::$type->pgName);\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("json_build_object", '{"some" : 0}', false);

    // From JSON

    $q = "SELECT ('0'::json)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue($type->pgName, "0",
        !$type->isUnsigned && $type !== INT128 && $type->bitSize !== 8);

    // From JSON error

    // Cannot actually test it because of PG12
//    $q = <<<SQL
//DO $$
//DECLARE
//    pgver int := current_setting('server_version_num')::int;
//BEGIN
//    BEGIN
//        PERFORM ('"abc"'::json)::$type->pgName;
//    EXCEPTION WHEN others THEN
//        IF pgver >= 130000 THEN
//            RAISE;
//        ELSE
//            -- Fake the exception with the message from higher PG version
//            RAISE EXCEPTION 'cannot cast json string to type $type->pgName';
//        END IF;
//    END;
//END $$;
//
//SQL;

//    $q = "SELECT ('\"abc\"'::json)::$type->pgName;\n";

//    $test .= $q;
//    $expected .= $q;
//    $expected .= <<<TEXT
//ERROR:  cannot cast json string to type $type->pgName
//CONTEXT:  SQL statement "SELECT ('"abc"'::json)::$type->pgName"
//PL/pgSQL function inline_code_block line 6 at PERFORM
//
//TEXT;

    return [$test, $expected];
}

function getJSONBTest(Type $type): array
{
    $test = '';
    $expected = '';

    // To JSONB

    $q = "SELECT (0::$type->pgName)::jsonb;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("jsonb", "0", false);

    // To JSONB

    $q = "SELECT jsonb_build_object('some', 0::$type->pgName);\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("jsonb_build_object", '{"some": 0}', false);

    // From JSONB

    $q = "SELECT ('0'::jsonb)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue($type->pgName, "0",
        !$type->isUnsigned && $type !== INT128 && $type->bitSize !== 8);

    // From JSONB error

    $q = "SELECT ('\"abc\"'::jsonb)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;
    $expected .= "ERROR:  cannot cast jsonb string to type $type->pgName\n";

    return [$test, $expected];
}

function getNumericTest(Type $type): array
{
    $test = '';
    $expected = '';

    // To numeric

    $q = "SELECT (0::$type->pgName)::numeric;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue(NUMERIC->pgName, "0", true);

    // From numeric

    $q = "SELECT ('0'::numeric)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue($type->pgName, "0",
        !$type->isUnsigned && $type !== INT128 && $type->bitSize !== 8);

    // From numeric error

    $overflowVal = \bcadd($type->maxValue, '1');

    $q = "SELECT ('$overflowVal'::numeric)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;
    $expected .= "ERROR:  $type->pgName out of range\n";

    return [$test, $expected];
}

foreach ($types as $type) {
    [$test, $expected] = $type->toSQLTests();

    [$testTmp, $expectedTmp] = getNumericTest($type->type);
    $test .= $testTmp;
    $expected .= $expectedTmp;

    [$testTmp, $expectedTmp] = getJSONTest($type->type);
    $test .= $testTmp;
    $expected .= $expectedTmp;

    [$testTmp, $expectedTmp] = getJSONBTest($type->type);
    $test .= $testTmp;
    $expected .= $expectedTmp;

    $testFile = "sql/test_1.1.1_{$type->type->pgName}.sql";
    $expectedFile = "expected/test_1.1.1_{$type->type->pgName}.out";

    file_put_contents($testFile, $test);
    file_put_contents($expectedFile, $expected);

    echo "{$testFile} successfully generated\n";
    echo "{$expectedFile} successfully generated\n";
}

return;
