<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.0.0_types.php';

$types = getV1_0_0_Types();

$buf = '';

foreach ($types as $type) {
    $buf .= "CREATE TYPE {$type->type->pgName};\n";
}

$buf .= "\n";

foreach ($types as $type) {
    $buf .= $type->toSQL(EXT_NAME) . "\n";
}

$buf .= "\n\n-- Cross types ops\n";

$CROSS_TYPES = buildCrossTypes(V1_0_0_UINT_TYPES, V1_0_0_INT_TYPES);

//const CROSS_TYPES = [
//    // UINT16
//    'uint2' => [UINT32, UINT64, UINT128, INT128],
//    // UINT32
//    'uint4' => [UINT16, UINT64, UINT128, INT128],
//    // UINT64
//    'uint8' =>  [UINT16, UINT32, UINT128, INT128],
//    // UINT128
//    'uint16' => [UINT16, UINT32, UINT64, INT128],
//    // INT128
//    'int16' =>  [UINT16, UINT32, UINT64, UINT128],
//];

foreach (genSQLForCrossTypes($types, $CROSS_TYPES) as $typConfig) {
    $buf .= $typConfig->toSQL(EXT_NAME) . "\n\n";
}

file_put_contents("uint128--1.0.0.sql", $buf);
echo "uint128--1.0.0.sql successfully generated\n";

@mkdir("sql");
@mkdir("expected");

foreach ($types as $type) {
    [$test, $expected] = $type->toSQLTests();

    file_put_contents("sql/test_{$type->type->pgName}.sql", $test);
    file_put_contents("expected/test_{$type->type->pgName}.out", $expected);

    echo "sql/test_{$type->type->pgName}.sql successfully generated\n";
    echo "expected/test_{$type->type->pgName}.out successfully generated\n";
}

return;
