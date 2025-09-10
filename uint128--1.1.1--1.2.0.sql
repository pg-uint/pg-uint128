-- Type uint1 block

-- Cast functions uint1 block

CREATE OR REPLACE FUNCTION uint1_from_int1(int1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int1';

CREATE OR REPLACE FUNCTION uint1_from_int2(int2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int2';

CREATE OR REPLACE FUNCTION uint1_from_int4(int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int4';

CREATE OR REPLACE FUNCTION uint1_from_int8(int8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int8';

CREATE OR REPLACE FUNCTION uint1_from_int16(int16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int16';

CREATE OR REPLACE FUNCTION uint1_from_uint2(uint2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint2';

CREATE OR REPLACE FUNCTION uint1_from_uint4(uint4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint4';

CREATE OR REPLACE FUNCTION uint1_from_uint8(uint8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint8';

CREATE OR REPLACE FUNCTION uint1_from_uint16(uint16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint16';

CREATE OR REPLACE FUNCTION uint1_from_numeric(numeric) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_numeric';

CREATE OR REPLACE FUNCTION uint1_from_float4(float4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_float4';

CREATE OR REPLACE FUNCTION uint1_from_float8(float8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_float8';

CREATE OR REPLACE FUNCTION uint1_from_json(json) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_json';

CREATE OR REPLACE FUNCTION uint1_from_jsonb(jsonb) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_jsonb';

-- Type uint2 block

-- Cast functions uint2 block

CREATE OR REPLACE FUNCTION uint2_from_int1(int1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_int1';

CREATE OR REPLACE FUNCTION uint2_from_int2(int2) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_int2';

CREATE OR REPLACE FUNCTION uint2_from_int4(int4) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_int4';

CREATE OR REPLACE FUNCTION uint2_from_int8(int8) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_int8';

CREATE OR REPLACE FUNCTION uint2_from_int16(int16) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_int16';

CREATE OR REPLACE FUNCTION uint2_from_uint1(uint1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_uint1';

CREATE OR REPLACE FUNCTION uint2_from_uint4(uint4) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_uint4';

CREATE OR REPLACE FUNCTION uint2_from_uint8(uint8) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_uint8';

CREATE OR REPLACE FUNCTION uint2_from_uint16(uint16) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_uint16';

CREATE OR REPLACE FUNCTION uint2_from_numeric(numeric) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_numeric';

CREATE OR REPLACE FUNCTION uint2_from_float4(float4) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_float4';

CREATE OR REPLACE FUNCTION uint2_from_float8(float8) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_float8';

CREATE OR REPLACE FUNCTION uint2_from_json(json) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_json';

CREATE OR REPLACE FUNCTION uint2_from_jsonb(jsonb) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_jsonb';

-- Type uint4 block

-- Cast functions uint4 block

CREATE OR REPLACE FUNCTION uint4_from_int1(int1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_int1';

CREATE OR REPLACE FUNCTION uint4_from_int2(int2) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_int2';

CREATE OR REPLACE FUNCTION uint4_from_int4(int4) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_int4';

CREATE OR REPLACE FUNCTION uint4_from_int8(int8) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_int8';

CREATE OR REPLACE FUNCTION uint4_from_int16(int16) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_int16';

CREATE OR REPLACE FUNCTION uint4_from_uint1(uint1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_uint1';

CREATE OR REPLACE FUNCTION uint4_from_uint2(uint2) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_uint2';

CREATE OR REPLACE FUNCTION uint4_from_uint8(uint8) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_uint8';

CREATE OR REPLACE FUNCTION uint4_from_uint16(uint16) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_uint16';

CREATE OR REPLACE FUNCTION uint4_from_numeric(numeric) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_numeric';

CREATE OR REPLACE FUNCTION uint4_from_float4(float4) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_float4';

CREATE OR REPLACE FUNCTION uint4_from_float8(float8) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_float8';

CREATE OR REPLACE FUNCTION uint4_from_json(json) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_json';

CREATE OR REPLACE FUNCTION uint4_from_jsonb(jsonb) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_jsonb';

-- Type uint8 block

-- Cast functions uint8 block

CREATE OR REPLACE FUNCTION uint8_from_int1(int1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_int1';

CREATE OR REPLACE FUNCTION uint8_from_int2(int2) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_int2';

CREATE OR REPLACE FUNCTION uint8_from_int4(int4) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_int4';

CREATE OR REPLACE FUNCTION uint8_from_int8(int8) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_int8';

CREATE OR REPLACE FUNCTION uint8_from_int16(int16) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_int16';

CREATE OR REPLACE FUNCTION uint8_from_uint1(uint1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_uint1';

CREATE OR REPLACE FUNCTION uint8_from_uint2(uint2) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_uint2';

CREATE OR REPLACE FUNCTION uint8_from_uint4(uint4) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_uint4';

CREATE OR REPLACE FUNCTION uint8_from_uint16(uint16) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_uint16';

CREATE OR REPLACE FUNCTION uint8_from_float4(float4) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_float4';

CREATE OR REPLACE FUNCTION uint8_from_float8(float8) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_float8';

CREATE OR REPLACE FUNCTION uint8_from_json(json) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_json';

CREATE OR REPLACE FUNCTION uint8_from_jsonb(jsonb) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_jsonb';

-- Type uint16 block

-- Cast functions uint16 block

CREATE OR REPLACE FUNCTION uint16_from_int1(int1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_int1';

CREATE OR REPLACE FUNCTION uint16_from_int2(int2) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_int2';

CREATE OR REPLACE FUNCTION uint16_from_int4(int4) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_int4';

CREATE OR REPLACE FUNCTION uint16_from_int8(int8) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_int8';

CREATE OR REPLACE FUNCTION uint16_from_int16(int16) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_int16';

CREATE OR REPLACE FUNCTION uint16_from_uint1(uint1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_uint1';

CREATE OR REPLACE FUNCTION uint16_from_uint2(uint2) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_uint2';

CREATE OR REPLACE FUNCTION uint16_from_uint4(uint4) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_uint4';

CREATE OR REPLACE FUNCTION uint16_from_uint8(uint8) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_uint8';

CREATE OR REPLACE FUNCTION uint16_from_float4(float4) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_float4';

CREATE OR REPLACE FUNCTION uint16_from_float8(float8) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_float8';

CREATE OR REPLACE FUNCTION uint16_from_json(json) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_json';

CREATE OR REPLACE FUNCTION uint16_from_jsonb(jsonb) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_jsonb';

CREATE OR REPLACE FUNCTION uint16_from_uuid(uuid) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_uuid';

-- Type int1 block

-- Cast functions int1 block

CREATE OR REPLACE FUNCTION int1_from_uint1(uint1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint1';

CREATE OR REPLACE FUNCTION int1_from_uint2(uint2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint2';

CREATE OR REPLACE FUNCTION int1_from_uint4(uint4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint4';

CREATE OR REPLACE FUNCTION int1_from_uint8(uint8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint8';

CREATE OR REPLACE FUNCTION int1_from_uint16(uint16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint16';

CREATE OR REPLACE FUNCTION int1_from_int2(int2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int2';

CREATE OR REPLACE FUNCTION int1_from_int4(int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int4';

CREATE OR REPLACE FUNCTION int1_from_int8(int8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int8';

CREATE OR REPLACE FUNCTION int1_from_int16(int16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int16';

CREATE OR REPLACE FUNCTION int1_from_numeric(numeric) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_numeric';

CREATE OR REPLACE FUNCTION int1_from_float4(float4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_float4';

CREATE OR REPLACE FUNCTION int1_from_float8(float8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_float8';

CREATE OR REPLACE FUNCTION int1_from_json(json) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_json';

CREATE OR REPLACE FUNCTION int1_from_jsonb(jsonb) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_jsonb';

-- Type int2 block

-- Cast functions int2 block

CREATE OR REPLACE FUNCTION int2_from_uint1(uint1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_uint1';

CREATE OR REPLACE FUNCTION int2_from_uint2(uint2) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_uint2';

CREATE OR REPLACE FUNCTION int2_from_uint4(uint4) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_uint4';

CREATE OR REPLACE FUNCTION int2_from_uint8(uint8) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_uint8';

CREATE OR REPLACE FUNCTION int2_from_uint16(uint16) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_uint16';

CREATE OR REPLACE FUNCTION int2_from_int1(int1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_int1';

CREATE OR REPLACE FUNCTION int2_from_int16(int16) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_from_int16';

-- Type int4 block

-- Cast functions int4 block

CREATE OR REPLACE FUNCTION int4_from_uint1(uint1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_uint1';

CREATE OR REPLACE FUNCTION int4_from_uint2(uint2) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_uint2';

CREATE OR REPLACE FUNCTION int4_from_uint4(uint4) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_uint4';

CREATE OR REPLACE FUNCTION int4_from_uint8(uint8) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_uint8';

CREATE OR REPLACE FUNCTION int4_from_uint16(uint16) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_uint16';

CREATE OR REPLACE FUNCTION int4_from_int1(int1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_int1';

CREATE OR REPLACE FUNCTION int4_from_int16(int16) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_from_int16';

-- Type int8 block

-- Cast functions int8 block

CREATE OR REPLACE FUNCTION int8_from_uint1(uint1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_uint1';

CREATE OR REPLACE FUNCTION int8_from_uint2(uint2) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_uint2';

CREATE OR REPLACE FUNCTION int8_from_uint4(uint4) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_uint4';

CREATE OR REPLACE FUNCTION int8_from_uint8(uint8) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_uint8';

CREATE OR REPLACE FUNCTION int8_from_uint16(uint16) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_uint16';

CREATE OR REPLACE FUNCTION int8_from_int1(int1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_int1';

CREATE OR REPLACE FUNCTION int8_from_int16(int16) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_from_int16';

-- Type int16 block

-- Cast functions int16 block

CREATE OR REPLACE FUNCTION int16_from_uint1(uint1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_uint1';

CREATE OR REPLACE FUNCTION int16_from_uint2(uint2) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_uint2';

CREATE OR REPLACE FUNCTION int16_from_uint4(uint4) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_uint4';

CREATE OR REPLACE FUNCTION int16_from_uint8(uint8) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_uint8';

CREATE OR REPLACE FUNCTION int16_from_uint16(uint16) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_uint16';

CREATE OR REPLACE FUNCTION int16_from_int1(int1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_int1';

CREATE OR REPLACE FUNCTION int16_from_int2(int2) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_int2';

CREATE OR REPLACE FUNCTION int16_from_int4(int4) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_int4';

CREATE OR REPLACE FUNCTION int16_from_int8(int8) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_int8';

CREATE OR REPLACE FUNCTION int16_from_float4(float4) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_float4';

CREATE OR REPLACE FUNCTION int16_from_float8(float8) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_float8';

CREATE OR REPLACE FUNCTION int16_from_json(json) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_json';

CREATE OR REPLACE FUNCTION int16_from_jsonb(jsonb) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_jsonb';

-- Type numeric block

-- Cast functions numeric block

CREATE OR REPLACE FUNCTION numeric_from_uint1(uint1) RETURNS numeric
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'numeric_from_uint1';

CREATE OR REPLACE FUNCTION numeric_from_uint2(uint2) RETURNS numeric
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'numeric_from_uint2';

CREATE OR REPLACE FUNCTION numeric_from_uint4(uint4) RETURNS numeric
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'numeric_from_uint4';

CREATE OR REPLACE FUNCTION numeric_from_int1(int1) RETURNS numeric
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'numeric_from_int1';

-- Type float4 block

-- Cast functions float4 block

CREATE OR REPLACE FUNCTION float4_from_uint1(uint1) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_uint1';

CREATE OR REPLACE FUNCTION float4_from_uint2(uint2) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_uint2';

CREATE OR REPLACE FUNCTION float4_from_uint4(uint4) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_uint4';

CREATE OR REPLACE FUNCTION float4_from_uint8(uint8) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_uint8';

CREATE OR REPLACE FUNCTION float4_from_uint16(uint16) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_uint16';

CREATE OR REPLACE FUNCTION float4_from_int1(int1) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_int1';

CREATE OR REPLACE FUNCTION float4_from_int16(int16) RETURNS float4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float4_from_int16';

-- Type float8 block

-- Cast functions float8 block

CREATE OR REPLACE FUNCTION float8_from_uint1(uint1) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_uint1';

CREATE OR REPLACE FUNCTION float8_from_uint2(uint2) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_uint2';

CREATE OR REPLACE FUNCTION float8_from_uint4(uint4) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_uint4';

CREATE OR REPLACE FUNCTION float8_from_uint8(uint8) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_uint8';

CREATE OR REPLACE FUNCTION float8_from_uint16(uint16) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_uint16';

CREATE OR REPLACE FUNCTION float8_from_int1(int1) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_int1';

CREATE OR REPLACE FUNCTION float8_from_int16(int16) RETURNS float8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'float8_from_int16';

-- Type json block

-- Cast functions json block

CREATE OR REPLACE FUNCTION json_from_uint1(uint1) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_uint1';

CREATE OR REPLACE FUNCTION json_from_uint2(uint2) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_uint2';

CREATE OR REPLACE FUNCTION json_from_uint4(uint4) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_uint4';

CREATE OR REPLACE FUNCTION json_from_uint8(uint8) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_uint8';

CREATE OR REPLACE FUNCTION json_from_uint16(uint16) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_uint16';

CREATE OR REPLACE FUNCTION json_from_int1(int1) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_int1';

CREATE OR REPLACE FUNCTION json_from_int16(int16) RETURNS json
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'json_from_int16';

-- Type jsonb block

-- Cast functions jsonb block

CREATE OR REPLACE FUNCTION jsonb_from_uint1(uint1) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_uint1';

CREATE OR REPLACE FUNCTION jsonb_from_uint2(uint2) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_uint2';

CREATE OR REPLACE FUNCTION jsonb_from_uint4(uint4) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_uint4';

CREATE OR REPLACE FUNCTION jsonb_from_uint8(uint8) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_uint8';

CREATE OR REPLACE FUNCTION jsonb_from_uint16(uint16) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_uint16';

CREATE OR REPLACE FUNCTION jsonb_from_int1(int1) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_int1';

CREATE OR REPLACE FUNCTION jsonb_from_int16(int16) RETURNS jsonb
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'jsonb_from_int16';

-- Type uuid block

-- Cast functions uuid block

CREATE OR REPLACE FUNCTION uuid_from_uint16(uint16) RETURNS uuid
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uuid_from_uint16';

-- Cleanup old casts 

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT
            p.oid,
            p.castfunc,
            p.castsource,
            p.casttarget
        FROM
            pg_catalog.pg_extension AS e
        JOIN pg_catalog.pg_depend AS d ON d.refobjid = e.oid
        JOIN pg_catalog.pg_cast AS p ON p.oid = d.objid
        JOIN pg_type AS t ON t.oid = p.casttarget AND t.typtype NOT IN ('r', 'm')
        JOIN pg_type AS t2 ON t2.oid = p.castsource AND t2.typtype NOT IN ('r', 'm')
        WHERE
            d.deptype = 'e'
            AND e.extname = 'uint128'
        ORDER BY 3, 4
    LOOP
        RAISE NOTICE 'Dropping cast (% -> %)', r.castsource::regtype, r.casttarget::regtype;
        EXECUTE format('DROP CAST (%s AS %s)', r.castsource::regtype, r.casttarget::regtype);

--         IF r.castfunc IS NOT NULL AND r.castfunc > 0 THEN
--             RAISE NOTICE 'Dropping cast func %', r.castfunc::regprocedure;
--             EXECUTE format('DROP FUNCTION %s', r.castfunc::regprocedure);
--         END IF;
    END LOOP;
END $$;

-- Casts uint1 block

CREATE CAST (int1 AS uint1) WITH FUNCTION uint1_from_int1(int1) AS ASSIGNMENT;
CREATE CAST (int2 AS uint1) WITH FUNCTION uint1_from_int2(int2) AS ASSIGNMENT;
CREATE CAST (int4 AS uint1) WITH FUNCTION uint1_from_int4(int4) AS ASSIGNMENT;
CREATE CAST (int8 AS uint1) WITH FUNCTION uint1_from_int8(int8) AS ASSIGNMENT;
CREATE CAST (int16 AS uint1) WITH FUNCTION uint1_from_int16(int16) AS ASSIGNMENT;
CREATE CAST (uint2 AS uint1) WITH FUNCTION uint1_from_uint2(uint2) AS ASSIGNMENT;
CREATE CAST (uint4 AS uint1) WITH FUNCTION uint1_from_uint4(uint4) AS ASSIGNMENT;
CREATE CAST (uint8 AS uint1) WITH FUNCTION uint1_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS uint1) WITH FUNCTION uint1_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (numeric AS uint1) WITH FUNCTION uint1_from_numeric(numeric) AS ASSIGNMENT;
CREATE CAST (float4 AS uint1) WITH FUNCTION uint1_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS uint1) WITH FUNCTION uint1_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS uint1) WITH FUNCTION uint1_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS uint1) WITH FUNCTION uint1_from_jsonb(jsonb) AS ASSIGNMENT;

-- Casts uint2 block

CREATE CAST (int1 AS uint2) WITH FUNCTION uint2_from_int1(int1) AS ASSIGNMENT;
CREATE CAST (int2 AS uint2) WITH FUNCTION uint2_from_int2(int2) AS ASSIGNMENT;
CREATE CAST (int4 AS uint2) WITH FUNCTION uint2_from_int4(int4) AS ASSIGNMENT;
CREATE CAST (int8 AS uint2) WITH FUNCTION uint2_from_int8(int8) AS ASSIGNMENT;
CREATE CAST (int16 AS uint2) WITH FUNCTION uint2_from_int16(int16) AS ASSIGNMENT;
CREATE CAST (uint1 AS uint2) WITH FUNCTION uint2_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint4 AS uint2) WITH FUNCTION uint2_from_uint4(uint4) AS ASSIGNMENT;
CREATE CAST (uint8 AS uint2) WITH FUNCTION uint2_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS uint2) WITH FUNCTION uint2_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (numeric AS uint2) WITH FUNCTION uint2_from_numeric(numeric) AS ASSIGNMENT;
CREATE CAST (float4 AS uint2) WITH FUNCTION uint2_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS uint2) WITH FUNCTION uint2_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS uint2) WITH FUNCTION uint2_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS uint2) WITH FUNCTION uint2_from_jsonb(jsonb) AS ASSIGNMENT;

-- Casts uint4 block

CREATE CAST (int1 AS uint4) WITH FUNCTION uint4_from_int1(int1) AS ASSIGNMENT;
CREATE CAST (int2 AS uint4) WITH FUNCTION uint4_from_int2(int2) AS ASSIGNMENT;
CREATE CAST (int4 AS uint4) WITH FUNCTION uint4_from_int4(int4) AS ASSIGNMENT;
CREATE CAST (int8 AS uint4) WITH FUNCTION uint4_from_int8(int8) AS ASSIGNMENT;
CREATE CAST (int16 AS uint4) WITH FUNCTION uint4_from_int16(int16) AS ASSIGNMENT;
CREATE CAST (uint1 AS uint4) WITH FUNCTION uint4_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS uint4) WITH FUNCTION uint4_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint8 AS uint4) WITH FUNCTION uint4_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS uint4) WITH FUNCTION uint4_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (numeric AS uint4) WITH FUNCTION uint4_from_numeric(numeric) AS ASSIGNMENT;
CREATE CAST (float4 AS uint4) WITH FUNCTION uint4_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS uint4) WITH FUNCTION uint4_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS uint4) WITH FUNCTION uint4_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS uint4) WITH FUNCTION uint4_from_jsonb(jsonb) AS ASSIGNMENT;

-- Casts uint8 block

CREATE CAST (int1 AS uint8) WITH FUNCTION uint8_from_int1(int1) AS ASSIGNMENT;
CREATE CAST (int2 AS uint8) WITH FUNCTION uint8_from_int2(int2) AS ASSIGNMENT;
CREATE CAST (int4 AS uint8) WITH FUNCTION uint8_from_int4(int4) AS ASSIGNMENT;
CREATE CAST (int8 AS uint8) WITH FUNCTION uint8_from_int8(int8) AS ASSIGNMENT;
CREATE CAST (int16 AS uint8) WITH FUNCTION uint8_from_int16(int16) AS ASSIGNMENT;
CREATE CAST (uint1 AS uint8) WITH FUNCTION uint8_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS uint8) WITH FUNCTION uint8_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS uint8) WITH FUNCTION uint8_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint16 AS uint8) WITH FUNCTION uint8_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (float4 AS uint8) WITH FUNCTION uint8_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS uint8) WITH FUNCTION uint8_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS uint8) WITH FUNCTION uint8_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS uint8) WITH FUNCTION uint8_from_jsonb(jsonb) AS ASSIGNMENT;
CREATE CAST (numeric AS uint8) WITH INOUT AS ASSIGNMENT;

-- Casts uint16 block

CREATE CAST (int1 AS uint16) WITH FUNCTION uint16_from_int1(int1) AS ASSIGNMENT;
CREATE CAST (int2 AS uint16) WITH FUNCTION uint16_from_int2(int2) AS ASSIGNMENT;
CREATE CAST (int4 AS uint16) WITH FUNCTION uint16_from_int4(int4) AS ASSIGNMENT;
CREATE CAST (int8 AS uint16) WITH FUNCTION uint16_from_int8(int8) AS ASSIGNMENT;
CREATE CAST (int16 AS uint16) WITH FUNCTION uint16_from_int16(int16) AS ASSIGNMENT;
CREATE CAST (uint1 AS uint16) WITH FUNCTION uint16_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS uint16) WITH FUNCTION uint16_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS uint16) WITH FUNCTION uint16_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS uint16) WITH FUNCTION uint16_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (float4 AS uint16) WITH FUNCTION uint16_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS uint16) WITH FUNCTION uint16_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS uint16) WITH FUNCTION uint16_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS uint16) WITH FUNCTION uint16_from_jsonb(jsonb) AS ASSIGNMENT;
CREATE CAST (uuid AS uint16) WITH FUNCTION uint16_from_uuid(uuid) AS IMPLICIT;
CREATE CAST (numeric AS uint16) WITH INOUT AS ASSIGNMENT;

-- Casts int1 block

CREATE CAST (uint1 AS int1) WITH FUNCTION int1_from_uint1(uint1) AS ASSIGNMENT;
CREATE CAST (uint2 AS int1) WITH FUNCTION int1_from_uint2(uint2) AS ASSIGNMENT;
CREATE CAST (uint4 AS int1) WITH FUNCTION int1_from_uint4(uint4) AS ASSIGNMENT;
CREATE CAST (uint8 AS int1) WITH FUNCTION int1_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS int1) WITH FUNCTION int1_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (int2 AS int1) WITH FUNCTION int1_from_int2(int2) AS ASSIGNMENT;
CREATE CAST (int4 AS int1) WITH FUNCTION int1_from_int4(int4) AS ASSIGNMENT;
CREATE CAST (int8 AS int1) WITH FUNCTION int1_from_int8(int8) AS ASSIGNMENT;
CREATE CAST (int16 AS int1) WITH FUNCTION int1_from_int16(int16) AS ASSIGNMENT;
CREATE CAST (numeric AS int1) WITH FUNCTION int1_from_numeric(numeric) AS ASSIGNMENT;
CREATE CAST (float4 AS int1) WITH FUNCTION int1_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS int1) WITH FUNCTION int1_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS int1) WITH FUNCTION int1_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS int1) WITH FUNCTION int1_from_jsonb(jsonb) AS ASSIGNMENT;

-- Casts int2 block

CREATE CAST (uint1 AS int2) WITH FUNCTION int2_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS int2) WITH FUNCTION int2_from_uint2(uint2) AS ASSIGNMENT;
CREATE CAST (uint4 AS int2) WITH FUNCTION int2_from_uint4(uint4) AS ASSIGNMENT;
CREATE CAST (uint8 AS int2) WITH FUNCTION int2_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS int2) WITH FUNCTION int2_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (int1 AS int2) WITH FUNCTION int2_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS int2) WITH FUNCTION int2_from_int16(int16) AS ASSIGNMENT;

-- Casts int4 block

CREATE CAST (uint1 AS int4) WITH FUNCTION int4_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS int4) WITH FUNCTION int4_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS int4) WITH FUNCTION int4_from_uint4(uint4) AS ASSIGNMENT;
CREATE CAST (uint8 AS int4) WITH FUNCTION int4_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS int4) WITH FUNCTION int4_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (int1 AS int4) WITH FUNCTION int4_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS int4) WITH FUNCTION int4_from_int16(int16) AS ASSIGNMENT;

