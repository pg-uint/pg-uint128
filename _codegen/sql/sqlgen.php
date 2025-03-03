<?php

declare(strict_types=1);

require_once __DIR__ . '/../core/index.php';

$extName = 'uint128';

function genSQLCmpFunc(Op $op, Type $leftType, Type $rightType): string
{
    global $extName;

    $funcName = getTypeOpFuncName($leftType, $rightType, $op);

    return <<<EOL
CREATE FUNCTION $funcName($leftType->pgName, $rightType->pgName) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '\$libdir/$extName', '$funcName';
EOL;
}

function genSQLArithmeticFunc(Op $op, Type $leftType, Type $rightType): string
{
    global $extName;

    $funcName = getTypeOpFuncName($leftType, $rightType, $op);

    return <<<EOL
CREATE FUNCTION $funcName($leftType->pgName, $rightType->pgName) RETURNS {$leftType->pgName}
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '$funcName';
EOL;
}

/**
 * @return array{0: string, 1: string}
 */
function genSQLTestForCmpOp(Op $op, Type $leftType, Type $rightType): array
{
    if (!$op->isCMP()) {
        throw new InvalidArgumentException("Op $op->value is not comparison op");
    }

    $opSign = $op->config()->sign;

    $ops = match ($op) {
        Op::Eq => [['1', '1', 't'], ['1', '0', 'f']],
        Op::Ne => [['1', '0', 't'], ['0', '0', 'f']],

        Op::Gt => [['1', '0', 't'], ['0', '1', 'f']],
        Op::Lt => [['0', '1', 't'], ['1', '0', 'f']],

        Op::Ge => [['1', '0', 't'], ['0', '1', 'f'], ['1', '1', 't']],
        Op::Le => [['0', '1', 't'], ['1', '0', 'f'], ['1', '1', 't']],
    };

    $sql = '';
    $expected = '';

    foreach ($ops as $op) {
        $q = "SELECT $op[0]::$leftType->pgName $opSign $op[1]::$rightType->pgName;\n";

        $sql .= $q;

        $expected .= $q;
        $expected .= genSqlExpectedPaddedValue("?column?", $op[2], false);
    }

    return [$sql, $expected];
}

/**
 * @return array{0: string, 1: string}
 */
function genSQLTestForOverflowOp(Op $op, Type $leftType, Type $rightType): array
{
    if (!$op->canOverflow()) {
        throw new InvalidArgumentException("Op $op->value cannot overflow");
    }

    $opSign = $op->config()->sign;

    [$leftVal, $rightVal] = match ($op) {
        Op::Add => [$leftType->maxValue, '1'],
        Op::Sub => [$leftType->getPgSqlMinVal(), '1'],
        Op::Mul => [$leftType->maxValue, '2'],
    };

    $sql = "SELECT $leftVal::$leftType->pgName $opSign $rightVal::$rightType->pgName;\n";

    $expected = $sql;
    $expected .= "ERROR:  $leftType->pgName out of range\n";

    return [$sql, $expected];
}

/**
 * @return array{0: string, 1: string}
 */
function genSQLTestForArithmOp(Op $op, Type $leftType, Type $rightType): array
{
    if (!$op->isArithmetic()) {
        throw new InvalidArgumentException("Op $op->value is not arithmetic op");
    }

    $opSign = $op->config()->sign;

    $sql = "SELECT 120::$leftType->pgName $opSign 10::$rightType->pgName;\n";

    $expectedVal = match ($op) {
        Op::Add => '130',
        Op::Sub => '110',
        Op::Mul => '1200',
        Op::Div => '12',
        Op::Mod => '0'
    };

    $expected = $sql;
    $expected .= genSqlExpectedPaddedValue("?column?", $expectedVal, !$leftType->isUnsigned && $leftType !== INT128);

    if ($leftType !== $rightType) {
        // Ops that could potentially overflow has to be checked for overflow
        if ($op->canOverflow()) {
            [$overflowSql, $overflowExpected] = genSQLTestForOverflowOp($op, $leftType, $rightType);

            $sql .= $overflowSql;
            $expected .= $overflowExpected;
        }

        // Division ops has to be checked for division by zero
        if ($op->isDivision()) {
            $q = "SELECT 1::$leftType->pgName $opSign 0::$rightType->pgName;\n";

            $sql .= $q;
            $expected .= $q . "ERROR:  division by zero\n";
        }

        // Check mixed signed and unsigned arithmetic
        if (!$leftType->isUnsigned && $rightType->isUnsigned) {
            $q = "SELECT (-120)::$leftType->pgName $opSign 10::$rightType->pgName;\n";

            $expectedVal = match ($op) {
                Op::Add => '-110',
                Op::Sub => '-130',
                Op::Mul => '-1200',
                Op::Div => '0',
                Op::Mod => '-120'
            };

            $sql .= $q;

            $expected .= $q;
            $expected .= genSqlExpectedPaddedValue("?column?", $expectedVal, !$leftType->isUnsigned && $leftType !== INT128);
        }
    }

    return [$sql, $expected];
}

