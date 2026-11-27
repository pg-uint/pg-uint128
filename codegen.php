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
    // Released SQL files are frozen; generate only the current version.
    include __DIR__ . '/_codegen/sql/sqlgen_v1.4.0.php';
}

if (!array_key_exists(1, $argv) || $argv[1] === "--tests-only") {
    include __DIR__ . '/_codegen/sql/testgen_v1.0.0.php';
    include __DIR__ . '/_codegen/sql/testgen_v1.1.0.php';
    include __DIR__ . '/_codegen/sql/testgen_v1.1.1.php';
}