-- Casts int8 block

CREATE CAST (uint1 AS int8) WITH FUNCTION int8_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS int8) WITH FUNCTION int8_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS int8) WITH FUNCTION int8_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS int8) WITH FUNCTION int8_from_uint8(uint8) AS ASSIGNMENT;
CREATE CAST (uint16 AS int8) WITH FUNCTION int8_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (int1 AS int8) WITH FUNCTION int8_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS int8) WITH FUNCTION int8_from_int16(int16) AS ASSIGNMENT;

-- Casts int16 block

CREATE CAST (uint1 AS int16) WITH FUNCTION int16_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS int16) WITH FUNCTION int16_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS int16) WITH FUNCTION int16_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS int16) WITH FUNCTION int16_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (uint16 AS int16) WITH FUNCTION int16_from_uint16(uint16) AS ASSIGNMENT;
CREATE CAST (int1 AS int16) WITH FUNCTION int16_from_int1(int1) AS IMPLICIT;
CREATE CAST (int2 AS int16) WITH FUNCTION int16_from_int2(int2) AS IMPLICIT;
CREATE CAST (int4 AS int16) WITH FUNCTION int16_from_int4(int4) AS IMPLICIT;
CREATE CAST (int8 AS int16) WITH FUNCTION int16_from_int8(int8) AS IMPLICIT;
CREATE CAST (float4 AS int16) WITH FUNCTION int16_from_float4(float4) AS ASSIGNMENT;
CREATE CAST (float8 AS int16) WITH FUNCTION int16_from_float8(float8) AS ASSIGNMENT;
CREATE CAST (json AS int16) WITH FUNCTION int16_from_json(json) AS ASSIGNMENT;
CREATE CAST (jsonb AS int16) WITH FUNCTION int16_from_jsonb(jsonb) AS ASSIGNMENT;
CREATE CAST (numeric AS int16) WITH INOUT AS ASSIGNMENT;