function genSQLGenerateSeries(Type $type): string
{
    global $extName;

    $funcName = getGenSeriesFuncName($type);
    $stepFuncName = getGenSeriesStepFuncName($type);
    $supportFuncName = getGenSeriesSupportFuncName($type);

    return <<<SQL
CREATE FUNCTION $supportFuncName(internal)
RETURNS internal
AS '\$libdir/$extName', '$supportFuncName'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE FUNCTION generate_series($type->pgName, $type->pgName)
RETURNS SETOF $type->pgName
AS '\$libdir/$extName', '$funcName'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT SUPPORT $supportFuncName;

CREATE FUNCTION generate_series($type->pgName, $type->pgName, $type->pgName)
RETURNS SETOF $type->pgName
AS '\$libdir/$extName', '$stepFuncName'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT SUPPORT $supportFuncName;
SQL;
}

/**
 * @return array{0: string, 1: string}
 */
function genSQLTestGenerateSeries(Type $type): array
{
    $sql = "";
    $expected = "";

    $q = "SELECT s FROM generate_series(1::$type->pgName, 10::$type->pgName) s;\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValues(
        "s",
        array_map(fn(int $n) => (string)$n, range(1, 10)),
        false,
    );

    // Test stepped

    $q = "SELECT s FROM generate_series(1::$type->pgName, 10::$type->pgName, 2::$type->pgName) s;\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValues(
        "s",
        array_map(fn(int $n) => (string)$n, range(1, 10, 2)),
        false,
    );

    // Test overflow (actually I don't know how to produce overflow because of strict typing in UINT it seems impossible)

//    $rangeEnd = match ($type) {
//        UINT16 => '65545',
//        UINT32 => '4294967305',
//        UINT64 => '18446744073709551625',
//        UINT128 => '340282366920938463463374607431768211465',
//        INT128 => '170141183460469231731687303715884105737',
//        default => throw new InvalidArgumentException("Unknown type {$type->pgName}"),
//    };
//
//    $q = "SELECT s FROM generate_series($type->maxValue::$type->pgName, $rangeEnd::$type->pgName) s;\n";
//
//    $sql .= $q;
//    $expected .= $q;
//    $expected .= genSqlExpectedPaddedValue("s", $type->maxValue, false);

    return [$sql, $expected];
}

function genSQLRanges(Type $type): string
{
    global $extName;

    $rangeTypName = $type->getRangePgTypeName();

    $canonicalFuncName = getRangeCanonicalFuncName($type);
    $subDiffFuncName = getRangeSubDiffFuncName($type);

    return <<<SQL
CREATE TYPE $rangeTypName;

CREATE OR REPLACE FUNCTION $canonicalFuncName($rangeTypName)
RETURNS $rangeTypName
AS '\$libdir/$extName', '$canonicalFuncName'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE OR REPLACE FUNCTION $subDiffFuncName($type->pgName, $type->pgName)
RETURNS double precision
AS '\$libdir/$extName', '$subDiffFuncName'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE TYPE $rangeTypName AS RANGE (
    SUBTYPE = $type->pgName,
    SUBTYPE_OPCLASS = {$type->pgName}_ops,
    CANONICAL = $canonicalFuncName,
    SUBTYPE_DIFF = $subDiffFuncName
);
SQL;
}

/**
 * @return array{0: string, 1: string}
 */
