-- Testing uint1

-- From string block

-- NULL
SELECT NULL::text::uint1;
-- Empty
SELECT ''::text::uint1;
-- Zero
SELECT '0'::text::uint1;
-- Min
SELECT '0'::text::uint1;
-- Max
SELECT '255'::text::uint1;
-- Underflow
SELECT '-1'::uint1;
-- Overflow
SELECT '256'::uint1;

-- Ops block

SELECT 1::uint1 = 1::uint1;
SELECT 1::uint1 = 0::uint1;
SELECT 1::uint1 = 1::int2;
SELECT 1::uint1 = 0::int2;
SELECT 1::int2 = 1::uint1;
SELECT 1::int2 = 0::uint1;
SELECT 1::uint1 = 1::int4;
SELECT 1::uint1 = 0::int4;
SELECT 1::int4 = 1::uint1;
SELECT 1::int4 = 0::uint1;
SELECT 1::uint1 = 1::int8;
SELECT 1::uint1 = 0::int8;
SELECT 1::int8 = 1::uint1;
SELECT 1::int8 = 0::uint1;

SELECT 1::uint1 <> 0::uint1;
SELECT 0::uint1 <> 0::uint1;
SELECT 1::uint1 <> 0::int2;
SELECT 0::uint1 <> 0::int2;
SELECT 1::int2 <> 0::uint1;
SELECT 0::int2 <> 0::uint1;
SELECT 1::uint1 <> 0::int4;
SELECT 0::uint1 <> 0::int4;
SELECT 1::int4 <> 0::uint1;
SELECT 0::int4 <> 0::uint1;
SELECT 1::uint1 <> 0::int8;
SELECT 0::uint1 <> 0::int8;
SELECT 1::int8 <> 0::uint1;
SELECT 0::int8 <> 0::uint1;

SELECT 1::uint1 > 0::uint1;
SELECT 0::uint1 > 1::uint1;
SELECT 1::uint1 > 0::int2;
SELECT 0::uint1 > 1::int2;
SELECT 1::int2 > 0::uint1;
SELECT 0::int2 > 1::uint1;
SELECT 1::uint1 > 0::int4;
SELECT 0::uint1 > 1::int4;
SELECT 1::int4 > 0::uint1;
SELECT 0::int4 > 1::uint1;
SELECT 1::uint1 > 0::int8;
SELECT 0::uint1 > 1::int8;
SELECT 1::int8 > 0::uint1;
SELECT 0::int8 > 1::uint1;

SELECT 0::uint1 < 1::uint1;
SELECT 1::uint1 < 0::uint1;
SELECT 0::uint1 < 1::int2;
SELECT 1::uint1 < 0::int2;
SELECT 0::int2 < 1::uint1;
SELECT 1::int2 < 0::uint1;
SELECT 0::uint1 < 1::int4;
SELECT 1::uint1 < 0::int4;
SELECT 0::int4 < 1::uint1;
SELECT 1::int4 < 0::uint1;
SELECT 0::uint1 < 1::int8;
SELECT 1::uint1 < 0::int8;
SELECT 0::int8 < 1::uint1;
SELECT 1::int8 < 0::uint1;

SELECT 1::uint1 >= 0::uint1;
SELECT 0::uint1 >= 1::uint1;
SELECT 1::uint1 >= 1::uint1;
SELECT 1::uint1 >= 0::int2;
SELECT 0::uint1 >= 1::int2;
SELECT 1::uint1 >= 1::int2;
SELECT 1::int2 >= 0::uint1;
SELECT 0::int2 >= 1::uint1;
SELECT 1::int2 >= 1::uint1;
SELECT 1::uint1 >= 0::int4;
SELECT 0::uint1 >= 1::int4;
SELECT 1::uint1 >= 1::int4;
SELECT 1::int4 >= 0::uint1;
SELECT 0::int4 >= 1::uint1;
SELECT 1::int4 >= 1::uint1;
SELECT 1::uint1 >= 0::int8;
SELECT 0::uint1 >= 1::int8;
SELECT 1::uint1 >= 1::int8;
SELECT 1::int8 >= 0::uint1;
SELECT 0::int8 >= 1::uint1;
SELECT 1::int8 >= 1::uint1;

