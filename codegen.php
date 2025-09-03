<?php

if (!array_key_exists(1, $argv) || $argv[1] === "--c-only") {
    include __DIR__ . '/_codegen/c/cmpgen.php';
    include __DIR__ . '/_codegen/c/arithmgen.php';
    include __DIR__ . '/_codegen/c/bitwisegen.php';
    include __DIR__ . '/_codegen/c/castsgen.php';
    include __DIR__ . '/_codegen/c/agggen.php';
    include __DIR__ . '/_codegen/c/seriesgen.php';
    include __DIR__ . '/_codegen/c/rangegen.php';
}

if (!array_key_exists(1, $argv) || $argv[1] === "--sql-only") {
    include __DIR__ . '/_codegen/sql/sqlgen_v1.0.0.php';
    include __DIR__ . '/_codegen/sql/sqlgen_v1.1.0.php';

    $v1_0_0 = file_get_contents(__DIR__ . '/uint128--1.0.0.sql');
    $v1_1_0 = file_get_contents(__DIR__ . '/uint128--1.0.1--1.1.0.sql');

    file_put_contents(__DIR__ . '/uint128--1.1.0.sql', $v1_0_0 . "--\n-- v1.1.0\n--\n\n" . $v1_1_0);
}
