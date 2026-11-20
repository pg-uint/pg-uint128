-- Testing int16

-- From string block

-- NULL
SELECT NULL::text::int16;
-- Empty
SELECT ''::text::int16;
-- Zero
SELECT '0'::text::int16;
-- Min
SELECT '-170141183460469231731687303715884105728'::text::int16;
-- Max
SELECT '170141183460469231731687303715884105727'::text::int16;
-- Underflow
SELECT '-170141183460469231731687303715884105729'::int16;
-- Overflow
SELECT '170141183460469231731687303715884105728'::int16;

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

-- Agg ops block

SELECT sum(s::int16) FROM generate_series(1, 10000) s;
SELECT avg(s::int16) FROM generate_series(1, 10000) s;
SELECT min(s::int16) FROM generate_series(1, 10000) s;
SELECT max(s::int16) FROM generate_series(1, 10000) s;

-- Generate series block

SELECT s FROM generate_series(1::int16, 10::int16) s;
SELECT s FROM generate_series(1::int16, 10::int16, 2::int16) s;

-- Ranges block

SELECT int16range(0::int16, 10::int16);
SELECT int16range((-170141183460469231731687303715884105728)::int16, 170141183460469231731687303715884105727::int16);
SELECT int16range((-170141183460469231731687303715884105728)::int16, 170141183460469231731687303715884105727::int16, '[]');
SELECT upper(int16range(0::int16, 10::int16));
SELECT lower(int16range(0::int16, 10::int16));
SELECT isempty(int16range(0::int16, 10::int16));
SELECT int16range(0::int16, 10::int16) @> 9::int16;
SELECT int16range(0::int16, 10::int16) @> 10::int16;
SELECT int16range(0::int16, 10::int16) && int16range(10::int16,20::int16);
SELECT int16range(0::int16, 10::int16) && int16range(9::int16,20::int16);
SELECT int16range(5::int16, 10::int16) - int16range(5::int16, 10::int16);
SELECT int16range(5::int16, 10::int16) - int16range(5::int16, 9::int16);
CREATE TEMPORARY TABLE test_int16range (
    r int16range,

    EXCLUDE USING GIST (r WITH &&)
);

INSERT INTO test_int16range (r) VALUES (int16range(0::int16, 10::int16));
INSERT INTO test_int16range (r) VALUES (int16range(10::int16, 20::int16));
INSERT INTO test_int16range (r) VALUES (int16range(19::int16, 30::int16));

DROP TABLE test_int16range;

-- Sequential and indexed scans must return the same actual rows.
-- A constant on the left makes index conditions depend on the operator's commutator.
-- Incorrect commutators can select the opposite range; planner estimates are not tested.
CREATE TEMP TABLE test_int16_commutators (n int16);
INSERT INTO test_int16_commutators VALUES (1), (2), (3);
CREATE INDEX ON test_int16_commutators (n);
SET enable_seqscan = on;
SET enable_indexscan = off;
SET enable_bitmapscan = off;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 < n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 <= n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 > n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 >= n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 < n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 <= n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 > n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 >= n;
SET enable_seqscan = off;
SET enable_indexscan = on;
SET enable_bitmapscan = on;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 < n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 <= n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 > n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int16 >= n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 < n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 <= n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 > n;
SELECT array_agg(n ORDER BY n)::text AS matches FROM test_int16_commutators WHERE 2::int4 >= n;
RESET enable_seqscan;
RESET enable_indexscan;
RESET enable_bitmapscan;
DROP TABLE test_int16_commutators;