function genSQLTestRanges(Type $type): array
{
    $sql = "";
    $expected = "";

    $rangeTypName = $type->getRangePgTypeName();

    // Test constructor
    $q = "SELECT $rangeTypName(0, 10);\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue($rangeTypName, "[0,10)", false);

    // Test constructor (max possible range)
    $q = "SELECT $rangeTypName({$type->getPgSqlMinVal()}::$type->pgName, $type->maxValue::$type->pgName);\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue($rangeTypName, "[$type->minValue,$type->maxValue)", false);

    // Test constructor (max possible range overflow)
    $q = "SELECT $rangeTypName({$type->getPgSqlMinVal()}::$type->pgName, $type->maxValue::$type->pgName, '[]');\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= "ERROR:  $type->pgName out of range\n";

    // Test upper
    $q = "SELECT upper($rangeTypName(0, 10));\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("upper", "10", false);

    // Test lower
    $q = "SELECT lower($rangeTypName(0, 10));\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("lower", "0", false);

    // Test isempty
    $q = "SELECT isempty($rangeTypName(0, 10));\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("isempty", "f", false);

    // Test containment
    $q = "SELECT $rangeTypName(0, 10) @> 9::$type->pgName;\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("?column?", "t", false);

    $q = "SELECT $rangeTypName(0, 10) @> 10::$type->pgName;\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("?column?", "f", false);

    // Test overlapping
    $q = "SELECT $rangeTypName(0, 10) && $rangeTypName(10,20);\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("?column?", "f", false);

    $q = "SELECT $rangeTypName(0, 10) && $rangeTypName(9,20);\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("?column?", "t", false);

    // Test subtract
    $q = "SELECT $rangeTypName(5, 10) - $rangeTypName(5, 10);\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("?column?", "empty", false);

    $q = "SELECT $rangeTypName(5, 10) - $rangeTypName(5, 9);\n";

    $sql .= $q;
    $expected .= $q;
    $expected .= genSqlExpectedPaddedValue("?column?", "[9,10)", false);

    // Test GIST constraints
    $tmpTbl = "test_$rangeTypName";

    $q = <<<SQL
CREATE TEMPORARY TABLE $tmpTbl (
    r $rangeTypName,

    EXCLUDE USING GIST (r WITH &&)
);

INSERT INTO $tmpTbl (r) VALUES ($rangeTypName(0, 10));
INSERT INTO $tmpTbl (r) VALUES ($rangeTypName(10, 20));
INSERT INTO $tmpTbl (r) VALUES ($rangeTypName(19, 30));

DROP TABLE $tmpTbl;

SQL;

    $sql .= $q;
    $expected .= <<<EOL
CREATE TEMPORARY TABLE $tmpTbl (
    r $rangeTypName,
    EXCLUDE USING GIST (r WITH &&)
);
INSERT INTO $tmpTbl (r) VALUES ($rangeTypName(0, 10));
INSERT INTO $tmpTbl (r) VALUES ($rangeTypName(10, 20));
INSERT INTO $tmpTbl (r) VALUES ($rangeTypName(19, 30));
ERROR:  conflicting key value violates exclusion constraint "{$tmpTbl}_r_excl"
DETAIL:  Key (r)=([19,30)) conflicts with existing key (r)=([10,20)).
DROP TABLE $tmpTbl;

EOL;

    return [$sql, $expected];
}

class TypeOpConfig
{
    /**
     * @param array<Type> $types
     */
    public function __construct(
        public readonly Op $op,
        public readonly array $types = [],
        public readonly bool $inverseTypes = false,
    ) {
    }

    public function getSQLFunc(string $extName, TypeConfig $parent, bool $crossTypesOnly): string
    {
        $cmpFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;

            $sql = "";

            if (!$crossTypesOnly) {
                $sql .= genSQLCmpFunc($op, $parent->type, $parent->type) . "\n\n";
            }

            foreach ($this->types as $EXT_TYPE) {
                $sql .= genSQLCmpFunc($op, $parent->type, $EXT_TYPE) . "\n\n";

                if ($this->inverseTypes) {
                    $sql .= genSQLCmpFunc($op, $EXT_TYPE, $parent->type) . "\n\n";
                }
            }

            return $sql;
        };

        $arithmFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;

            $sql = '';

            if (!$crossTypesOnly) {
                $sql .= genSQLArithmeticFunc($op, $parent->type, $parent->type) . "\n\n";
            }

            foreach ($this->types as $EXT_TYPE) {
                $sql .= genSQLArithmeticFunc($op, $parent->type, $EXT_TYPE) . "\n\n";

                if ($this->inverseTypes) {
                    $sql .= genSQLArithmeticFunc($op, $EXT_TYPE, $parent->type) . "\n\n";
                }
            }