-- Casts numeric block

CREATE CAST (uint1 AS numeric) WITH FUNCTION numeric_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS numeric) WITH FUNCTION numeric_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS numeric) WITH FUNCTION numeric_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (int1 AS numeric) WITH FUNCTION numeric_from_int1(int1) AS IMPLICIT;
CREATE CAST (uint8 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (uint16 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (int16 AS numeric) WITH INOUT AS IMPLICIT;

-- Casts float4 block

CREATE CAST (uint1 AS float4) WITH FUNCTION float4_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS float4) WITH FUNCTION float4_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS float4) WITH FUNCTION float4_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS float4) WITH FUNCTION float4_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (uint16 AS float4) WITH FUNCTION float4_from_uint16(uint16) AS IMPLICIT;
CREATE CAST (int1 AS float4) WITH FUNCTION float4_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS float4) WITH FUNCTION float4_from_int16(int16) AS IMPLICIT;

-- Casts float8 block

CREATE CAST (uint1 AS float8) WITH FUNCTION float8_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS float8) WITH FUNCTION float8_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS float8) WITH FUNCTION float8_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS float8) WITH FUNCTION float8_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (uint16 AS float8) WITH FUNCTION float8_from_uint16(uint16) AS IMPLICIT;
CREATE CAST (int1 AS float8) WITH FUNCTION float8_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS float8) WITH FUNCTION float8_from_int16(int16) AS IMPLICIT;