SELECT 0::uint1 <= 1::uint1;
SELECT 1::uint1 <= 0::uint1;
SELECT 1::uint1 <= 1::uint1;
SELECT 0::uint1 <= 1::int2;
SELECT 1::uint1 <= 0::int2;
SELECT 1::uint1 <= 1::int2;
SELECT 0::int2 <= 1::uint1;
SELECT 1::int2 <= 0::uint1;
SELECT 1::int2 <= 1::uint1;
SELECT 0::uint1 <= 1::int4;
SELECT 1::uint1 <= 0::int4;
SELECT 1::uint1 <= 1::int4;
SELECT 0::int4 <= 1::uint1;
SELECT 1::int4 <= 0::uint1;
SELECT 1::int4 <= 1::uint1;
SELECT 0::uint1 <= 1::int8;
SELECT 1::uint1 <= 0::int8;
SELECT 1::uint1 <= 1::int8;
SELECT 0::int8 <= 1::uint1;
SELECT 1::int8 <= 0::uint1;
SELECT 1::int8 <= 1::uint1;

SELECT 25::uint1 + 5::uint1;
SELECT 25::uint1 + 5::int2;
SELECT 255::uint1 + 1::int2;
SELECT 120::int2 + 10::uint1;
SELECT 32767::int2 + 1::uint1;
SELECT (-120)::int2 + 10::uint1;
SELECT 25::uint1 + 5::int4;
SELECT 255::uint1 + 1::int4;
SELECT 120::int4 + 10::uint1;
SELECT 2147483647::int4 + 1::uint1;
SELECT (-120)::int4 + 10::uint1;
SELECT 25::uint1 + 5::int8;
SELECT 255::uint1 + 1::int8;
SELECT 120::int8 + 10::uint1;
SELECT 9223372036854775807::int8 + 1::uint1;
SELECT (-120)::int8 + 10::uint1;

SELECT 25::uint1 - 5::uint1;
SELECT 25::uint1 - 5::int2;
SELECT 0::uint1 - 1::int2;
SELECT 120::int2 - 10::uint1;
SELECT (-32768)::int2 - 1::uint1;
SELECT (-120)::int2 - 10::uint1;
SELECT 25::uint1 - 5::int4;
SELECT 0::uint1 - 1::int4;
SELECT 120::int4 - 10::uint1;
SELECT (-2147483648)::int4 - 1::uint1;
SELECT (-120)::int4 - 10::uint1;
SELECT 25::uint1 - 5::int8;
SELECT 0::uint1 - 1::int8;
SELECT 120::int8 - 10::uint1;
SELECT (-9223372036854775808)::int8 - 1::uint1;
SELECT (-120)::int8 - 10::uint1;

SELECT 25::uint1 * 5::uint1;
SELECT 25::uint1 * 5::int2;
SELECT 255::uint1 * 2::int2;
SELECT 120::int2 * 10::uint1;
SELECT 32767::int2 * 2::uint1;
SELECT (-120)::int2 * 10::uint1;
SELECT 25::uint1 * 5::int4;
SELECT 255::uint1 * 2::int4;
SELECT 120::int4 * 10::uint1;
SELECT 2147483647::int4 * 2::uint1;
SELECT (-120)::int4 * 10::uint1;
SELECT 25::uint1 * 5::int8;
SELECT 255::uint1 * 2::int8;
SELECT 120::int8 * 10::uint1;
SELECT 9223372036854775807::int8 * 2::uint1;
SELECT (-120)::int8 * 10::uint1;

SELECT 25::uint1 / 5::uint1;
SELECT 25::uint1 / 5::int2;
SELECT 1::uint1 / 0::int2;
SELECT 120::int2 / 10::uint1;
SELECT 1::int2 / 0::uint1;
SELECT (-120)::int2 / 10::uint1;
SELECT 25::uint1 / 5::int4;
SELECT 1::uint1 / 0::int4;
SELECT 120::int4 / 10::uint1;
SELECT 1::int4 / 0::uint1;
SELECT (-120)::int4 / 10::uint1;
SELECT 25::uint1 / 5::int8;
SELECT 1::uint1 / 0::int8;
SELECT 120::int8 / 10::uint1;
SELECT 1::int8 / 0::uint1;
SELECT (-120)::int8 / 10::uint1;

SELECT 25::uint1 % 5::uint1;
SELECT 25::uint1 % 5::int2;
SELECT 1::uint1 % 0::int2;
SELECT 120::int2 % 10::uint1;
SELECT 1::int2 % 0::uint1;
SELECT (-120)::int2 % 10::uint1;
SELECT 25::uint1 % 5::int4;
SELECT 1::uint1 % 0::int4;
SELECT 120::int4 % 10::uint1;
SELECT 1::int4 % 0::uint1;
SELECT (-120)::int4 % 10::uint1;
SELECT 25::uint1 % 5::int8;
SELECT 1::uint1 % 0::int8;
SELECT 120::int8 % 10::uint1;
SELECT 1::int8 % 0::uint1;
SELECT (-120)::int8 % 10::uint1;

