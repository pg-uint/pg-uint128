<?php

declare(strict_types=1);

require_once __DIR__ . '/sql_gen_core.php';
require_once __DIR__ . '/sqlgen_v1.1.1_types.php';

$VERSION_NUM = 1110;

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
    $buf .= $type->toSQL($VERSION_NUM, EXT_NAME) . "\n";

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

include __DIR__ . '/testgen_v1.1.1.php';