-- Casts json block

CREATE CAST (uint1 AS json) WITH FUNCTION json_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS json) WITH FUNCTION json_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS json) WITH FUNCTION json_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS json) WITH FUNCTION json_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (uint16 AS json) WITH FUNCTION json_from_uint16(uint16) AS IMPLICIT;
CREATE CAST (int1 AS json) WITH FUNCTION json_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS json) WITH FUNCTION json_from_int16(int16) AS IMPLICIT;

-- Casts jsonb block

CREATE CAST (uint1 AS jsonb) WITH FUNCTION jsonb_from_uint1(uint1) AS IMPLICIT;
CREATE CAST (uint2 AS jsonb) WITH FUNCTION jsonb_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint4 AS jsonb) WITH FUNCTION jsonb_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint8 AS jsonb) WITH FUNCTION jsonb_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (uint16 AS jsonb) WITH FUNCTION jsonb_from_uint16(uint16) AS IMPLICIT;
CREATE CAST (int1 AS jsonb) WITH FUNCTION jsonb_from_int1(int1) AS IMPLICIT;
CREATE CAST (int16 AS jsonb) WITH FUNCTION jsonb_from_int16(int16) AS IMPLICIT;

-- Casts uuid block

CREATE CAST (uint16 AS uuid) WITH FUNCTION uuid_from_uint16(uint16) AS IMPLICIT;

