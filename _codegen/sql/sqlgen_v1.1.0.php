<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.0.0_types.php';
require_once __DIR__ . '/sqlgen_v1.1.0_types.php';

$VERSION_NUM = 1100;

$types = getV1_1_0_Types();
$buf = '';

foreach ($types as $type) {
    $buf .= "CREATE TYPE {$type->type->pgName};\n";
}

foreach ($types as $type) {
    $buf .= $type->toSQL($VERSION_NUM, EXT_NAME) . "\n";;
}

$buf .= "\n\n-- Cross types ops\n";

/** @var array<string, Type[]> $CROSS_TYPES */
$CROSS_TYPES = buildCrossTypes(V1_1_0_UINT_TYPES, V1_1_0_INT_TYPES);

foreach (genSQLForCrossTypes($types, $CROSS_TYPES) as $typConfig) {
    $buf .= $typConfig->toSQL($VERSION_NUM, EXT_NAME) . "\n\n";
}

foreach (buildV1_0_0_CrossTypesSQL($types) as $typConfig) {
    $buf .= $typConfig->toSQL($VERSION_NUM, EXT_NAME) . "\n\n";
}

file_put_contents("uint128--1.0.1--1.1.0.sql", $buf);
echo "uint128--1.0.1--1.1.0.sql successfully generated\n";

include __DIR__ . '/testgen_v1.1.0.php';
