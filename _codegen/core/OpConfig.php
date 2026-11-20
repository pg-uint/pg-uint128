<?php

declare(strict_types=1);

class OpConfig
{
    public function __construct(
        public readonly string $cOp,
        public readonly string $sign,
        public readonly ?string $commutator = null,
        public readonly ?string $negator = null,
        public readonly ?string $restrict = null,
        public readonly ?string $join = null,
        public readonly bool $hashes = false,
        public readonly bool $merges = false,
        public readonly bool $hasLeftArg = true,
        public readonly bool $commutatorSameTypeOnly = false,
    ) {
    }

    public function toSQL(string $procedure, ?string $leftType, string $rightType): string
    {
        $sql = "CREATE OPERATOR {$this->sign} (\n";

        $parts = [];

        if ($leftType) {
            $parts[] = "LEFTARG={$leftType}";
        }

        $parts[] = "RIGHTARG={$rightType}";

        $parts[] = "PROCEDURE={$procedure}";

        // Cross-type addition returns the left type, so its reverse has a different result type.
        if ($this->commutator && (!$this->commutatorSameTypeOnly || $leftType === $rightType)) {
            $parts[] = "COMMUTATOR = {$this->commutator}";
        }

        if ($this->negator) {
            $parts[] = "NEGATOR = {$this->negator}";
        }

        if ($this->restrict) {
            $parts[] = "RESTRICT = {$this->restrict}";
        }

        if ($this->join) {
            $parts[] = "JOIN = {$this->join}";
        }

        if ($this->hashes) {
            $parts[] = "HASHES";
        }

        if ($this->merges) {
            $parts[] = "MERGES";
        }

        $sql .= implode(",\n", array_map(fn(string $str) => "    {$str}", $parts)) . "\n";
        $sql .= ");\n";

        return $sql;
    }
}
