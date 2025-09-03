-- Testing cross-types compatibility

SELECT 1::int16 = 1::uint1;
SELECT 1::int16 = 0::uint1;
SELECT 1::int16 = 1::int1;
SELECT 1::int16 = 0::int1;

SELECT 1::int16 <> 0::uint1;
SELECT 0::int16 <> 0::uint1;
SELECT 1::int16 <> 0::int1;
SELECT 0::int16 <> 0::int1;

SELECT 1::int16 > 0::uint1;
SELECT 0::int16 > 1::uint1;
SELECT 1::int16 > 0::int1;
SELECT 0::int16 > 1::int1;

SELECT 0::int16 < 1::uint1;
SELECT 1::int16 < 0::uint1;
SELECT 0::int16 < 1::int1;
SELECT 1::int16 < 0::int1;

SELECT 1::int16 >= 0::uint1;
SELECT 0::int16 >= 1::uint1;
SELECT 1::int16 >= 1::uint1;
SELECT 1::int16 >= 0::int1;
SELECT 0::int16 >= 1::int1;
SELECT 1::int16 >= 1::int1;

SELECT 0::int16 <= 1::uint1;
SELECT 1::int16 <= 0::uint1;
SELECT 1::int16 <= 1::uint1;
SELECT 0::int16 <= 1::int1;
SELECT 1::int16 <= 0::int1;
SELECT 1::int16 <= 1::int1;

SELECT 120::int16 + 10::uint1;
SELECT 170141183460469231731687303715884105727::int16 + 1::uint1;
SELECT (-120)::int16 + 10::uint1;
SELECT 120::int16 + 10::int1;
SELECT 170141183460469231731687303715884105727::int16 + 1::int1;

SELECT 120::int16 - 10::uint1;
SELECT (-170141183460469231731687303715884105728)::int16 - 1::uint1;
SELECT (-120)::int16 - 10::uint1;
SELECT 120::int16 - 10::int1;
SELECT (-170141183460469231731687303715884105728)::int16 - 1::int1;

SELECT 120::int16 * 10::uint1;
SELECT 170141183460469231731687303715884105727::int16 * 2::uint1;
SELECT (-120)::int16 * 10::uint1;
SELECT 120::int16 * 10::int1;
SELECT 170141183460469231731687303715884105727::int16 * 2::int1;

SELECT 120::int16 / 10::uint1;
SELECT 1::int16 / 0::uint1;
SELECT (-120)::int16 / 10::uint1;
SELECT 120::int16 / 10::int1;
SELECT 1::int16 / 0::int1;

SELECT 120::int16 % 10::uint1;
SELECT 1::int16 % 0::uint1;
SELECT (-120)::int16 % 10::uint1;
SELECT 120::int16 % 10::int1;
SELECT 1::int16 % 0::int1;

