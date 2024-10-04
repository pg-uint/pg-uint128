-- Testing int16

-- Ops block

SELECT 1::int16 = 1::int16;
SELECT 1::int16 = 0::int16;
SELECT 1::int16 = 1::int2;
SELECT 1::int16 = 0::int2;
SELECT 1::int2 = 1::int16;
SELECT 1::int2 = 0::int16;
SELECT 1::int16 = 1::int4;
SELECT 1::int16 = 0::int4;
SELECT 1::int4 = 1::int16;
SELECT 1::int4 = 0::int16;
SELECT 1::int16 = 1::int8;
SELECT 1::int16 = 0::int8;
SELECT 1::int8 = 1::int16;
SELECT 1::int8 = 0::int16;

SELECT 1::int16 <> 0::int16;
SELECT 0::int16 <> 0::int16;
SELECT 1::int16 <> 0::int2;
SELECT 0::int16 <> 0::int2;
SELECT 1::int2 <> 0::int16;
SELECT 0::int2 <> 0::int16;
SELECT 1::int16 <> 0::int4;
SELECT 0::int16 <> 0::int4;
SELECT 1::int4 <> 0::int16;
SELECT 0::int4 <> 0::int16;
SELECT 1::int16 <> 0::int8;
SELECT 0::int16 <> 0::int8;
SELECT 1::int8 <> 0::int16;
SELECT 0::int8 <> 0::int16;

SELECT 1::int16 > 0::int16;
SELECT 0::int16 > 1::int16;
SELECT 1::int16 > 0::int2;
SELECT 0::int16 > 1::int2;
SELECT 1::int2 > 0::int16;
SELECT 0::int2 > 1::int16;
SELECT 1::int16 > 0::int4;
SELECT 0::int16 > 1::int4;
SELECT 1::int4 > 0::int16;
SELECT 0::int4 > 1::int16;
SELECT 1::int16 > 0::int8;
SELECT 0::int16 > 1::int8;
SELECT 1::int8 > 0::int16;
SELECT 0::int8 > 1::int16;

SELECT 0::int16 < 1::int16;
SELECT 1::int16 < 0::int16;
SELECT 0::int16 < 1::int2;
SELECT 1::int16 < 0::int2;
SELECT 0::int2 < 1::int16;
SELECT 1::int2 < 0::int16;
SELECT 0::int16 < 1::int4;
SELECT 1::int16 < 0::int4;
SELECT 0::int4 < 1::int16;
SELECT 1::int4 < 0::int16;
SELECT 0::int16 < 1::int8;
SELECT 1::int16 < 0::int8;
SELECT 0::int8 < 1::int16;
SELECT 1::int8 < 0::int16;

SELECT 1::int16 >= 0::int16;
SELECT 0::int16 >= 1::int16;
SELECT 1::int16 >= 1::int16;
SELECT 1::int16 >= 0::int2;
SELECT 0::int16 >= 1::int2;
SELECT 1::int16 >= 1::int2;
SELECT 1::int2 >= 0::int16;
SELECT 0::int2 >= 1::int16;
SELECT 1::int2 >= 1::int16;
SELECT 1::int16 >= 0::int4;
SELECT 0::int16 >= 1::int4;
SELECT 1::int16 >= 1::int4;
SELECT 1::int4 >= 0::int16;
SELECT 0::int4 >= 1::int16;
SELECT 1::int4 >= 1::int16;
SELECT 1::int16 >= 0::int8;
SELECT 0::int16 >= 1::int8;
SELECT 1::int16 >= 1::int8;
SELECT 1::int8 >= 0::int16;
SELECT 0::int8 >= 1::int16;
SELECT 1::int8 >= 1::int16;

