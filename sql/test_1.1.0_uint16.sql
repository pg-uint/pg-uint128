-- Testing cross-types compatibility

SELECT 1::uint16 = 1::uint1;
SELECT 1::uint16 = 0::uint1;
SELECT 1::uint16 = 1::int1;
SELECT 1::uint16 = 0::int1;

SELECT 1::uint16 <> 0::uint1;
SELECT 0::uint16 <> 0::uint1;
SELECT 1::uint16 <> 0::int1;
SELECT 0::uint16 <> 0::int1;

SELECT 1::uint16 > 0::uint1;
SELECT 0::uint16 > 1::uint1;
SELECT 1::uint16 > 0::int1;
SELECT 0::uint16 > 1::int1;

SELECT 0::uint16 < 1::uint1;
SELECT 1::uint16 < 0::uint1;
SELECT 0::uint16 < 1::int1;
SELECT 1::uint16 < 0::int1;

SELECT 1::uint16 >= 0::uint1;
SELECT 0::uint16 >= 1::uint1;
SELECT 1::uint16 >= 1::uint1;
SELECT 1::uint16 >= 0::int1;
SELECT 0::uint16 >= 1::int1;
SELECT 1::uint16 >= 1::int1;

SELECT 0::uint16 <= 1::uint1;
SELECT 1::uint16 <= 0::uint1;
SELECT 1::uint16 <= 1::uint1;
SELECT 0::uint16 <= 1::int1;
SELECT 1::uint16 <= 0::int1;
SELECT 1::uint16 <= 1::int1;

SELECT 120::uint16 + 10::uint1;
SELECT 340282366920938463463374607431768211455::uint16 + 1::uint1;
SELECT 120::uint16 + 10::int1;
SELECT 340282366920938463463374607431768211455::uint16 + 1::int1;

SELECT 120::uint16 - 10::uint1;
SELECT 0::uint16 - 1::uint1;
SELECT 120::uint16 - 10::int1;
SELECT 0::uint16 - 1::int1;

SELECT 120::uint16 * 10::uint1;
SELECT 340282366920938463463374607431768211455::uint16 * 2::uint1;
SELECT 120::uint16 * 10::int1;
SELECT 340282366920938463463374607431768211455::uint16 * 2::int1;

SELECT 120::uint16 / 10::uint1;
SELECT 1::uint16 / 0::uint1;
SELECT 120::uint16 / 10::int1;
SELECT 1::uint16 / 0::int1;

SELECT 120::uint16 % 10::uint1;
SELECT 1::uint16 % 0::uint1;
SELECT 120::uint16 % 10::int1;
SELECT 1::uint16 % 0::int1;

