-- Testing cross-types compatibility

SELECT 1::uint4 = 1::uint1;
SELECT 1::uint4 = 0::uint1;
SELECT 1::uint4 = 1::int1;
SELECT 1::uint4 = 0::int1;

SELECT 1::uint4 <> 0::uint1;
SELECT 0::uint4 <> 0::uint1;
SELECT 1::uint4 <> 0::int1;
SELECT 0::uint4 <> 0::int1;

SELECT 1::uint4 > 0::uint1;
SELECT 0::uint4 > 1::uint1;
SELECT 1::uint4 > 0::int1;
SELECT 0::uint4 > 1::int1;

SELECT 0::uint4 < 1::uint1;
SELECT 1::uint4 < 0::uint1;
SELECT 0::uint4 < 1::int1;
SELECT 1::uint4 < 0::int1;

SELECT 1::uint4 >= 0::uint1;
SELECT 0::uint4 >= 1::uint1;
SELECT 1::uint4 >= 1::uint1;
SELECT 1::uint4 >= 0::int1;
SELECT 0::uint4 >= 1::int1;
SELECT 1::uint4 >= 1::int1;

SELECT 0::uint4 <= 1::uint1;
SELECT 1::uint4 <= 0::uint1;
SELECT 1::uint4 <= 1::uint1;
SELECT 0::uint4 <= 1::int1;
SELECT 1::uint4 <= 0::int1;
SELECT 1::uint4 <= 1::int1;

SELECT 120::uint4 + 10::uint1;
SELECT 4294967295::uint4 + 1::uint1;
SELECT 120::uint4 + 10::int1;
SELECT 4294967295::uint4 + 1::int1;

SELECT 120::uint4 - 10::uint1;
SELECT 0::uint4 - 1::uint1;
SELECT 120::uint4 - 10::int1;
SELECT 0::uint4 - 1::int1;

SELECT 120::uint4 * 10::uint1;
SELECT 4294967295::uint4 * 2::uint1;
SELECT 120::uint4 * 10::int1;
SELECT 4294967295::uint4 * 2::int1;

SELECT 120::uint4 / 10::uint1;
SELECT 1::uint4 / 0::uint1;
SELECT 120::uint4 / 10::int1;
SELECT 1::uint4 / 0::int1;

SELECT 120::uint4 % 10::uint1;
SELECT 1::uint4 % 0::uint1;
SELECT 120::uint4 % 10::int1;
SELECT 1::uint4 % 0::int1;

