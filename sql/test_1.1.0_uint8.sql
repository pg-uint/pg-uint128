-- Testing cross-types compatibility

SELECT 1::uint8 = 1::uint1;
SELECT 1::uint8 = 0::uint1;
SELECT 1::uint8 = 1::int1;
SELECT 1::uint8 = 0::int1;

SELECT 1::uint8 <> 0::uint1;
SELECT 0::uint8 <> 0::uint1;
SELECT 1::uint8 <> 0::int1;
SELECT 0::uint8 <> 0::int1;

SELECT 1::uint8 > 0::uint1;
SELECT 0::uint8 > 1::uint1;
SELECT 1::uint8 > 0::int1;
SELECT 0::uint8 > 1::int1;

SELECT 0::uint8 < 1::uint1;
SELECT 1::uint8 < 0::uint1;
SELECT 0::uint8 < 1::int1;
SELECT 1::uint8 < 0::int1;

SELECT 1::uint8 >= 0::uint1;
SELECT 0::uint8 >= 1::uint1;
SELECT 1::uint8 >= 1::uint1;
SELECT 1::uint8 >= 0::int1;
SELECT 0::uint8 >= 1::int1;
SELECT 1::uint8 >= 1::int1;

SELECT 0::uint8 <= 1::uint1;
SELECT 1::uint8 <= 0::uint1;
SELECT 1::uint8 <= 1::uint1;
SELECT 0::uint8 <= 1::int1;
SELECT 1::uint8 <= 0::int1;
SELECT 1::uint8 <= 1::int1;

SELECT 120::uint8 + 10::uint1;
SELECT 18446744073709551615::uint8 + 1::uint1;
SELECT 120::uint8 + 10::int1;
SELECT 18446744073709551615::uint8 + 1::int1;

SELECT 120::uint8 - 10::uint1;
SELECT 0::uint8 - 1::uint1;
SELECT 120::uint8 - 10::int1;
SELECT 0::uint8 - 1::int1;

SELECT 120::uint8 * 10::uint1;
SELECT 18446744073709551615::uint8 * 2::uint1;
SELECT 120::uint8 * 10::int1;
SELECT 18446744073709551615::uint8 * 2::int1;

SELECT 120::uint8 / 10::uint1;
SELECT 1::uint8 / 0::uint1;
SELECT 120::uint8 / 10::int1;
SELECT 1::uint8 / 0::int1;

SELECT 120::uint8 % 10::uint1;
SELECT 1::uint8 % 0::uint1;
SELECT 120::uint8 % 10::int1;
SELECT 1::uint8 % 0::int1;

