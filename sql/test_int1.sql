-- Testing int1

-- From string block

-- NULL
SELECT NULL::text::int1;
-- Empty
SELECT ''::text::int1;
-- Zero
SELECT '0'::text::int1;
-- Min
SELECT '-128'::text::int1;
-- Max
SELECT '127'::text::int1;
-- Underflow
SELECT '-129'::int1;
-- Overflow
SELECT '128'::int1;

-- Ops block

SELECT 1::int1 = 1::int1;
SELECT 1::int1 = 0::int1;
SELECT 1::int1 = 1::int2;
SELECT 1::int1 = 0::int2;
SELECT 1::int2 = 1::int1;
SELECT 1::int2 = 0::int1;
SELECT 1::int1 = 1::int4;
SELECT 1::int1 = 0::int4;
SELECT 1::int4 = 1::int1;
SELECT 1::int4 = 0::int1;
SELECT 1::int1 = 1::int8;
SELECT 1::int1 = 0::int8;
SELECT 1::int8 = 1::int1;
SELECT 1::int8 = 0::int1;

SELECT 1::int1 <> 0::int1;
SELECT 0::int1 <> 0::int1;
SELECT 1::int1 <> 0::int2;
SELECT 0::int1 <> 0::int2;
SELECT 1::int2 <> 0::int1;
SELECT 0::int2 <> 0::int1;
SELECT 1::int1 <> 0::int4;
SELECT 0::int1 <> 0::int4;
SELECT 1::int4 <> 0::int1;
SELECT 0::int4 <> 0::int1;
SELECT 1::int1 <> 0::int8;
SELECT 0::int1 <> 0::int8;
SELECT 1::int8 <> 0::int1;
SELECT 0::int8 <> 0::int1;

SELECT 1::int1 > 0::int1;
SELECT 0::int1 > 1::int1;
SELECT 1::int1 > 0::int2;
SELECT 0::int1 > 1::int2;
SELECT 1::int2 > 0::int1;
SELECT 0::int2 > 1::int1;
SELECT 1::int1 > 0::int4;
SELECT 0::int1 > 1::int4;
SELECT 1::int4 > 0::int1;
SELECT 0::int4 > 1::int1;
SELECT 1::int1 > 0::int8;
SELECT 0::int1 > 1::int8;
SELECT 1::int8 > 0::int1;
SELECT 0::int8 > 1::int1;

SELECT 0::int1 < 1::int1;
SELECT 1::int1 < 0::int1;
SELECT 0::int1 < 1::int2;
SELECT 1::int1 < 0::int2;
SELECT 0::int2 < 1::int1;
SELECT 1::int2 < 0::int1;
SELECT 0::int1 < 1::int4;
SELECT 1::int1 < 0::int4;
SELECT 0::int4 < 1::int1;
SELECT 1::int4 < 0::int1;
SELECT 0::int1 < 1::int8;
SELECT 1::int1 < 0::int8;
SELECT 0::int8 < 1::int1;
SELECT 1::int8 < 0::int1;

SELECT 1::int1 >= 0::int1;
SELECT 0::int1 >= 1::int1;
SELECT 1::int1 >= 1::int1;
SELECT 1::int1 >= 0::int2;
SELECT 0::int1 >= 1::int2;
SELECT 1::int1 >= 1::int2;
SELECT 1::int2 >= 0::int1;
SELECT 0::int2 >= 1::int1;
SELECT 1::int2 >= 1::int1;
SELECT 1::int1 >= 0::int4;
SELECT 0::int1 >= 1::int4;
SELECT 1::int1 >= 1::int4;
SELECT 1::int4 >= 0::int1;
SELECT 0::int4 >= 1::int1;
SELECT 1::int4 >= 1::int1;
SELECT 1::int1 >= 0::int8;
SELECT 0::int1 >= 1::int8;
SELECT 1::int1 >= 1::int8;
SELECT 1::int8 >= 0::int1;
SELECT 0::int8 >= 1::int1;
SELECT 1::int8 >= 1::int1;

SELECT 0::int1 <= 1::int1;
SELECT 1::int1 <= 0::int1;
SELECT 1::int1 <= 1::int1;
SELECT 0::int1 <= 1::int2;
SELECT 1::int1 <= 0::int2;
SELECT 1::int1 <= 1::int2;
SELECT 0::int2 <= 1::int1;
SELECT 1::int2 <= 0::int1;
SELECT 1::int2 <= 1::int1;
SELECT 0::int1 <= 1::int4;
SELECT 1::int1 <= 0::int4;
SELECT 1::int1 <= 1::int4;
SELECT 0::int4 <= 1::int1;
SELECT 1::int4 <= 0::int1;
SELECT 1::int4 <= 1::int1;
SELECT 0::int1 <= 1::int8;
SELECT 1::int1 <= 0::int8;
SELECT 1::int1 <= 1::int8;
SELECT 0::int8 <= 1::int1;
SELECT 1::int8 <= 0::int1;
SELECT 1::int8 <= 1::int1;