            return $sql;
        };

        $bitwiseShiftFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;
            $sql = '';

            if (!$crossTypesOnly) {
                $funcName = "{$parent->type->pgName}_$op->value";

                $sql .= <<<EOT
CREATE FUNCTION $funcName({$parent->type->pgName}, int4) RETURNS {$parent->type->pgName}
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '$funcName';


EOT;
            }

            return $sql;
        };

        $bitwiseFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;
            $sql = '';

            if (!$crossTypesOnly) {
                $funcName = "{$parent->type->pgName}_$op->value";

                $sql .= <<<EOT
CREATE FUNCTION $funcName({$parent->type->pgName}, {$parent->type->pgName}) RETURNS {$parent->type->pgName}
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '$funcName';


EOT;
            }

            return $sql;
        };

        $notFunc = function () use ($extName, $parent): string {
            $op = $this->op;

            $funcName = "{$parent->type->pgName}_$op->value";

            return <<<EOT
CREATE FUNCTION $funcName({$parent->type->pgName}) RETURNS {$parent->type->pgName}
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '$funcName';

EOT;
        };

        return match ($this->op) {
            Op::Eq, Op::Ne, Op::Gt, Op::Lt, Op::Ge, Op::Le => $cmpFunc(),
            Op::Add, Op::Sub, Op::Mul, Op::Div, Op::Mod => $arithmFunc(),
            Op::Xor, Op::And, Op::Or => $bitwiseFunc(),
            Op::Shl, Op::Shr => $bitwiseShiftFunc(),
            Op::Not => $notFunc(),
        };
    }

    public function getSQLOperator(string $extName, TypeConfig $parent, bool $crossTypesOnly): string
    {
        $cmpFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;
            $cfg = $op->config();

            $sql = '';

            if (!$crossTypesOnly) {
                $funcName = getTypeOpFuncName($parent->type, $parent->type, $op);

                $sql .= $cfg->toSQL(
                        $funcName,
                        $parent->name,
                        $parent->name
                    ) . "\n";
            }

            foreach ($this->types as $EXT_TYPE) {
                $funcName = getTypeOpFuncName($parent->type, $EXT_TYPE, $op);

                $sql .= $cfg->toSQL($funcName, $parent->name, $EXT_TYPE->pgName) . "\n";

                if ($this->inverseTypes) {
                    $funcName = getTypeOpFuncName($EXT_TYPE, $parent->type, $op);

                    $sql .= $cfg->toSQL($funcName, $EXT_TYPE->pgName, $parent->name) . "\n";
                }
            }

            return $sql;
        };

        $arithmFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;
            $cfg = $op->config();

            $sql = '';

            if (!$crossTypesOnly) {
                $funcName = getTypeOpFuncName($parent->type, $parent->type, $op);

                $sql = $cfg->toSQL($funcName, $parent->name, $parent->name) . "\n";
            }

            foreach ($this->types as $EXT_TYPE) {
                $funcName = getTypeOpFuncName($parent->type, $EXT_TYPE, $op);

                $sql .= $cfg->toSQL($funcName, $parent->name, $EXT_TYPE->pgName) . "\n";

                if ($this->inverseTypes) {
                    $funcName = getTypeOpFuncName($EXT_TYPE, $parent->type, $op);

                    $sql .= $cfg->toSQL($funcName, $EXT_TYPE->pgName, $parent->name) . "\n";
                }
            }

            return $sql;
        };

        $bitwiseFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;
            $cfg = $op->config();

            $sql = '';

            if (!$crossTypesOnly) {
                $funcName = "{$parent->type->pgName}_{$op->value}";

                $sql = $cfg->toSQL($funcName, $parent->name, $parent->name) . "\n";
            }

            foreach ($this->types as $EXT_TYPE) {
                $funcName = getTypeOpFuncName($parent->type, $EXT_TYPE, $op);

                $sql .= $cfg->toSQL($funcName, $parent->name, $EXT_TYPE->pgName) . "\n";

                if ($this->inverseTypes) {
                    $funcName = getTypeOpFuncName($EXT_TYPE, $parent->type, $op);

                    $sql .= $cfg->toSQL($funcName, $EXT_TYPE->pgName, $parent->name) . "\n";
                }
            }

            return $sql;
        };

        $bitwiseShiftFunc = function () use ($extName, $parent, $crossTypesOnly): string {
            $op = $this->op;
            $cfg = $op->config();

            if (!$crossTypesOnly) {
                $sql = $cfg->toSQL("{$parent->name}_$op->value", $parent->name, 'int4') . "\n";
            } else {
                $sql = '';
            }

            return $sql;
        };

        $notFunc = function () use ($extName, $parent): string {
            $op = $this->op;
            $cfg = $op->config();

            return $cfg->toSQL("{$parent->name}_$op->value", null, $parent->name) . "\n";
        };

        $sql = match ($this->op) {
            Op::Eq, Op::Ne, Op::Gt, Op::Lt, Op::Ge, Op::Le => $cmpFunc(),
            Op::Add, Op::Sub, Op::Mul, Op::Div, Op::Mod => $arithmFunc(),
            Op::Xor, Op::And, Op::Or => $bitwiseFunc(),
            Op::Shl, Op::Shr => $bitwiseShiftFunc(),
            Op::Not => $notFunc(),
        };

        return $sql;
    }

    /**
     * @return array{0: string, 1: string}
     */
    public function getSQLTest(TypeConfig $parent, bool $crossTypesOnly): array
    {
        $cmpFunc = function () use ($parent, $crossTypesOnly): array {
            $sql = '';
            $expected = '';

            if (!$crossTypesOnly) {
                [$cQ, $cE] = genSQLTestForCmpOp($this->op, $parent->type, $parent->type);

                $sql .= $cQ;
                $expected .= $cE;
            }

            foreach ($this->types as $EXT_TYPE) {
                [$cQ, $cE] = genSQLTestForCmpOp($this->op, $parent->type, $EXT_TYPE);

                $sql .= $cQ;
                $expected .= $cE;

                if ($this->inverseTypes) {
                    [$cQ, $cE] = genSQLTestForCmpOp($this->op, $EXT_TYPE, $parent->type);

                    $sql .= $cQ;
                    $expected .= $cE;
                }
            }

            if ($sql !== '') {
                $sql .= "\n";
            }

            return [$sql, $expected];
        };

        $arithmFunc = function () use ($parent, $crossTypesOnly): array {
            $sql = '';
            $expected = '';

            if (!$crossTypesOnly) {
                [$sq, $ex] = genSQLTestForArithmOp($this->op, $parent->type, $parent->type);
                $sql .= $sq;
                $expected .= $ex;
            }

            foreach ($this->types as $EXT_TYPE) {
                [$sq, $ex] = genSQLTestForArithmOp($this->op, $parent->type, $EXT_TYPE);
                $sql .= $sq;
                $expected .= $ex;

                if ($this->inverseTypes) {
                    [$sq, $ex] = genSQLTestForArithmOp($this->op, $EXT_TYPE, $parent->type);
                    $sql .= $sq;
                    $expected .= $ex;
                }
            }

            if ($sql !== '') {
                $sql .= "\n";
            }

            return [$sql, $expected];
        };

        [$sql, $expected] = match ($this->op) {
            Op::Eq, Op::Ne, Op::Gt, Op::Lt, Op::Ge, Op::Le => $cmpFunc(),
            Op::Add, Op::Sub, Op::Mul, Op::Div, Op::Mod => $arithmFunc(),
            default => '',
//            Op::Xor, Op::And, Op::Or => $bitwiseFunc(),
//            Op::Shl, Op::Shr => $bitwiseShiftFunc(),
//            Op::Not => $notFunc(),
        };

        return [$sql, $expected];
    }
}