-- Cleanup old cast functions

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT
            p.oid,
            p.castfunc,
            p.castsource,
            p.casttarget
        FROM
            pg_catalog.pg_extension AS e
        JOIN pg_catalog.pg_depend AS d ON d.refobjid = e.oid
        JOIN pg_catalog.pg_cast AS p ON p.oid = d.objid
        JOIN pg_type AS t ON t.oid = p.casttarget AND t.typtype NOT IN ('r', 'm')
        JOIN pg_type AS t2 ON t2.oid = p.castsource AND t2.typtype NOT IN ('r', 'm')
        WHERE
            d.deptype = 'e'
            AND e.extname = 'uint128'
        ORDER BY 3, 4
    LOOP
--         RAISE NOTICE 'Dropping cast (% -> %)', r.castsource::regtype, r.casttarget::regtype;
--         EXECUTE format('DROP CAST (%s AS %s)', r.castsource::regtype, r.casttarget::regtype);

        IF r.castfunc IS NOT NULL AND r.castfunc > 0 AND r.castfunc::regprocedure::text LIKE '%_to_%' THEN
            RAISE NOTICE 'Dropping cast func %', r.castfunc::regprocedure;
            EXECUTE format('DROP FUNCTION %s', r.castfunc::regprocedure);
        END IF;
    END LOOP;
END $$;

