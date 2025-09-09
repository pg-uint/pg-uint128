<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.1.1_types.php';

$types = getV1_1_1_Types();
$buf = '';

foreach ($types as $type) {
    $buf .= $type->toSQL(EXT_NAME) . "\n";
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

    $q = "SELECT (0::$type->pgName)::json;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("json", "0", false);

    //

    $q = "SELECT json_build_object('some', 0::$type->pgName);\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("json_build_object", '{"some" : 0}', false);

    //

    $q = "SELECT ('0'::json)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue($type->pgName, "0",
        !$type->isUnsigned && $type !== INT128 && $type->bitSize !== 8);

    return [$test, $expected];
}

function getJSONBTest(Type $type): array
{
    $test = '';
    $expected = '';

    $q = "SELECT (0::$type->pgName)::jsonb;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("jsonb", "0", false);

    //

    $q = "SELECT jsonb_build_object('some', 0::$type->pgName);\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue("jsonb_build_object", '{"some": 0}', false);

    //

    $q = "SELECT ('0'::jsonb)::$type->pgName;\n";

    $test .= $q;
    $expected .= $q;

    $expected .= genSqlExpectedPaddedValue($type->pgName, "0",
        !$type->isUnsigned && $type !== INT128 && $type->bitSize !== 8);

    return [$test, $expected];
}

foreach ($types as $type) {
    [$test, $expected] = $type->toSQLTests();

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