class TypeConfig
{
    public readonly string $name;

    /**
     * @param array<TypeOpConfig> $ops
     * @param array<Type> $casts
     * @param array<AggOp> $aggOps
     */
    public function __construct(
        public readonly Type $type,
        public readonly string $alignment,
        public readonly bool $passByValue = true,
        public readonly array $ops = [],
        public readonly array $casts = [],
        public readonly bool $crossTypesOnly = false,
        public readonly array $aggOps = [],
    ) {
        $this->name = $type->pgName;
    }

    public function toSQL(string $extName): string
    {
        $sql = '';

        if (!$this->crossTypesOnly) {
            $sql .= "-- Type {$this->type->pgName} block\n\n";

            $passByValue = $this->passByValue ? 'PASSEDBYVALUE,' : '--PASSEDBYVALUE,';
            $byteSize = $this->type->bitSize / 8;

            $sql .= <<<EOL
CREATE FUNCTION {$this->name}_in(cstring) RETURNS {$this->name}
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_in';

CREATE FUNCTION {$this->name}_out($this->name) RETURNS cstring
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_out';

CREATE FUNCTION {$this->name}_recv(internal) RETURNS {$this->name}
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_recv';

CREATE FUNCTION {$this->name}_send($this->name) RETURNS bytea
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_send';

CREATE TYPE $this->name (
    INPUT = {$this->name}_in,
    OUTPUT = {$this->name}_out,
    RECEIVE = {$this->name}_recv,
    SEND = {$this->name}_send,
    INTERNALLENGTH = $byteSize,
    {$passByValue}
    ALIGNMENT = {$this->alignment}
);


EOL;

            $sql .= "\n-- Inout casts block\n\n";

            // IN-OUT casts
            foreach (['double precision', 'numeric', 'real'] as $inoutType) {
                $sql .= "CREATE CAST ($inoutType AS $this->name) WITH INOUT AS ASSIGNMENT;\n";
                $sql .= "CREATE CAST ($this->name AS $inoutType) WITH INOUT AS IMPLICIT;\n";

                $sql .= "\n";
            }
        }

        $sql .= "\n-- Casts block";

        foreach ($this->casts as $EXT_TYPE) {
            $EXT_TYPE = $EXT_TYPE->pgName;

            $sql .= "\n\n";

            $sql .= <<<EOL
CREATE FUNCTION {$this->name}_from_$EXT_TYPE($EXT_TYPE) RETURNS {$this->name}
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_from_$EXT_TYPE';

CREATE FUNCTION {$this->name}_to_$EXT_TYPE($this->name) RETURNS {$EXT_TYPE}
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_to_$EXT_TYPE';


EOL;

            $sql .= "CREATE CAST ($EXT_TYPE AS $this->name) WITH FUNCTION {$this->name}_from_$EXT_TYPE($EXT_TYPE) AS IMPLICIT;\n";
            $sql .= "CREATE CAST ($this->name AS $EXT_TYPE) WITH FUNCTION {$this->name}_to_$EXT_TYPE($this->name) AS IMPLICIT;\n";
        }

        $sql .= "\n-- Ops block\n\n";

        foreach ($this->ops as $op) {
            $sql .= $op->getSQLFunc($extName, $this, $this->crossTypesOnly) . "\n";
        }

        foreach ($this->ops as $op) {
            $sql .= $op->getSQLOperator($extName, $this, $this->crossTypesOnly) . "\n";
        }

        if (!$this->crossTypesOnly) {
            $sql .= "\n-- Index ops block\n\n";
            $sql .= <<<EOT
CREATE FUNCTION {$this->name}_cmp($this->name, $this->name) RETURNS int
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_cmp';

CREATE FUNCTION {$this->name}_hash($this->name) RETURNS integer
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '\$libdir/$extName', '{$this->name}_hash';


CREATE OPERATOR CLASS {$this->name}_ops
DEFAULT FOR TYPE $this->name USING btree FAMILY integer_ops AS
    OPERATOR 1 <,
    OPERATOR 2 <=,
    OPERATOR 3 =,
    OPERATOR 4 >=,
    OPERATOR 5 >,
    FUNCTION 1 {$this->name}_cmp($this->name, $this->name)
;

CREATE OPERATOR CLASS {$this->name}_ops
DEFAULT FOR TYPE $this->name USING hash FAMILY integer_ops AS
    OPERATOR        1       = ,
    FUNCTION        1       {$this->name}_hash($this->name);

-- pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT '$this->name'::regtype AS oid) typ

    JOIN pg_opclass ON pg_opclass.opcintype = typ.oid
    
    -- Ensure BTREE operator family
    JOIN pg_am ON pg_am.oid = pg_opclass.opcmethod AND pg_am.amname = 'btree'
),
operators AS (
    SELECT op.oid, 'pg_operator'::regclass::oid AS refclassid
    FROM typ
    JOIN pg_operator op ON 
        op.oprname IN ('<', '<=', '=', '>=', '>')
        AND op.oprleft = typ.typ_oid
        AND op.oprright = typ.typ_oid
),
fn AS (
    SELECT
        '{$this->name}_cmp($this->name, $this->name)'::regprocedure::oid AS oid,
        'pg_proc'::regclass::oid AS refclassid
),
deps AS (
    SELECT * FROM operators
    UNION ALL
    SELECT * FROM fn
)
INSERT INTO pg_depend (classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype)
SELECT DISTINCT ON (typ.opc_oid, deps.oid)
    'pg_opclass'::regclass::oid AS classid,
    typ.opc_oid AS objid,
    0 AS objsubid,
    deps.refclassid,
    deps.oid AS refobjid,
    0 AS refobjsubid,
    'n' AS deptype

FROM typ, deps

WHERE NOT EXISTS (
	SELECT 1
	FROM pg_depend
	WHERE 
		pg_depend.classid = 'pg_opclass'::regclass::oid
		AND pg_depend.objid = typ.opc_oid
		AND pg_depend.refclassid = deps.refclassid
		AND pg_depend.refobjid = deps.oid
)

ORDER BY typ.opc_oid, deps.oid;

-- HASH OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT '$this->name'::regtype AS oid) typ

    JOIN pg_opclass ON pg_opclass.opcintype = typ.oid
    
    -- Ensure BTREE operator family
    JOIN pg_am ON pg_am.oid = pg_opclass.opcmethod AND pg_am.amname = 'hash'
),
operators AS (
    SELECT op.oid, 'pg_operator'::regclass::oid AS refclassid
    FROM typ
    JOIN pg_operator op ON
        op.oprname = '='
        AND op.oprleft = typ.typ_oid
        AND op.oprright = typ.typ_oid
),
fn AS (
    SELECT
        '{$this->name}_hash($this->name)'::regprocedure::oid AS oid,
        'pg_proc'::regclass::oid AS refclassid
),
deps AS (
    SELECT * FROM operators
    UNION ALL
    SELECT * FROM fn
)
INSERT INTO pg_depend (classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype)
SELECT DISTINCT ON (typ.opc_oid, deps.oid)
    'pg_opclass'::regclass::oid AS classid,
    typ.opc_oid AS objid,
    0 AS objsubid,
    deps.refclassid,
    deps.oid AS refobjid,
    0 AS refobjsubid,
    'n' AS deptype