SELECT 25::int1 + 5::int1;
SELECT 25::int1 + 5::int2;
SELECT 127::int1 + 1::int2;
SELECT 120::int2 + 10::int1;
SELECT 32767::int2 + 1::int1;
SELECT 25::int1 + 5::int4;
SELECT 127::int1 + 1::int4;
SELECT 120::int4 + 10::int1;
SELECT 2147483647::int4 + 1::int1;
SELECT 25::int1 + 5::int8;
SELECT 127::int1 + 1::int8;
SELECT 120::int8 + 10::int1;
SELECT 9223372036854775807::int8 + 1::int1;

SELECT 25::int1 - 5::int1;
SELECT 25::int1 - 5::int2;
SELECT (-128)::int1 - 1::int2;
SELECT 120::int2 - 10::int1;
SELECT (-32768)::int2 - 1::int1;
SELECT 25::int1 - 5::int4;
SELECT (-128)::int1 - 1::int4;
SELECT 120::int4 - 10::int1;
SELECT (-2147483648)::int4 - 1::int1;
SELECT 25::int1 - 5::int8;
SELECT (-128)::int1 - 1::int8;
SELECT 120::int8 - 10::int1;
SELECT (-9223372036854775808)::int8 - 1::int1;

SELECT 25::int1 * 5::int1;
SELECT 25::int1 * 5::int2;
SELECT 127::int1 * 2::int2;
SELECT 120::int2 * 10::int1;
SELECT 32767::int2 * 2::int1;
SELECT 25::int1 * 5::int4;
SELECT 127::int1 * 2::int4;
SELECT 120::int4 * 10::int1;
SELECT 2147483647::int4 * 2::int1;
SELECT 25::int1 * 5::int8;
SELECT 127::int1 * 2::int8;
SELECT 120::int8 * 10::int1;
SELECT 9223372036854775807::int8 * 2::int1;

SELECT 25::int1 / 5::int1;
SELECT 25::int1 / 5::int2;
SELECT 1::int1 / 0::int2;
SELECT 120::int2 / 10::int1;
SELECT 1::int2 / 0::int1;
SELECT 25::int1 / 5::int4;
SELECT 1::int1 / 0::int4;
SELECT 120::int4 / 10::int1;
SELECT 1::int4 / 0::int1;
SELECT 25::int1 / 5::int8;
SELECT 1::int1 / 0::int8;
SELECT 120::int8 / 10::int1;
SELECT 1::int8 / 0::int1;

SELECT 25::int1 % 5::int1;
SELECT 25::int1 % 5::int2;
SELECT 1::int1 % 0::int2;
SELECT 120::int2 % 10::int1;
SELECT 1::int2 % 0::int1;
SELECT 25::int1 % 5::int4;
SELECT 1::int1 % 0::int4;
SELECT 120::int4 % 10::int1;
SELECT 1::int4 % 0::int1;
SELECT 25::int1 % 5::int8;
SELECT 1::int1 % 0::int8;
SELECT 120::int8 % 10::int1;
SELECT 1::int8 % 0::int1;

-- Agg ops block

SELECT sum(s::int1) FROM generate_series(1, 100) s;
SELECT avg(s::int1) FROM generate_series(1, 100) s;
SELECT min(s::int1) FROM generate_series(1, 100) s;
SELECT max(s::int1) FROM generate_series(1, 100) s;

-- Generate series block

SELECT s FROM generate_series(1::int1, 10::int1) s;
SELECT s FROM generate_series(1::int1, 10::int1, 2::int1) s;

-- Ranges block

SELECT int1range(0::int1, 10::int1);
SELECT int1range((-128)::int1, 127::int1);
SELECT int1range((-128)::int1, 127::int1, '[]');
SELECT upper(int1range(0::int1, 10::int1));
SELECT lower(int1range(0::int1, 10::int1));
SELECT isempty(int1range(0::int1, 10::int1));
SELECT int1range(0::int1, 10::int1) @> 9::int1;
SELECT int1range(0::int1, 10::int1) @> 10::int1;
SELECT int1range(0::int1, 10::int1) && int1range(10::int1,20::int1);
SELECT int1range(0::int1, 10::int1) && int1range(9::int1,20::int1);
SELECT int1range(5::int1, 10::int1) - int1range(5::int1, 10::int1);
SELECT int1range(5::int1, 10::int1) - int1range(5::int1, 9::int1);
CREATE TEMPORARY TABLE test_int1range (
    r int1range,

    EXCLUDE USING GIST (r WITH &&)
);

