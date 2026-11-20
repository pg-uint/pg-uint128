<?php

declare(strict_types=1);

require_once __DIR__ . '/sqlgen_v1.1.0_types.php';

$types = getV1_1_0_Types();
$crossTests = [];
foreach (genSQLForCrossTypes($types, buildCrossTypes(V1_1_0_UINT_TYPES, V1_1_0_INT_TYPES)) as $typConfig) {
    $crossTests[$typConfig->type->pgName] = $typConfig->toSQLTests();
}

$crossTestsWithOldTypes = [];
foreach (buildV1_0_0_CrossTypesSQL($types) as $typConfig) {
    $crossTestsWithOldTypes[$typConfig->type->pgName] = $typConfig->toSQLTests();
}

@mkdir("sql");
@mkdir("expected");

foreach ($types as $type) {
    [$test, $expected] = $type->toSQLTests();

    $crossTest = $crossTests[$type->type->pgName] ?? [];
    if ($crossTest !== []) {
        $test .= "\n\n" . $crossTest[0];
        $expected .= $crossTest[1];
    }

    file_put_contents("sql/test_{$type->type->pgName}.sql", $test);
    file_put_contents("expected/test_{$type->type->pgName}.out", $expected);

    echo "sql/test_{$type->type->pgName}.sql successfully generated\n";
    echo "expected/test_{$type->type->pgName}.out successfully generated\n";
}

foreach ($crossTestsWithOldTypes as $oldTypName => [$test, $expected]) {
    $testFileName = "sql/test_1.1.0_{$oldTypName}.sql";
    $expectedFileName = "expected/test_1.1.0_{$oldTypName}.out";

    file_put_contents($testFileName, $test);
    file_put_contents($expectedFileName, $expected);

    echo "{$testFileName} successfully generated\n";
    echo "{$expectedFileName} successfully generated\n";
}

return;