SELECT 0::int16 <= 1::int16;
SELECT 1::int16 <= 0::int16;
SELECT 1::int16 <= 1::int16;
SELECT 0::int16 <= 1::int2;
SELECT 1::int16 <= 0::int2;
SELECT 1::int16 <= 1::int2;
SELECT 0::int2 <= 1::int16;
SELECT 1::int2 <= 0::int16;
SELECT 1::int2 <= 1::int16;
SELECT 0::int16 <= 1::int4;
SELECT 1::int16 <= 0::int4;
SELECT 1::int16 <= 1::int4;
SELECT 0::int4 <= 1::int16;
SELECT 1::int4 <= 0::int16;
SELECT 1::int4 <= 1::int16;
SELECT 0::int16 <= 1::int8;
SELECT 1::int16 <= 0::int8;
SELECT 1::int16 <= 1::int8;
SELECT 0::int8 <= 1::int16;
SELECT 1::int8 <= 0::int16;
SELECT 1::int8 <= 1::int16;

SELECT 120::int16 + 10::int16;
SELECT 120::int16 + 10::int2;
SELECT 170141183460469231731687303715884105727::int16 + 1::int2;
SELECT 120::int2 + 10::int16;
SELECT 32767::int2 + 1::int16;
SELECT 120::int16 + 10::int4;
SELECT 170141183460469231731687303715884105727::int16 + 1::int4;
SELECT 120::int4 + 10::int16;
SELECT 2147483647::int4 + 1::int16;
SELECT 120::int16 + 10::int8;
SELECT 170141183460469231731687303715884105727::int16 + 1::int8;
SELECT 120::int8 + 10::int16;
SELECT 9223372036854775807::int8 + 1::int16;

SELECT 120::int16 - 10::int16;
SELECT 120::int16 - 10::int2;
SELECT (-170141183460469231731687303715884105728)::int16 - 1::int2;
SELECT 120::int2 - 10::int16;
SELECT (-32768)::int2 - 1::int16;
SELECT 120::int16 - 10::int4;
SELECT (-170141183460469231731687303715884105728)::int16 - 1::int4;
SELECT 120::int4 - 10::int16;
SELECT (-2147483648)::int4 - 1::int16;
SELECT 120::int16 - 10::int8;
SELECT (-170141183460469231731687303715884105728)::int16 - 1::int8;
SELECT 120::int8 - 10::int16;
SELECT (-9223372036854775808)::int8 - 1::int16;

SELECT 120::int16 * 10::int16;
SELECT 120::int16 * 10::int2;
SELECT 170141183460469231731687303715884105727::int16 * 2::int2;
SELECT 120::int2 * 10::int16;
SELECT 32767::int2 * 2::int16;
SELECT 120::int16 * 10::int4;
SELECT 170141183460469231731687303715884105727::int16 * 2::int4;
SELECT 120::int4 * 10::int16;
SELECT 2147483647::int4 * 2::int16;
SELECT 120::int16 * 10::int8;
SELECT 170141183460469231731687303715884105727::int16 * 2::int8;
SELECT 120::int8 * 10::int16;
SELECT 9223372036854775807::int8 * 2::int16;

SELECT 120::int16 / 10::int16;
SELECT 120::int16 / 10::int2;
SELECT 1::int16 / 0::int2;
SELECT 120::int2 / 10::int16;
SELECT 1::int2 / 0::int16;
SELECT 120::int16 / 10::int4;
SELECT 1::int16 / 0::int4;
SELECT 120::int4 / 10::int16;
SELECT 1::int4 / 0::int16;
SELECT 120::int16 / 10::int8;
SELECT 1::int16 / 0::int8;
SELECT 120::int8 / 10::int16;
SELECT 1::int8 / 0::int16;

SELECT 120::int16 % 10::int16;
SELECT 120::int16 % 10::int2;
SELECT 1::int16 % 0::int2;
SELECT 120::int2 % 10::int16;
SELECT 1::int2 % 0::int16;
SELECT 120::int16 % 10::int4;
SELECT 1::int16 % 0::int4;
SELECT 120::int4 % 10::int16;
SELECT 1::int4 % 0::int16;
SELECT 120::int16 % 10::int8;
SELECT 1::int16 % 0::int8;
SELECT 120::int8 % 10::int16;
SELECT 1::int8 % 0::int16;