-- Agg ops block

SELECT sum(s::uint1) FROM generate_series(1, 100) s;
SELECT avg(s::uint1) FROM generate_series(1, 100) s;
SELECT min(s::uint1) FROM generate_series(1, 100) s;
SELECT max(s::uint1) FROM generate_series(1, 100) s;

-- Generate series block

SELECT s FROM generate_series(1::uint1, 10::uint1) s;
SELECT s FROM generate_series(1::uint1, 10::uint1, 2::uint1) s;

-- Ranges block

SELECT uint1range(0, 10);
SELECT uint1range(0::uint1, 255::uint1);
SELECT uint1range(0::uint1, 255::uint1, '[]');
SELECT upper(uint1range(0, 10));
SELECT lower(uint1range(0, 10));
SELECT isempty(uint1range(0, 10));
SELECT uint1range(0, 10) @> 9::uint1;
SELECT uint1range(0, 10) @> 10::uint1;
SELECT uint1range(0, 10) && uint1range(10,20);
SELECT uint1range(0, 10) && uint1range(9,20);
SELECT uint1range(5, 10) - uint1range(5, 10);
SELECT uint1range(5, 10) - uint1range(5, 9);
CREATE TEMPORARY TABLE test_uint1range (
    r uint1range,

    EXCLUDE USING GIST (r WITH &&)
);

INSERT INTO test_uint1range (r) VALUES (uint1range(0, 10));
INSERT INTO test_uint1range (r) VALUES (uint1range(10, 20));
INSERT INTO test_uint1range (r) VALUES (uint1range(19, 30));

DROP TABLE test_uint1range;


-- Testing cross-types compatibility

SELECT 1::uint1 = 1::uint2;
SELECT 1::uint1 = 0::uint2;
SELECT 1::uint1 = 1::uint4;
SELECT 1::uint1 = 0::uint4;
SELECT 1::uint1 = 1::uint8;
SELECT 1::uint1 = 0::uint8;
SELECT 1::uint1 = 1::uint16;
SELECT 1::uint1 = 0::uint16;
SELECT 1::uint1 = 1::int1;
SELECT 1::uint1 = 0::int1;
SELECT 1::uint1 = 1::int16;
SELECT 1::uint1 = 0::int16;

SELECT 1::uint1 <> 0::uint2;
SELECT 0::uint1 <> 0::uint2;
SELECT 1::uint1 <> 0::uint4;
SELECT 0::uint1 <> 0::uint4;
SELECT 1::uint1 <> 0::uint8;
SELECT 0::uint1 <> 0::uint8;
SELECT 1::uint1 <> 0::uint16;
SELECT 0::uint1 <> 0::uint16;
SELECT 1::uint1 <> 0::int1;
SELECT 0::uint1 <> 0::int1;
SELECT 1::uint1 <> 0::int16;
SELECT 0::uint1 <> 0::int16;

SELECT 1::uint1 > 0::uint2;
SELECT 0::uint1 > 1::uint2;
SELECT 1::uint1 > 0::uint4;
SELECT 0::uint1 > 1::uint4;
SELECT 1::uint1 > 0::uint8;
SELECT 0::uint1 > 1::uint8;
SELECT 1::uint1 > 0::uint16;
SELECT 0::uint1 > 1::uint16;
SELECT 1::uint1 > 0::int1;
SELECT 0::uint1 > 1::int1;
SELECT 1::uint1 > 0::int16;
SELECT 0::uint1 > 1::int16;

SELECT 0::uint1 < 1::uint2;
SELECT 1::uint1 < 0::uint2;
SELECT 0::uint1 < 1::uint4;
SELECT 1::uint1 < 0::uint4;
SELECT 0::uint1 < 1::uint8;
SELECT 1::uint1 < 0::uint8;
SELECT 0::uint1 < 1::uint16;
SELECT 1::uint1 < 0::uint16;
SELECT 0::uint1 < 1::int1;
SELECT 1::uint1 < 0::int1;
SELECT 0::uint1 < 1::int16;
SELECT 1::uint1 < 0::int16;