FROM typ, deps

WHERE NOT EXISTS (
	SELECT 1
	FROM pg_depend
	WHERE 
		pg_depend.classid = 'pg_opclass'::regclass::oid 
		AND pg_depend.objid = typ.opc_oid
		AND pg_depend.refclassid = deps.refclassid
		AND pg_depend.refobjid = deps.oid
)

ORDER BY typ.opc_oid, deps.oid;
EOT;
        }

        if (!$this->crossTypesOnly) {
            $sql .= "\n-- Agg ops block\n\n";

            $avgAggFuncGenerated = false;

            foreach ($this->aggOps as $aggOp) {
                if ($aggOp === AggOp::Sum || $aggOp === AggOp::Avg) {
                    $sql .= $aggOp->getSql($extName, $this->type, !$avgAggFuncGenerated);
                    $avgAggFuncGenerated = true;
                } else {
                    $sql .= $aggOp->getSql($extName, $this->type, true);
                }

                $sql .= "\n";
            }

            $sql .= "\n-- Generate series block\n\n";

            $sql .= genSQLGenerateSeries($this->type);

            $sql .= "\n";

            $sql .= "\n-- Ranges block\n\n";

            $sql .= genSQLRanges($this->type);

            $sql .= "\n";
        }

        $sql .= "\n";

        return $sql;
    }

    /**
     * @return array{0: string, 1: string}
     */
    public function toSQLTests(): array
    {
        $sql = "-- Testing $this->name\n\n";
        $expected = "-- Testing $this->name\n";

        $sql .= "-- Ops block\n\n";
        $expected .= "-- Ops block\n";

        foreach ($this->ops as $op) {
            [$tSql, $tExpected] = $op->getSQLTest($this, $this->crossTypesOnly);
            $sql .= $tSql;
            $expected .= $tExpected;
        }

        $sql .= "-- Agg ops block\n\n";
        $expected .= "-- Agg ops block\n";

        foreach ($this->aggOps as $op) {
            [$tSql, $tExpected] = $op->getSqlTest($this->type);
            $sql .= $tSql;
            $expected .= $tExpected;
        }

        $sql .= "\n";

        $sql .= "-- Generate series block\n\n";
        $expected .= "-- Generate series block\n";

        [$tSql, $tExpected] = genSQLTestGenerateSeries($this->type);
        $sql .= $tSql;
        $expected .= $tExpected;

        $sql .= "\n";

        $sql .= "-- Ranges block\n\n";
        $expected .= "-- Ranges block\n";

        [$tSql, $tExpected] = genSQLTestRanges($this->type);
        $sql .= $tSql;
        $expected .= $tExpected;

        return [$sql, $expected];
    }
}

