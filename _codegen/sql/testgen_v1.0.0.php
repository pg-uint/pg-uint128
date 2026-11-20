<?php

declare(strict_types=1);

require_once __DIR__ . '/sqlgen_v1.0.0_types.php';

$types = getV1_0_0_Types();

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
