-- Testing uint4

-- From string block

-- NULL
SELECT NULL::text::uint4;
-- Empty
SELECT ''::text::uint4;
-- Zero
SELECT '0'::text::uint4;
-- Min
SELECT '0'::text::uint4;
-- Max
SELECT '4294967295'::text::uint4;
-- Underflow
SELECT '-1'::uint4;
-- Overflow
SELECT '4294967296'::uint4;

-- Ops block

SELECT 1::uint4 = 1::uint4;
SELECT 1::uint4 = 0::uint4;
SELECT 1::uint4 = 1::int2;
SELECT 1::uint4 = 0::int2;
SELECT 1::int2 = 1::uint4;
SELECT 1::int2 = 0::uint4;
SELECT 1::uint4 = 1::int4;
SELECT 1::uint4 = 0::int4;
SELECT 1::int4 = 1::uint4;
SELECT 1::int4 = 0::uint4;
SELECT 1::uint4 = 1::int8;
SELECT 1::uint4 = 0::int8;
SELECT 1::int8 = 1::uint4;
SELECT 1::int8 = 0::uint4;

SELECT 1::uint4 <> 0::uint4;
SELECT 0::uint4 <> 0::uint4;
SELECT 1::uint4 <> 0::int2;
SELECT 0::uint4 <> 0::int2;
SELECT 1::int2 <> 0::uint4;
SELECT 0::int2 <> 0::uint4;
SELECT 1::uint4 <> 0::int4;
SELECT 0::uint4 <> 0::int4;
SELECT 1::int4 <> 0::uint4;
SELECT 0::int4 <> 0::uint4;
SELECT 1::uint4 <> 0::int8;
SELECT 0::uint4 <> 0::int8;
SELECT 1::int8 <> 0::uint4;
SELECT 0::int8 <> 0::uint4;

SELECT 1::uint4 > 0::uint4;
SELECT 0::uint4 > 1::uint4;
SELECT 1::uint4 > 0::int2;
SELECT 0::uint4 > 1::int2;
SELECT 1::int2 > 0::uint4;
SELECT 0::int2 > 1::uint4;
SELECT 1::uint4 > 0::int4;
SELECT 0::uint4 > 1::int4;
SELECT 1::int4 > 0::uint4;
SELECT 0::int4 > 1::uint4;
SELECT 1::uint4 > 0::int8;
SELECT 0::uint4 > 1::int8;
SELECT 1::int8 > 0::uint4;
SELECT 0::int8 > 1::uint4;

SELECT 0::uint4 < 1::uint4;
SELECT 1::uint4 < 0::uint4;
SELECT 0::uint4 < 1::int2;
SELECT 1::uint4 < 0::int2;
SELECT 0::int2 < 1::uint4;
SELECT 1::int2 < 0::uint4;
SELECT 0::uint4 < 1::int4;
SELECT 1::uint4 < 0::int4;
SELECT 0::int4 < 1::uint4;
SELECT 1::int4 < 0::uint4;
SELECT 0::uint4 < 1::int8;
SELECT 1::uint4 < 0::int8;
SELECT 0::int8 < 1::uint4;
SELECT 1::int8 < 0::uint4;

SELECT 1::uint4 >= 0::uint4;
SELECT 0::uint4 >= 1::uint4;
SELECT 1::uint4 >= 1::uint4;
SELECT 1::uint4 >= 0::int2;
SELECT 0::uint4 >= 1::int2;
SELECT 1::uint4 >= 1::int2;
SELECT 1::int2 >= 0::uint4;
SELECT 0::int2 >= 1::uint4;
SELECT 1::int2 >= 1::uint4;
SELECT 1::uint4 >= 0::int4;
SELECT 0::uint4 >= 1::int4;
SELECT 1::uint4 >= 1::int4;
SELECT 1::int4 >= 0::uint4;
SELECT 0::int4 >= 1::uint4;
SELECT 1::int4 >= 1::uint4;
SELECT 1::uint4 >= 0::int8;
SELECT 0::uint4 >= 1::int8;
SELECT 1::uint4 >= 1::int8;
SELECT 1::int8 >= 0::uint4;
SELECT 0::int8 >= 1::uint4;
SELECT 1::int8 >= 1::uint4;

SELECT 0::uint4 <= 1::uint4;
SELECT 1::uint4 <= 0::uint4;
SELECT 1::uint4 <= 1::uint4;
SELECT 0::uint4 <= 1::int2;
SELECT 1::uint4 <= 0::int2;
SELECT 1::uint4 <= 1::int2;
SELECT 0::int2 <= 1::uint4;
SELECT 1::int2 <= 0::uint4;
SELECT 1::int2 <= 1::uint4;
SELECT 0::uint4 <= 1::int4;
SELECT 1::uint4 <= 0::int4;
SELECT 1::uint4 <= 1::int4;
SELECT 0::int4 <= 1::uint4;
SELECT 1::int4 <= 0::uint4;
SELECT 1::int4 <= 1::uint4;
SELECT 0::uint4 <= 1::int8;
SELECT 1::uint4 <= 0::int8;
SELECT 1::uint4 <= 1::int8;
SELECT 0::int8 <= 1::uint4;
SELECT 1::int8 <= 0::uint4;
SELECT 1::int8 <= 1::uint4;

