-- Testing cross-types compatibility

SELECT 1::uint2 = 1::uint1;
SELECT 1::uint2 = 0::uint1;
SELECT 1::uint2 = 1::int1;
SELECT 1::uint2 = 0::int1;

SELECT 1::uint2 <> 0::uint1;
SELECT 0::uint2 <> 0::uint1;
SELECT 1::uint2 <> 0::int1;
SELECT 0::uint2 <> 0::int1;

SELECT 1::uint2 > 0::uint1;
SELECT 0::uint2 > 1::uint1;
SELECT 1::uint2 > 0::int1;
SELECT 0::uint2 > 1::int1;

SELECT 0::uint2 < 1::uint1;
SELECT 1::uint2 < 0::uint1;
SELECT 0::uint2 < 1::int1;
SELECT 1::uint2 < 0::int1;

SELECT 1::uint2 >= 0::uint1;
SELECT 0::uint2 >= 1::uint1;
SELECT 1::uint2 >= 1::uint1;
SELECT 1::uint2 >= 0::int1;
SELECT 0::uint2 >= 1::int1;
SELECT 1::uint2 >= 1::int1;

SELECT 0::uint2 <= 1::uint1;
SELECT 1::uint2 <= 0::uint1;
SELECT 1::uint2 <= 1::uint1;
SELECT 0::uint2 <= 1::int1;
SELECT 1::uint2 <= 0::int1;
SELECT 1::uint2 <= 1::int1;

SELECT 120::uint2 + 10::uint1;
SELECT 65535::uint2 + 1::uint1;
SELECT 120::uint2 + 10::int1;
SELECT 65535::uint2 + 1::int1;

SELECT 120::uint2 - 10::uint1;
SELECT 0::uint2 - 1::uint1;
SELECT 120::uint2 - 10::int1;
SELECT 0::uint2 - 1::int1;

SELECT 120::uint2 * 10::uint1;
SELECT 65535::uint2 * 2::uint1;
SELECT 120::uint2 * 10::int1;
SELECT 65535::uint2 * 2::int1;

SELECT 120::uint2 / 10::uint1;
SELECT 1::uint2 / 0::uint1;
SELECT 120::uint2 / 10::int1;
SELECT 1::uint2 / 0::int1;

SELECT 120::uint2 % 10::uint1;
SELECT 1::uint2 % 0::uint1;
SELECT 120::uint2 % 10::int1;
SELECT 1::uint2 % 0::int1;