INSERT INTO test_int1range (r) VALUES (int1range(0::int1, 10::int1));
INSERT INTO test_int1range (r) VALUES (int1range(10::int1, 20::int1));
INSERT INTO test_int1range (r) VALUES (int1range(19::int1, 30::int1));

DROP TABLE test_int1range;


-- Testing cross-types compatibility

SELECT 1::int1 = 1::int16;
SELECT 1::int1 = 0::int16;
SELECT 1::int1 = 1::uint1;
SELECT 1::int1 = 0::uint1;
SELECT 1::int1 = 1::uint2;
SELECT 1::int1 = 0::uint2;
SELECT 1::int1 = 1::uint4;
SELECT 1::int1 = 0::uint4;
SELECT 1::int1 = 1::uint8;
SELECT 1::int1 = 0::uint8;
SELECT 1::int1 = 1::uint16;
SELECT 1::int1 = 0::uint16;

SELECT 1::int1 <> 0::int16;
SELECT 0::int1 <> 0::int16;
SELECT 1::int1 <> 0::uint1;
SELECT 0::int1 <> 0::uint1;
SELECT 1::int1 <> 0::uint2;
SELECT 0::int1 <> 0::uint2;
SELECT 1::int1 <> 0::uint4;
SELECT 0::int1 <> 0::uint4;
SELECT 1::int1 <> 0::uint8;
SELECT 0::int1 <> 0::uint8;
SELECT 1::int1 <> 0::uint16;
SELECT 0::int1 <> 0::uint16;

SELECT 1::int1 > 0::int16;
SELECT 0::int1 > 1::int16;
SELECT 1::int1 > 0::uint1;
SELECT 0::int1 > 1::uint1;
SELECT 1::int1 > 0::uint2;
SELECT 0::int1 > 1::uint2;
SELECT 1::int1 > 0::uint4;
SELECT 0::int1 > 1::uint4;
SELECT 1::int1 > 0::uint8;
SELECT 0::int1 > 1::uint8;
SELECT 1::int1 > 0::uint16;
SELECT 0::int1 > 1::uint16;

SELECT 0::int1 < 1::int16;
SELECT 1::int1 < 0::int16;
SELECT 0::int1 < 1::uint1;
SELECT 1::int1 < 0::uint1;
SELECT 0::int1 < 1::uint2;
SELECT 1::int1 < 0::uint2;
SELECT 0::int1 < 1::uint4;
SELECT 1::int1 < 0::uint4;
SELECT 0::int1 < 1::uint8;
SELECT 1::int1 < 0::uint8;
SELECT 0::int1 < 1::uint16;
SELECT 1::int1 < 0::uint16;

SELECT 1::int1 >= 0::int16;
SELECT 0::int1 >= 1::int16;
SELECT 1::int1 >= 1::int16;
SELECT 1::int1 >= 0::uint1;
SELECT 0::int1 >= 1::uint1;
SELECT 1::int1 >= 1::uint1;
SELECT 1::int1 >= 0::uint2;
SELECT 0::int1 >= 1::uint2;
SELECT 1::int1 >= 1::uint2;
SELECT 1::int1 >= 0::uint4;
SELECT 0::int1 >= 1::uint4;
SELECT 1::int1 >= 1::uint4;
SELECT 1::int1 >= 0::uint8;
SELECT 0::int1 >= 1::uint8;
SELECT 1::int1 >= 1::uint8;
SELECT 1::int1 >= 0::uint16;
SELECT 0::int1 >= 1::uint16;
SELECT 1::int1 >= 1::uint16;

SELECT 0::int1 <= 1::int16;
SELECT 1::int1 <= 0::int16;
SELECT 1::int1 <= 1::int16;
SELECT 0::int1 <= 1::uint1;
SELECT 1::int1 <= 0::uint1;
SELECT 1::int1 <= 1::uint1;
SELECT 0::int1 <= 1::uint2;
SELECT 1::int1 <= 0::uint2;
SELECT 1::int1 <= 1::uint2;
SELECT 0::int1 <= 1::uint4;
SELECT 1::int1 <= 0::uint4;
SELECT 1::int1 <= 1::uint4;
SELECT 0::int1 <= 1::uint8;
SELECT 1::int1 <= 0::uint8;
SELECT 1::int1 <= 1::uint8;
SELECT 0::int1 <= 1::uint16;
SELECT 1::int1 <= 0::uint16;
SELECT 1::int1 <= 1::uint16;