SELECT 120::uint4 + 10::uint4;
SELECT 120::uint4 + 10::int2;
SELECT 4294967295::uint4 + 1::int2;
SELECT 120::int2 + 10::uint4;
SELECT 32767::int2 + 1::uint4;
SELECT (-120)::int2 + 10::uint4;
SELECT 120::uint4 + 10::int4;
SELECT 4294967295::uint4 + 1::int4;
SELECT 120::int4 + 10::uint4;
SELECT 2147483647::int4 + 1::uint4;
SELECT (-120)::int4 + 10::uint4;
SELECT 120::uint4 + 10::int8;
SELECT 4294967295::uint4 + 1::int8;
SELECT 120::int8 + 10::uint4;
SELECT 9223372036854775807::int8 + 1::uint4;
SELECT (-120)::int8 + 10::uint4;

SELECT 120::uint4 - 10::uint4;
SELECT 120::uint4 - 10::int2;
SELECT 0::uint4 - 1::int2;
SELECT 120::int2 - 10::uint4;
SELECT (-32768)::int2 - 1::uint4;
SELECT (-120)::int2 - 10::uint4;
SELECT 120::uint4 - 10::int4;
SELECT 0::uint4 - 1::int4;
SELECT 120::int4 - 10::uint4;
SELECT (-2147483648)::int4 - 1::uint4;
SELECT (-120)::int4 - 10::uint4;
SELECT 120::uint4 - 10::int8;
SELECT 0::uint4 - 1::int8;
SELECT 120::int8 - 10::uint4;
SELECT (-9223372036854775808)::int8 - 1::uint4;
SELECT (-120)::int8 - 10::uint4;

SELECT 120::uint4 * 10::uint4;
SELECT 120::uint4 * 10::int2;
SELECT 4294967295::uint4 * 2::int2;
SELECT 120::int2 * 10::uint4;
SELECT 32767::int2 * 2::uint4;
SELECT (-120)::int2 * 10::uint4;
SELECT 120::uint4 * 10::int4;
SELECT 4294967295::uint4 * 2::int4;
SELECT 120::int4 * 10::uint4;
SELECT 2147483647::int4 * 2::uint4;
SELECT (-120)::int4 * 10::uint4;
SELECT 120::uint4 * 10::int8;
SELECT 4294967295::uint4 * 2::int8;
SELECT 120::int8 * 10::uint4;
SELECT 9223372036854775807::int8 * 2::uint4;
SELECT (-120)::int8 * 10::uint4;

SELECT 120::uint4 / 10::uint4;
SELECT 120::uint4 / 10::int2;
SELECT 1::uint4 / 0::int2;
SELECT 120::int2 / 10::uint4;
SELECT 1::int2 / 0::uint4;
SELECT (-120)::int2 / 10::uint4;
SELECT 120::uint4 / 10::int4;
SELECT 1::uint4 / 0::int4;
SELECT 120::int4 / 10::uint4;
SELECT 1::int4 / 0::uint4;
SELECT (-120)::int4 / 10::uint4;
SELECT 120::uint4 / 10::int8;
SELECT 1::uint4 / 0::int8;
SELECT 120::int8 / 10::uint4;
SELECT 1::int8 / 0::uint4;
SELECT (-120)::int8 / 10::uint4;

SELECT 120::uint4 % 10::uint4;
SELECT 120::uint4 % 10::int2;
SELECT 1::uint4 % 0::int2;
SELECT 120::int2 % 10::uint4;
SELECT 1::int2 % 0::uint4;
SELECT (-120)::int2 % 10::uint4;
SELECT 120::uint4 % 10::int4;
SELECT 1::uint4 % 0::int4;
SELECT 120::int4 % 10::uint4;
SELECT 1::int4 % 0::uint4;
SELECT (-120)::int4 % 10::uint4;
SELECT 120::uint4 % 10::int8;
SELECT 1::uint4 % 0::int8;
SELECT 120::int8 % 10::uint4;
SELECT 1::int8 % 0::uint4;
SELECT (-120)::int8 % 10::uint4;

-- Agg ops block

SELECT sum(s::uint4) FROM generate_series(1, 10000) s;
SELECT avg(s::uint4) FROM generate_series(1, 10000) s;
SELECT min(s::uint4) FROM generate_series(1, 10000) s;
SELECT max(s::uint4) FROM generate_series(1, 10000) s;

-- Generate series block

SELECT s FROM generate_series(1::uint4, 10::uint4) s;
SELECT s FROM generate_series(1::uint4, 10::uint4, 2::uint4) s;

-- Ranges block

SELECT uint4range(0::uint4, 10::uint4);
SELECT uint4range(0::uint4, 4294967295::uint4);
SELECT uint4range(0::uint4, 4294967295::uint4, '[]');
SELECT upper(uint4range(0::uint4, 10::uint4));
SELECT lower(uint4range(0::uint4, 10::uint4));
SELECT isempty(uint4range(0::uint4, 10::uint4));
SELECT uint4range(0::uint4, 10::uint4) @> 9::uint4;
SELECT uint4range(0::uint4, 10::uint4) @> 10::uint4;
SELECT uint4range(0::uint4, 10::uint4) && uint4range(10::uint4,20::uint4);
SELECT uint4range(0::uint4, 10::uint4) && uint4range(9::uint4,20::uint4);
SELECT uint4range(5::uint4, 10::uint4) - uint4range(5::uint4, 10::uint4);
SELECT uint4range(5::uint4, 10::uint4) - uint4range(5::uint4, 9::uint4);
CREATE TEMPORARY TABLE test_uint4range (
    r uint4range,

    EXCLUDE USING GIST (r WITH &&)
);

INSERT INTO test_uint4range (r) VALUES (uint4range(0::uint4, 10::uint4));
INSERT INTO test_uint4range (r) VALUES (uint4range(10::uint4, 20::uint4));
INSERT INTO test_uint4range (r) VALUES (uint4range(19::uint4, 30::uint4));

DROP TABLE test_uint4range;