SELECT 1::uint1 >= 0::uint2;
SELECT 0::uint1 >= 1::uint2;
SELECT 1::uint1 >= 1::uint2;
SELECT 1::uint1 >= 0::uint4;
SELECT 0::uint1 >= 1::uint4;
SELECT 1::uint1 >= 1::uint4;
SELECT 1::uint1 >= 0::uint8;
SELECT 0::uint1 >= 1::uint8;
SELECT 1::uint1 >= 1::uint8;
SELECT 1::uint1 >= 0::uint16;
SELECT 0::uint1 >= 1::uint16;
SELECT 1::uint1 >= 1::uint16;
SELECT 1::uint1 >= 0::int1;
SELECT 0::uint1 >= 1::int1;
SELECT 1::uint1 >= 1::int1;
SELECT 1::uint1 >= 0::int16;
SELECT 0::uint1 >= 1::int16;
SELECT 1::uint1 >= 1::int16;

SELECT 0::uint1 <= 1::uint2;
SELECT 1::uint1 <= 0::uint2;
SELECT 1::uint1 <= 1::uint2;
SELECT 0::uint1 <= 1::uint4;
SELECT 1::uint1 <= 0::uint4;
SELECT 1::uint1 <= 1::uint4;
SELECT 0::uint1 <= 1::uint8;
SELECT 1::uint1 <= 0::uint8;
SELECT 1::uint1 <= 1::uint8;
SELECT 0::uint1 <= 1::uint16;
SELECT 1::uint1 <= 0::uint16;
SELECT 1::uint1 <= 1::uint16;
SELECT 0::uint1 <= 1::int1;
SELECT 1::uint1 <= 0::int1;
SELECT 1::uint1 <= 1::int1;
SELECT 0::uint1 <= 1::int16;
SELECT 1::uint1 <= 0::int16;
SELECT 1::uint1 <= 1::int16;

SELECT 25::uint1 + 5::uint2;
SELECT 255::uint1 + 1::uint2;
SELECT 25::uint1 + 5::uint4;
SELECT 255::uint1 + 1::uint4;
SELECT 25::uint1 + 5::uint8;
SELECT 255::uint1 + 1::uint8;
SELECT 25::uint1 + 5::uint16;
SELECT 255::uint1 + 1::uint16;
SELECT 25::uint1 + 5::int1;
SELECT 255::uint1 + 1::int1;
SELECT 25::uint1 + 5::int16;
SELECT 255::uint1 + 1::int16;

SELECT 25::uint1 - 5::uint2;
SELECT 0::uint1 - 1::uint2;
SELECT 25::uint1 - 5::uint4;
SELECT 0::uint1 - 1::uint4;
SELECT 25::uint1 - 5::uint8;
SELECT 0::uint1 - 1::uint8;
SELECT 25::uint1 - 5::uint16;
SELECT 0::uint1 - 1::uint16;
SELECT 25::uint1 - 5::int1;
SELECT 0::uint1 - 1::int1;
SELECT 25::uint1 - 5::int16;
SELECT 0::uint1 - 1::int16;

SELECT 25::uint1 * 5::uint2;
SELECT 255::uint1 * 2::uint2;
SELECT 25::uint1 * 5::uint4;
SELECT 255::uint1 * 2::uint4;
SELECT 25::uint1 * 5::uint8;
SELECT 255::uint1 * 2::uint8;
SELECT 25::uint1 * 5::uint16;
SELECT 255::uint1 * 2::uint16;
SELECT 25::uint1 * 5::int1;
SELECT 255::uint1 * 2::int1;
SELECT 25::uint1 * 5::int16;
SELECT 255::uint1 * 2::int16;

SELECT 25::uint1 / 5::uint2;
SELECT 1::uint1 / 0::uint2;
SELECT 25::uint1 / 5::uint4;
SELECT 1::uint1 / 0::uint4;
SELECT 25::uint1 / 5::uint8;
SELECT 1::uint1 / 0::uint8;
SELECT 25::uint1 / 5::uint16;
SELECT 1::uint1 / 0::uint16;
SELECT 25::uint1 / 5::int1;
SELECT 1::uint1 / 0::int1;
SELECT 25::uint1 / 5::int16;
SELECT 1::uint1 / 0::int16;

SELECT 25::uint1 % 5::uint2;
SELECT 1::uint1 % 0::uint2;
SELECT 25::uint1 % 5::uint4;
SELECT 1::uint1 % 0::uint4;
SELECT 25::uint1 % 5::uint8;
SELECT 1::uint1 % 0::uint8;
SELECT 25::uint1 % 5::uint16;
SELECT 1::uint1 % 0::uint16;
SELECT 25::uint1 % 5::int1;
SELECT 1::uint1 % 0::int1;
SELECT 25::uint1 % 5::int16;
SELECT 1::uint1 % 0::int16;