SELECT 25::int1 + 5::int16;
SELECT 127::int1 + 1::int16;
SELECT 25::int1 + 5::uint1;
SELECT 127::int1 + 1::uint1;
SELECT (-25)::int1 + 5::uint1;
SELECT 25::int1 + 5::uint2;
SELECT 127::int1 + 1::uint2;
SELECT (-25)::int1 + 5::uint2;
SELECT 25::int1 + 5::uint4;
SELECT 127::int1 + 1::uint4;
SELECT (-25)::int1 + 5::uint4;
SELECT 25::int1 + 5::uint8;
SELECT 127::int1 + 1::uint8;
SELECT (-25)::int1 + 5::uint8;
SELECT 25::int1 + 5::uint16;
SELECT 127::int1 + 1::uint16;
SELECT (-25)::int1 + 5::uint16;

SELECT 25::int1 - 5::int16;
SELECT (-128)::int1 - 1::int16;
SELECT 25::int1 - 5::uint1;
SELECT (-128)::int1 - 1::uint1;
SELECT (-25)::int1 - 5::uint1;
SELECT 25::int1 - 5::uint2;
SELECT (-128)::int1 - 1::uint2;
SELECT (-25)::int1 - 5::uint2;
SELECT 25::int1 - 5::uint4;
SELECT (-128)::int1 - 1::uint4;
SELECT (-25)::int1 - 5::uint4;
SELECT 25::int1 - 5::uint8;
SELECT (-128)::int1 - 1::uint8;
SELECT (-25)::int1 - 5::uint8;
SELECT 25::int1 - 5::uint16;
SELECT (-128)::int1 - 1::uint16;
SELECT (-25)::int1 - 5::uint16;

SELECT 25::int1 * 5::int16;
SELECT 127::int1 * 2::int16;
SELECT 25::int1 * 5::uint1;
SELECT 127::int1 * 2::uint1;
SELECT (-25)::int1 * 5::uint1;
SELECT 25::int1 * 5::uint2;
SELECT 127::int1 * 2::uint2;
SELECT (-25)::int1 * 5::uint2;
SELECT 25::int1 * 5::uint4;
SELECT 127::int1 * 2::uint4;
SELECT (-25)::int1 * 5::uint4;
SELECT 25::int1 * 5::uint8;
SELECT 127::int1 * 2::uint8;
SELECT (-25)::int1 * 5::uint8;
SELECT 25::int1 * 5::uint16;
SELECT 127::int1 * 2::uint16;
SELECT (-25)::int1 * 5::uint16;

SELECT 25::int1 / 5::int16;
SELECT 1::int1 / 0::int16;
SELECT 25::int1 / 5::uint1;
SELECT 1::int1 / 0::uint1;
SELECT (-25)::int1 / 5::uint1;
SELECT 25::int1 / 5::uint2;
SELECT 1::int1 / 0::uint2;
SELECT (-25)::int1 / 5::uint2;
SELECT 25::int1 / 5::uint4;
SELECT 1::int1 / 0::uint4;
SELECT (-25)::int1 / 5::uint4;
SELECT 25::int1 / 5::uint8;
SELECT 1::int1 / 0::uint8;
SELECT (-25)::int1 / 5::uint8;
SELECT 25::int1 / 5::uint16;
SELECT 1::int1 / 0::uint16;
SELECT (-25)::int1 / 5::uint16;

SELECT 25::int1 % 5::int16;
SELECT 1::int1 % 0::int16;
SELECT 25::int1 % 5::uint1;
SELECT 1::int1 % 0::uint1;
SELECT (-25)::int1 % 5::uint1;
SELECT 25::int1 % 5::uint2;
SELECT 1::int1 % 0::uint2;
SELECT (-25)::int1 % 5::uint2;
SELECT 25::int1 % 5::uint4;
SELECT 1::int1 % 0::uint4;
SELECT (-25)::int1 % 5::uint4;
SELECT 25::int1 % 5::uint8;
SELECT 1::int1 % 0::uint8;
SELECT (-25)::int1 % 5::uint8;
SELECT 25::int1 % 5::uint16;
SELECT 1::int1 % 0::uint16;
SELECT (-25)::int1 % 5::uint16;

