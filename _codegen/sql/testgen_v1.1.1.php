<?php

declare(strict_types=1);

require_once __DIR__ . '/sqlgen_v1.1.1_types.php';

$types = getV1_1_1_Types();

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