const INT_CAST_TYPES = [INT16, INT32, INT64];

const AGG_OPS = [AggOp::Sum, AggOp::Avg, AggOp::Min, AggOp::Max];

/** @var array<TypeConfig> $types */
$types = [
    new TypeConfig(
        type: UINT128,
        alignment: 'char',
        passByValue: false,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: array_merge(INT_CAST_TYPES, [UUID]),
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT64,
        alignment: 'double',
        passByValue: true,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: INT_CAST_TYPES,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT32,
        alignment: 'int4',
        passByValue: true,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: INT_CAST_TYPES,
        aggOps: AGG_OPS,
    ),
    new TypeConfig(
        type: UINT16,
        alignment: 'int2',
        passByValue: true,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: INT_CAST_TYPES,
        aggOps: AGG_OPS,
    ),

    new TypeConfig(
        type: INT128,
        alignment: 'char',
        passByValue: false,
        ops: [
            new TypeOpConfig(Op::Eq, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ne, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Gt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Lt, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Ge, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Le, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Add, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Sub, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mul, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Div, types: INT_CAST_TYPES, inverseTypes: true),
            new TypeOpConfig(Op::Mod, types: INT_CAST_TYPES, inverseTypes: true),

            new TypeOpConfig(Op::Xor),
            new TypeOpConfig(Op::And),
            new TypeOpConfig(Op::Or),
            new TypeOpConfig(Op::Not),
            new TypeOpConfig(Op::Shl),
            new TypeOpConfig(Op::Shr),
        ],
        casts: array_merge(INT_CAST_TYPES),
        aggOps: AGG_OPS,
    ),
];

$buf = '';

foreach ($types as $type) {
    $buf .= "CREATE TYPE {$type->type->pgName};\n";
}

$buf .= "\n";

foreach ($types as $type) {
    $buf .= $type->toSQL($extName) . "\n";
}

$buf .= "\n\n-- Cross types ops\n";


const CROSS_TYPES = [
    // UINT16
    'uint2' => [UINT32, UINT64, UINT128, INT128],
    // UINT32
    'uint4' => [UINT16, UINT64, UINT128, INT128],
    // UINT64
    'uint8' =>  [UINT16, UINT32, UINT128, INT128],
    // UINT128
    'uint16' => [UINT16, UINT32, UINT64, INT128],
    // INT128
    'int16' =>  [UINT16, UINT32, UINT64, UINT128],
];

/** @var array<string, string[]> $processedCastPairs */
$processedCastPairs = [];

// Cross types conversions
foreach ($types as $type) {
    /** @var array<Type> $crossTypes */
    $crossTypes = CROSS_TYPES[$type->type->pgName] ?? [];
    if ($crossTypes === []) {
        continue;
    }

    $typConfig = new TypeConfig(
        type: $type->type,
        alignment: $type->alignment,
        passByValue: $type->passByValue,
        ops: array_values(array_filter(array_map(function (TypeOpConfig $typeCfg) use ($crossTypes) {
            return match ($typeCfg->op) {
                // Bitwise doesn't scale between types
                Op::Not, Op::And, Op::Or, Op::Xor, Op::Shl, Op::Shr => null,
                default => new TypeOpConfig(
                    op: $typeCfg->op,
                    types: $crossTypes,
                )
            };
        }, $type->ops))),
        // Prevent generation duplicate casts
        casts: array_values(
            array_filter($crossTypes, static function (Type $crossType) use ($type, $processedCastPairs) {
                if (!array_key_exists($crossType->pgName, $processedCastPairs)) {
                    return true;
                }

                return !in_array($type->name, $processedCastPairs[$crossType->pgName], true);
            })
        ),
        crossTypesOnly: true,
    );

    foreach ($crossTypes as $crossType) {
        $processedCastPairs[$type->type->pgName][] = $crossType->pgName;
        $processedCastPairs[$crossType->pgName][] = $type->type->pgName;
    }

    $buf .= $typConfig->toSQL($extName) . "\n\n";
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
