CREATE TYPE uint1;
CREATE TYPE int1;
-- Type uint1 block

CREATE FUNCTION uint1_in(cstring) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_in';

CREATE FUNCTION uint1_out(uint1) RETURNS cstring
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_out';

CREATE FUNCTION uint1_recv(internal) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_recv';

CREATE FUNCTION uint1_send(uint1) RETURNS bytea
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_send';

CREATE TYPE uint1 (
    INPUT = uint1_in,
    OUTPUT = uint1_out,
    RECEIVE = uint1_recv,
    SEND = uint1_send,
    INTERNALLENGTH = 1,
    PASSEDBYVALUE,
    ALIGNMENT = char
);


-- In-out casts block

CREATE CAST (double precision AS uint1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (uint1 AS double precision) WITH INOUT AS IMPLICIT;

CREATE CAST (numeric AS uint1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (uint1 AS numeric) WITH INOUT AS IMPLICIT;

CREATE CAST (real AS uint1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (uint1 AS real) WITH INOUT AS IMPLICIT;


-- Casts block

CREATE FUNCTION uint1_from_int2(int2) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int2';

CREATE FUNCTION uint1_to_int2(uint1) RETURNS int2
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_int2';

CREATE CAST (int2 AS uint1) WITH FUNCTION uint1_from_int2(int2) AS IMPLICIT;
CREATE CAST (uint1 AS int2) WITH FUNCTION uint1_to_int2(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_int4(int4) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int4';

CREATE FUNCTION uint1_to_int4(uint1) RETURNS int4
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_int4';

CREATE CAST (int4 AS uint1) WITH FUNCTION uint1_from_int4(int4) AS IMPLICIT;
CREATE CAST (uint1 AS int4) WITH FUNCTION uint1_to_int4(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_int8(int8) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int8';

CREATE FUNCTION uint1_to_int8(uint1) RETURNS int8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_int8';

CREATE CAST (int8 AS uint1) WITH FUNCTION uint1_from_int8(int8) AS IMPLICIT;
CREATE CAST (uint1 AS int8) WITH FUNCTION uint1_to_int8(uint1) AS IMPLICIT;

-- Ops block

CREATE FUNCTION uint1_eq_uint1(uint1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_uint1';

CREATE FUNCTION uint1_eq_int2(uint1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_int2';

CREATE FUNCTION int2_eq_uint1(int2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_eq_uint1';

CREATE FUNCTION uint1_eq_int4(uint1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_int4';

CREATE FUNCTION int4_eq_uint1(int4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_eq_uint1';

CREATE FUNCTION uint1_eq_int8(uint1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_int8';

CREATE FUNCTION int8_eq_uint1(int8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_eq_uint1';


CREATE FUNCTION uint1_ne_uint1(uint1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_uint1';

CREATE FUNCTION uint1_ne_int2(uint1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_int2';

CREATE FUNCTION int2_ne_uint1(int2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_ne_uint1';

CREATE FUNCTION uint1_ne_int4(uint1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_int4';

CREATE FUNCTION int4_ne_uint1(int4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_ne_uint1';

CREATE FUNCTION uint1_ne_int8(uint1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_int8';

CREATE FUNCTION int8_ne_uint1(int8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_ne_uint1';


CREATE FUNCTION uint1_gt_uint1(uint1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_uint1';

CREATE FUNCTION uint1_gt_int2(uint1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_int2';

CREATE FUNCTION int2_gt_uint1(int2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_gt_uint1';

CREATE FUNCTION uint1_gt_int4(uint1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_int4';

CREATE FUNCTION int4_gt_uint1(int4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_gt_uint1';

CREATE FUNCTION uint1_gt_int8(uint1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_int8';

CREATE FUNCTION int8_gt_uint1(int8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_gt_uint1';


CREATE FUNCTION uint1_lt_uint1(uint1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_uint1';

CREATE FUNCTION uint1_lt_int2(uint1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_int2';

CREATE FUNCTION int2_lt_uint1(int2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_lt_uint1';

CREATE FUNCTION uint1_lt_int4(uint1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_int4';

CREATE FUNCTION int4_lt_uint1(int4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_lt_uint1';

CREATE FUNCTION uint1_lt_int8(uint1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_int8';

CREATE FUNCTION int8_lt_uint1(int8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_lt_uint1';


CREATE FUNCTION uint1_ge_uint1(uint1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_uint1';

CREATE FUNCTION uint1_ge_int2(uint1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_int2';

CREATE FUNCTION int2_ge_uint1(int2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_ge_uint1';

CREATE FUNCTION uint1_ge_int4(uint1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_int4';

CREATE FUNCTION int4_ge_uint1(int4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_ge_uint1';

CREATE FUNCTION uint1_ge_int8(uint1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_int8';

CREATE FUNCTION int8_ge_uint1(int8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_ge_uint1';


CREATE FUNCTION uint1_le_uint1(uint1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_uint1';

CREATE FUNCTION uint1_le_int2(uint1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_int2';

CREATE FUNCTION int2_le_uint1(int2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_le_uint1';

CREATE FUNCTION uint1_le_int4(uint1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_int4';

CREATE FUNCTION int4_le_uint1(int4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_le_uint1';

CREATE FUNCTION uint1_le_int8(uint1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_int8';

CREATE FUNCTION int8_le_uint1(int8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_le_uint1';


CREATE FUNCTION uint1_add_uint1(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_uint1';

CREATE FUNCTION uint1_add_int2(uint1, int2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_int2';

CREATE FUNCTION int2_add_uint1(int2, uint1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_add_uint1';

CREATE FUNCTION uint1_add_int4(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_int4';

CREATE FUNCTION int4_add_uint1(int4, uint1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_add_uint1';

CREATE FUNCTION uint1_add_int8(uint1, int8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_int8';

CREATE FUNCTION int8_add_uint1(int8, uint1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_add_uint1';


CREATE FUNCTION uint1_sub_uint1(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_uint1';

CREATE FUNCTION uint1_sub_int2(uint1, int2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_int2';

CREATE FUNCTION int2_sub_uint1(int2, uint1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_sub_uint1';

CREATE FUNCTION uint1_sub_int4(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_int4';

CREATE FUNCTION int4_sub_uint1(int4, uint1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_sub_uint1';

CREATE FUNCTION uint1_sub_int8(uint1, int8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_int8';

CREATE FUNCTION int8_sub_uint1(int8, uint1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_sub_uint1';


CREATE FUNCTION uint1_mul_uint1(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_uint1';

CREATE FUNCTION uint1_mul_int2(uint1, int2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_int2';

CREATE FUNCTION int2_mul_uint1(int2, uint1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_mul_uint1';

CREATE FUNCTION uint1_mul_int4(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_int4';

CREATE FUNCTION int4_mul_uint1(int4, uint1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_mul_uint1';

CREATE FUNCTION uint1_mul_int8(uint1, int8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_int8';

CREATE FUNCTION int8_mul_uint1(int8, uint1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_mul_uint1';


CREATE FUNCTION uint1_div_uint1(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_uint1';

CREATE FUNCTION uint1_div_int2(uint1, int2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_int2';

CREATE FUNCTION int2_div_uint1(int2, uint1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_div_uint1';

CREATE FUNCTION uint1_div_int4(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_int4';

CREATE FUNCTION int4_div_uint1(int4, uint1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_div_uint1';

CREATE FUNCTION uint1_div_int8(uint1, int8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_int8';

CREATE FUNCTION int8_div_uint1(int8, uint1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_div_uint1';


CREATE FUNCTION uint1_mod_uint1(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_uint1';

CREATE FUNCTION uint1_mod_int2(uint1, int2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_int2';

CREATE FUNCTION int2_mod_uint1(int2, uint1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_mod_uint1';

CREATE FUNCTION uint1_mod_int4(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_int4';

CREATE FUNCTION int4_mod_uint1(int4, uint1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_mod_uint1';

CREATE FUNCTION uint1_mod_int8(uint1, int8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_int8';

CREATE FUNCTION int8_mod_uint1(int8, uint1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_mod_uint1';


CREATE FUNCTION uint1_xor(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_xor';


CREATE FUNCTION uint1_and(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_and';


CREATE FUNCTION uint1_or(uint1, uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_or';


CREATE FUNCTION uint1_not(uint1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_not';

CREATE FUNCTION uint1_shl(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_shl';


CREATE FUNCTION uint1_shr(uint1, int4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_shr';


CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_eq_int2,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_eq_int4,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_eq_int8,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_ne_int2,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_ne_int4,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_ne_int8,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_gt_int2,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_gt_int4,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_gt_int8,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_lt_int2,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_lt_int4,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_lt_int8,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_ge_int2,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_ge_int4,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_ge_int8,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_le_int2,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_le_int4,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_le_int8,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_add_int2,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_add_int4,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_add_int8,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_add_uint1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_sub_int2,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_sub_int4,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_sub_int8,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_sub_uint1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_mul_int2
);

CREATE OPERATOR * (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_mul_int4
);

CREATE OPERATOR * (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_mul_int8
);

CREATE OPERATOR * (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_mul_uint1
);


CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_div_int2
);

CREATE OPERATOR / (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_div_int4
);

CREATE OPERATOR / (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_div_int8
);

CREATE OPERATOR / (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_div_uint1
);


CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=int2,
    PROCEDURE=uint1_mod_int2
);

CREATE OPERATOR % (
    LEFTARG=int2,
    RIGHTARG=uint1,
    PROCEDURE=int2_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_mod_int4
);

CREATE OPERATOR % (
    LEFTARG=int4,
    RIGHTARG=uint1,
    PROCEDURE=int4_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=int8,
    PROCEDURE=uint1_mod_int8
);

CREATE OPERATOR % (
    LEFTARG=int8,
    RIGHTARG=uint1,
    PROCEDURE=int8_mod_uint1
);


CREATE OPERATOR # (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_xor,
    COMMUTATOR = #
);


CREATE OPERATOR & (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_and,
    COMMUTATOR = &
);


CREATE OPERATOR | (
    LEFTARG=uint1,
    RIGHTARG=uint1,
    PROCEDURE=uint1_or,
    COMMUTATOR = |
);


CREATE OPERATOR ~ (
    RIGHTARG=uint1,
    PROCEDURE=uint1_not
);


CREATE OPERATOR << (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_shl
);


CREATE OPERATOR >> (
    LEFTARG=uint1,
    RIGHTARG=int4,
    PROCEDURE=uint1_shr
);



-- Index ops block

CREATE FUNCTION uint1_cmp(uint1, uint1) RETURNS int
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_cmp';

CREATE FUNCTION uint1_hash(uint1) RETURNS integer
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_hash';


CREATE OPERATOR CLASS uint1_ops
DEFAULT FOR TYPE uint1 USING btree FAMILY integer_ops AS
    OPERATOR 1 <,
    OPERATOR 2 <=,
    OPERATOR 3 =,
    OPERATOR 4 >=,
    OPERATOR 5 >,
    FUNCTION 1 uint1_cmp(uint1, uint1)
;

CREATE OPERATOR CLASS uint1_ops
DEFAULT FOR TYPE uint1 USING hash FAMILY integer_ops AS
    OPERATOR        1       = ,
    FUNCTION        1       uint1_hash(uint1);

-- pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'uint1'::regtype AS oid) typ

    JOIN pg_opclass ON pg_opclass.opcintype = typ.oid
    
    -- Ensure BTREE operator family
    JOIN pg_am ON pg_am.oid = pg_opclass.opcmethod AND pg_am.amname = 'btree'
),
operators AS (
    SELECT op.oid, 'pg_operator'::regclass::oid AS refclassid
    FROM typ
    JOIN pg_operator op ON 
        op.oprname IN ('<', '<=', '=', '>=', '>')
        AND op.oprleft = typ.typ_oid
        AND op.oprright = typ.typ_oid
),
fn AS (
    SELECT
        'uint1_cmp(uint1, uint1)'::regprocedure::oid AS oid,
        'pg_proc'::regclass::oid AS refclassid
),
deps AS (
    SELECT * FROM operators
    UNION ALL
    SELECT * FROM fn
)
INSERT INTO pg_depend (classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype)
SELECT DISTINCT ON (typ.opc_oid, deps.oid)
    'pg_opclass'::regclass::oid AS classid,
    typ.opc_oid AS objid,
    0 AS objsubid,
    deps.refclassid,
    deps.oid AS refobjid,
    0 AS refobjsubid,
    'n' AS deptype

FROM typ, deps

WHERE NOT EXISTS (
	SELECT 1
	FROM pg_depend
	WHERE 
		pg_depend.classid = 'pg_opclass'::regclass::oid
		AND pg_depend.objid = typ.opc_oid
		AND pg_depend.refclassid = deps.refclassid
		AND pg_depend.refobjid = deps.oid
)

ORDER BY typ.opc_oid, deps.oid;

-- HASH OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'uint1'::regtype AS oid) typ

    JOIN pg_opclass ON pg_opclass.opcintype = typ.oid
    
    -- Ensure BTREE operator family
    JOIN pg_am ON pg_am.oid = pg_opclass.opcmethod AND pg_am.amname = 'hash'
),
operators AS (
    SELECT op.oid, 'pg_operator'::regclass::oid AS refclassid
    FROM typ
    JOIN pg_operator op ON
        op.oprname = '='
        AND op.oprleft = typ.typ_oid
        AND op.oprright = typ.typ_oid
),
fn AS (
    SELECT
        'uint1_hash(uint1)'::regprocedure::oid AS oid,
        'pg_proc'::regclass::oid AS refclassid
),
deps AS (
    SELECT * FROM operators
    UNION ALL
    SELECT * FROM fn
)
INSERT INTO pg_depend (classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype)
SELECT DISTINCT ON (typ.opc_oid, deps.oid)
    'pg_opclass'::regclass::oid AS classid,
    typ.opc_oid AS objid,
    0 AS objsubid,
    deps.refclassid,
    deps.oid AS refobjid,
    0 AS refobjsubid,
    'n' AS deptype

FROM typ, deps

WHERE NOT EXISTS (
	SELECT 1
	FROM pg_depend
	WHERE 
		pg_depend.classid = 'pg_opclass'::regclass::oid 
		AND pg_depend.objid = typ.opc_oid
		AND pg_depend.refclassid = deps.refclassid
		AND pg_depend.refobjid = deps.oid
)

ORDER BY typ.opc_oid, deps.oid;
-- Agg ops block

-- Transition function for accumulating uint1
CREATE FUNCTION uint1_avg_accum(internal, uint1)
RETURNS internal
AS '$libdir/uint128', 'uint1_avg_accum'
LANGUAGE C IMMUTABLE PARALLEL SAFE;

-- Inverse transition function for accumulating uint1
CREATE FUNCTION uint1_avg_accum_inv(internal, uint1)
RETURNS internal
AS '$libdir/uint128', 'uint1_avg_accum_inv'
LANGUAGE C IMMUTABLE PARALLEL SAFE;

CREATE AGGREGATE sum(uint1) (
    -- Transition function
    SFUNC = uint1_avg_accum,
    -- Internal state type
    STYPE = internal,
    -- Internal state size
    SSPACE = 128,
    -- Final function to return the sum
    FINALFUNC = numeric_sum,
    -- Combine function for parallel aggregation
    COMBINEFUNC = numeric_avg_combine,
    -- Moving transition function
    MSFUNC = uint1_avg_accum,
    -- Moving state type (same as STYPE)
    MSTYPE = internal,
    -- Moving inverse transition function
    MINVFUNC = uint1_avg_accum_inv,
    -- Moving final function for windows
    MFINALFUNC = numeric_sum,
    -- Serialize function
    SERIALFUNC = numeric_avg_serialize,
    -- Deserialize function
    DESERIALFUNC = numeric_avg_deserialize,
    -- Aggregate is parallel safe
    PARALLEL = SAFE
);

CREATE AGGREGATE avg(uint1) (
    -- Transition function
    SFUNC = uint1_avg_accum,
    -- Internal state type
    STYPE = internal,
    -- Internal state size
    SSPACE = 128,
    -- Final function to return the sum
    FINALFUNC = numeric_avg,
    -- Combine function for parallel aggregation
    COMBINEFUNC = numeric_avg_combine,
    -- Moving transition function
    MSFUNC = uint1_avg_accum,
    -- Moving state type (same as STYPE)
    MSTYPE = internal,
    -- Moving inverse transition function
    MINVFUNC = uint1_avg_accum_inv,
    -- Moving final function for windows
    MFINALFUNC = numeric_avg,
    -- Serialize function
    SERIALFUNC = numeric_avg_serialize,
    -- Deserialize function
    DESERIALFUNC = numeric_avg_deserialize,
    -- Aggregate is parallel safe
    PARALLEL = SAFE
);

CREATE FUNCTION uint1_smaller(uint1, uint1)
RETURNS uint1
AS '$libdir/uint128', 'uint1_smaller'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE AGGREGATE min(uint1) (
    -- Transition function
    SFUNC = uint1_smaller,         
	STYPE = uint1,
	COMBINEFUNC = uint1_smaller,
    SORTOP = <,
    PARALLEL = SAFE
);

CREATE FUNCTION uint1_larger(uint1, uint1)
RETURNS uint1
AS '$libdir/uint128', 'uint1_larger'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE AGGREGATE max(uint1) (
    -- Transition function
    SFUNC = uint1_larger,         
	STYPE = uint1,
	COMBINEFUNC = uint1_larger,
    SORTOP = >,
    PARALLEL = SAFE
);


-- Generate series block

CREATE FUNCTION generate_series_uint1_support(internal)
RETURNS internal
AS '$libdir/uint128', 'generate_series_uint1_support'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE FUNCTION generate_series(uint1, uint1)
RETURNS SETOF uint1
AS '$libdir/uint128', 'generate_series_uint1'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_uint1_support;

CREATE FUNCTION generate_series(uint1, uint1, uint1)
RETURNS SETOF uint1
AS '$libdir/uint128', 'generate_series_step_uint1'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_uint1_support;

-- Ranges block

CREATE TYPE uint1range;

CREATE OR REPLACE FUNCTION uint1_range_canonical(uint1range)
RETURNS uint1range
AS '$libdir/uint128', 'uint1_range_canonical'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE OR REPLACE FUNCTION uint1_range_subdiff(uint1, uint1)
RETURNS double precision
AS '$libdir/uint128', 'uint1_range_subdiff'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE TYPE uint1range AS RANGE (
    SUBTYPE = uint1,
    SUBTYPE_OPCLASS = uint1_ops,
    CANONICAL = uint1_range_canonical,
    SUBTYPE_DIFF = uint1_range_subdiff
);


-- Type int1 block

CREATE FUNCTION int1_in(cstring) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_in';

CREATE FUNCTION int1_out(int1) RETURNS cstring
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_out';

CREATE FUNCTION int1_recv(internal) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_recv';

CREATE FUNCTION int1_send(int1) RETURNS bytea
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_send';

CREATE TYPE int1 (
    INPUT = int1_in,
    OUTPUT = int1_out,
    RECEIVE = int1_recv,
    SEND = int1_send,
    INTERNALLENGTH = 1,
    PASSEDBYVALUE,
    ALIGNMENT = char
);


-- In-out casts block

CREATE CAST (double precision AS int1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (int1 AS double precision) WITH INOUT AS IMPLICIT;

CREATE CAST (numeric AS int1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (int1 AS numeric) WITH INOUT AS IMPLICIT;

CREATE CAST (real AS int1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (int1 AS real) WITH INOUT AS IMPLICIT;


-- Casts block

CREATE FUNCTION int1_from_int2(int2) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int2';

CREATE FUNCTION int1_to_int2(int1) RETURNS int2
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_int2';

CREATE CAST (int2 AS int1) WITH FUNCTION int1_from_int2(int2) AS IMPLICIT;
CREATE CAST (int1 AS int2) WITH FUNCTION int1_to_int2(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_int4(int4) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int4';

CREATE FUNCTION int1_to_int4(int1) RETURNS int4
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_int4';

CREATE CAST (int4 AS int1) WITH FUNCTION int1_from_int4(int4) AS IMPLICIT;
CREATE CAST (int1 AS int4) WITH FUNCTION int1_to_int4(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_int8(int8) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int8';

CREATE FUNCTION int1_to_int8(int1) RETURNS int8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_int8';

CREATE CAST (int8 AS int1) WITH FUNCTION int1_from_int8(int8) AS IMPLICIT;
CREATE CAST (int1 AS int8) WITH FUNCTION int1_to_int8(int1) AS IMPLICIT;

-- Ops block

CREATE FUNCTION int1_eq_int1(int1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_int1';

CREATE FUNCTION int1_eq_int2(int1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_int2';

CREATE FUNCTION int2_eq_int1(int2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_eq_int1';

CREATE FUNCTION int1_eq_int4(int1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_int4';

CREATE FUNCTION int4_eq_int1(int4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_eq_int1';

CREATE FUNCTION int1_eq_int8(int1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_int8';

CREATE FUNCTION int8_eq_int1(int8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_eq_int1';


CREATE FUNCTION int1_ne_int1(int1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_int1';

CREATE FUNCTION int1_ne_int2(int1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_int2';

CREATE FUNCTION int2_ne_int1(int2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_ne_int1';

CREATE FUNCTION int1_ne_int4(int1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_int4';

CREATE FUNCTION int4_ne_int1(int4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_ne_int1';

CREATE FUNCTION int1_ne_int8(int1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_int8';

CREATE FUNCTION int8_ne_int1(int8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_ne_int1';


CREATE FUNCTION int1_gt_int1(int1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_int1';

CREATE FUNCTION int1_gt_int2(int1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_int2';

CREATE FUNCTION int2_gt_int1(int2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_gt_int1';

CREATE FUNCTION int1_gt_int4(int1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_int4';

CREATE FUNCTION int4_gt_int1(int4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_gt_int1';

CREATE FUNCTION int1_gt_int8(int1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_int8';

CREATE FUNCTION int8_gt_int1(int8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_gt_int1';


CREATE FUNCTION int1_lt_int1(int1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_int1';

CREATE FUNCTION int1_lt_int2(int1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_int2';

CREATE FUNCTION int2_lt_int1(int2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_lt_int1';

CREATE FUNCTION int1_lt_int4(int1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_int4';

CREATE FUNCTION int4_lt_int1(int4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_lt_int1';

CREATE FUNCTION int1_lt_int8(int1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_int8';

CREATE FUNCTION int8_lt_int1(int8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_lt_int1';


CREATE FUNCTION int1_ge_int1(int1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_int1';

CREATE FUNCTION int1_ge_int2(int1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_int2';

CREATE FUNCTION int2_ge_int1(int2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_ge_int1';

CREATE FUNCTION int1_ge_int4(int1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_int4';

CREATE FUNCTION int4_ge_int1(int4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_ge_int1';

CREATE FUNCTION int1_ge_int8(int1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_int8';

CREATE FUNCTION int8_ge_int1(int8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_ge_int1';


CREATE FUNCTION int1_le_int1(int1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_int1';

CREATE FUNCTION int1_le_int2(int1, int2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_int2';

CREATE FUNCTION int2_le_int1(int2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int2_le_int1';

CREATE FUNCTION int1_le_int4(int1, int4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_int4';

CREATE FUNCTION int4_le_int1(int4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int4_le_int1';

CREATE FUNCTION int1_le_int8(int1, int8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_int8';

CREATE FUNCTION int8_le_int1(int8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int8_le_int1';


CREATE FUNCTION int1_add_int1(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_int1';

CREATE FUNCTION int1_add_int2(int1, int2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_int2';

CREATE FUNCTION int2_add_int1(int2, int1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_add_int1';

CREATE FUNCTION int1_add_int4(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_int4';

CREATE FUNCTION int4_add_int1(int4, int1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_add_int1';

CREATE FUNCTION int1_add_int8(int1, int8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_int8';

CREATE FUNCTION int8_add_int1(int8, int1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_add_int1';


CREATE FUNCTION int1_sub_int1(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_int1';

CREATE FUNCTION int1_sub_int2(int1, int2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_int2';

CREATE FUNCTION int2_sub_int1(int2, int1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_sub_int1';

CREATE FUNCTION int1_sub_int4(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_int4';

CREATE FUNCTION int4_sub_int1(int4, int1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_sub_int1';

CREATE FUNCTION int1_sub_int8(int1, int8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_int8';

CREATE FUNCTION int8_sub_int1(int8, int1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_sub_int1';


CREATE FUNCTION int1_mul_int1(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_int1';

CREATE FUNCTION int1_mul_int2(int1, int2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_int2';

CREATE FUNCTION int2_mul_int1(int2, int1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_mul_int1';

CREATE FUNCTION int1_mul_int4(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_int4';

CREATE FUNCTION int4_mul_int1(int4, int1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_mul_int1';

CREATE FUNCTION int1_mul_int8(int1, int8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_int8';

CREATE FUNCTION int8_mul_int1(int8, int1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_mul_int1';


CREATE FUNCTION int1_div_int1(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_int1';

CREATE FUNCTION int1_div_int2(int1, int2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_int2';

CREATE FUNCTION int2_div_int1(int2, int1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_div_int1';

CREATE FUNCTION int1_div_int4(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_int4';

CREATE FUNCTION int4_div_int1(int4, int1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_div_int1';

CREATE FUNCTION int1_div_int8(int1, int8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_int8';

CREATE FUNCTION int8_div_int1(int8, int1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_div_int1';


CREATE FUNCTION int1_mod_int1(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_int1';

CREATE FUNCTION int1_mod_int2(int1, int2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_int2';

CREATE FUNCTION int2_mod_int1(int2, int1) RETURNS int2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int2_mod_int1';

CREATE FUNCTION int1_mod_int4(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_int4';

CREATE FUNCTION int4_mod_int1(int4, int1) RETURNS int4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int4_mod_int1';

CREATE FUNCTION int1_mod_int8(int1, int8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_int8';

CREATE FUNCTION int8_mod_int1(int8, int1) RETURNS int8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int8_mod_int1';


CREATE FUNCTION int1_xor(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_xor';


CREATE FUNCTION int1_and(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_and';


CREATE FUNCTION int1_or(int1, int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_or';


CREATE FUNCTION int1_not(int1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_not';

CREATE FUNCTION int1_shl(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_shl';


CREATE FUNCTION int1_shr(int1, int4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_shr';


CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_eq_int2,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_eq_int4,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_eq_int8,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_ne_int2,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_ne_int4,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_ne_int8,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_gt_int2,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_gt_int4,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_gt_int8,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_lt_int2,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_lt_int4,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_lt_int8,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_ge_int2,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_ge_int4,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_ge_int8,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_le_int2,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_le_int4,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_le_int8,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_add_int1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_add_int2,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_add_int1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_add_int4,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_add_int1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_add_int8,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_add_int1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_sub_int1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_sub_int2,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_sub_int1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_sub_int4,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_sub_int1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_sub_int8,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_sub_int1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_mul_int1
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_mul_int2
);

CREATE OPERATOR * (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_mul_int1
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_mul_int4
);

CREATE OPERATOR * (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_mul_int1
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_mul_int8
);

CREATE OPERATOR * (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_mul_int1
);


CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_div_int1
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_div_int2
);

CREATE OPERATOR / (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_div_int1
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_div_int4
);

CREATE OPERATOR / (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_div_int1
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_div_int8
);

CREATE OPERATOR / (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_div_int1
);


CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_mod_int1
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=int2,
    PROCEDURE=int1_mod_int2
);

CREATE OPERATOR % (
    LEFTARG=int2,
    RIGHTARG=int1,
    PROCEDURE=int2_mod_int1
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_mod_int4
);

CREATE OPERATOR % (
    LEFTARG=int4,
    RIGHTARG=int1,
    PROCEDURE=int4_mod_int1
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=int8,
    PROCEDURE=int1_mod_int8
);

CREATE OPERATOR % (
    LEFTARG=int8,
    RIGHTARG=int1,
    PROCEDURE=int8_mod_int1
);


CREATE OPERATOR # (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_xor,
    COMMUTATOR = #
);


CREATE OPERATOR & (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_and,
    COMMUTATOR = &
);


CREATE OPERATOR | (
    LEFTARG=int1,
    RIGHTARG=int1,
    PROCEDURE=int1_or,
    COMMUTATOR = |
);


CREATE OPERATOR ~ (
    RIGHTARG=int1,
    PROCEDURE=int1_not
);


CREATE OPERATOR << (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_shl
);


CREATE OPERATOR >> (
    LEFTARG=int1,
    RIGHTARG=int4,
    PROCEDURE=int1_shr
);



-- Index ops block

CREATE FUNCTION int1_cmp(int1, int1) RETURNS int
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_cmp';

CREATE FUNCTION int1_hash(int1) RETURNS integer
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_hash';


CREATE OPERATOR CLASS int1_ops
DEFAULT FOR TYPE int1 USING btree FAMILY integer_ops AS
    OPERATOR 1 <,
    OPERATOR 2 <=,
    OPERATOR 3 =,
    OPERATOR 4 >=,
    OPERATOR 5 >,
    FUNCTION 1 int1_cmp(int1, int1)
;

CREATE OPERATOR CLASS int1_ops
DEFAULT FOR TYPE int1 USING hash FAMILY integer_ops AS
    OPERATOR        1       = ,
    FUNCTION        1       int1_hash(int1);

-- pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'int1'::regtype AS oid) typ

    JOIN pg_opclass ON pg_opclass.opcintype = typ.oid
    
    -- Ensure BTREE operator family
    JOIN pg_am ON pg_am.oid = pg_opclass.opcmethod AND pg_am.amname = 'btree'
),
operators AS (
    SELECT op.oid, 'pg_operator'::regclass::oid AS refclassid
    FROM typ
    JOIN pg_operator op ON 
        op.oprname IN ('<', '<=', '=', '>=', '>')
        AND op.oprleft = typ.typ_oid
        AND op.oprright = typ.typ_oid
),
fn AS (
    SELECT
        'int1_cmp(int1, int1)'::regprocedure::oid AS oid,
        'pg_proc'::regclass::oid AS refclassid
),
deps AS (
    SELECT * FROM operators
    UNION ALL
    SELECT * FROM fn
)
INSERT INTO pg_depend (classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype)
SELECT DISTINCT ON (typ.opc_oid, deps.oid)
    'pg_opclass'::regclass::oid AS classid,
    typ.opc_oid AS objid,
    0 AS objsubid,
    deps.refclassid,
    deps.oid AS refobjid,
    0 AS refobjsubid,
    'n' AS deptype

FROM typ, deps

WHERE NOT EXISTS (
	SELECT 1
	FROM pg_depend
	WHERE 
		pg_depend.classid = 'pg_opclass'::regclass::oid
		AND pg_depend.objid = typ.opc_oid
		AND pg_depend.refclassid = deps.refclassid
		AND pg_depend.refobjid = deps.oid
)

ORDER BY typ.opc_oid, deps.oid;

-- HASH OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'int1'::regtype AS oid) typ

    JOIN pg_opclass ON pg_opclass.opcintype = typ.oid
    
    -- Ensure BTREE operator family
    JOIN pg_am ON pg_am.oid = pg_opclass.opcmethod AND pg_am.amname = 'hash'
),
operators AS (
    SELECT op.oid, 'pg_operator'::regclass::oid AS refclassid
    FROM typ
    JOIN pg_operator op ON
        op.oprname = '='
        AND op.oprleft = typ.typ_oid
        AND op.oprright = typ.typ_oid
),
fn AS (
    SELECT
        'int1_hash(int1)'::regprocedure::oid AS oid,
        'pg_proc'::regclass::oid AS refclassid
),
deps AS (
    SELECT * FROM operators
    UNION ALL
    SELECT * FROM fn
)
INSERT INTO pg_depend (classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype)
SELECT DISTINCT ON (typ.opc_oid, deps.oid)
    'pg_opclass'::regclass::oid AS classid,
    typ.opc_oid AS objid,
    0 AS objsubid,
    deps.refclassid,
    deps.oid AS refobjid,
    0 AS refobjsubid,
    'n' AS deptype

FROM typ, deps

WHERE NOT EXISTS (
	SELECT 1
	FROM pg_depend
	WHERE 
		pg_depend.classid = 'pg_opclass'::regclass::oid 
		AND pg_depend.objid = typ.opc_oid
		AND pg_depend.refclassid = deps.refclassid
		AND pg_depend.refobjid = deps.oid
)

ORDER BY typ.opc_oid, deps.oid;
-- Agg ops block

-- Transition function for accumulating int1
CREATE FUNCTION int1_avg_accum(internal, int1)
RETURNS internal
AS '$libdir/uint128', 'int1_avg_accum'
LANGUAGE C IMMUTABLE PARALLEL SAFE;

-- Inverse transition function for accumulating int1
CREATE FUNCTION int1_avg_accum_inv(internal, int1)
RETURNS internal
AS '$libdir/uint128', 'int1_avg_accum_inv'
LANGUAGE C IMMUTABLE PARALLEL SAFE;

CREATE AGGREGATE sum(int1) (
    -- Transition function
    SFUNC = int1_avg_accum,
    -- Internal state type
    STYPE = internal,
    -- Internal state size
    SSPACE = 128,
    -- Final function to return the sum
    FINALFUNC = numeric_sum,
    -- Combine function for parallel aggregation
    COMBINEFUNC = numeric_avg_combine,
    -- Moving transition function
    MSFUNC = int1_avg_accum,
    -- Moving state type (same as STYPE)
    MSTYPE = internal,
    -- Moving inverse transition function
    MINVFUNC = int1_avg_accum_inv,
    -- Moving final function for windows
    MFINALFUNC = numeric_sum,
    -- Serialize function
    SERIALFUNC = numeric_avg_serialize,
    -- Deserialize function
    DESERIALFUNC = numeric_avg_deserialize,
    -- Aggregate is parallel safe
    PARALLEL = SAFE
);

CREATE AGGREGATE avg(int1) (
    -- Transition function
    SFUNC = int1_avg_accum,
    -- Internal state type
    STYPE = internal,
    -- Internal state size
    SSPACE = 128,
    -- Final function to return the sum
    FINALFUNC = numeric_avg,
    -- Combine function for parallel aggregation
    COMBINEFUNC = numeric_avg_combine,
    -- Moving transition function
    MSFUNC = int1_avg_accum,
    -- Moving state type (same as STYPE)
    MSTYPE = internal,
    -- Moving inverse transition function
    MINVFUNC = int1_avg_accum_inv,
    -- Moving final function for windows
    MFINALFUNC = numeric_avg,
    -- Serialize function
    SERIALFUNC = numeric_avg_serialize,
    -- Deserialize function
    DESERIALFUNC = numeric_avg_deserialize,
    -- Aggregate is parallel safe
    PARALLEL = SAFE
);

CREATE FUNCTION int1_smaller(int1, int1)
RETURNS int1
AS '$libdir/uint128', 'int1_smaller'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE AGGREGATE min(int1) (
    -- Transition function
    SFUNC = int1_smaller,         
	STYPE = int1,
	COMBINEFUNC = int1_smaller,
    SORTOP = <,
    PARALLEL = SAFE
);

CREATE FUNCTION int1_larger(int1, int1)
RETURNS int1
AS '$libdir/uint128', 'int1_larger'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE AGGREGATE max(int1) (
    -- Transition function
    SFUNC = int1_larger,         
	STYPE = int1,
	COMBINEFUNC = int1_larger,
    SORTOP = >,
    PARALLEL = SAFE
);


-- Generate series block

CREATE FUNCTION generate_series_int1_support(internal)
RETURNS internal
AS '$libdir/uint128', 'generate_series_int1_support'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE FUNCTION generate_series(int1, int1)
RETURNS SETOF int1
AS '$libdir/uint128', 'generate_series_int1'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_int1_support;

CREATE FUNCTION generate_series(int1, int1, int1)
RETURNS SETOF int1
AS '$libdir/uint128', 'generate_series_step_int1'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_int1_support;

-- Ranges block

CREATE TYPE int1range;

CREATE OR REPLACE FUNCTION int1_range_canonical(int1range)
RETURNS int1range
AS '$libdir/uint128', 'int1_range_canonical'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE OR REPLACE FUNCTION int1_range_subdiff(int1, int1)
RETURNS double precision
AS '$libdir/uint128', 'int1_range_subdiff'
LANGUAGE C IMMUTABLE PARALLEL SAFE STRICT;

CREATE TYPE int1range AS RANGE (
    SUBTYPE = int1,
    SUBTYPE_OPCLASS = int1_ops,
    CANONICAL = int1_range_canonical,
    SUBTYPE_DIFF = int1_range_subdiff
);




-- Cross types ops
-- Type uint1 block


-- Casts block

CREATE FUNCTION uint1_from_uint2(uint2) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint2';

CREATE FUNCTION uint1_to_uint2(uint1) RETURNS uint2
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_uint2';

CREATE CAST (uint2 AS uint1) WITH FUNCTION uint1_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (uint1 AS uint2) WITH FUNCTION uint1_to_uint2(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_uint4(uint4) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint4';

CREATE FUNCTION uint1_to_uint4(uint1) RETURNS uint4
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_uint4';

CREATE CAST (uint4 AS uint1) WITH FUNCTION uint1_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (uint1 AS uint4) WITH FUNCTION uint1_to_uint4(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_uint8(uint8) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint8';

CREATE FUNCTION uint1_to_uint8(uint1) RETURNS uint8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_uint8';

CREATE CAST (uint8 AS uint1) WITH FUNCTION uint1_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (uint1 AS uint8) WITH FUNCTION uint1_to_uint8(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_uint16(uint16) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_uint16';

CREATE FUNCTION uint1_to_uint16(uint1) RETURNS uint16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_uint16';

CREATE CAST (uint16 AS uint1) WITH FUNCTION uint1_from_uint16(uint16) AS IMPLICIT;
CREATE CAST (uint1 AS uint16) WITH FUNCTION uint1_to_uint16(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_int1(int1) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int1';

CREATE FUNCTION uint1_to_int1(uint1) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_int1';

CREATE CAST (int1 AS uint1) WITH FUNCTION uint1_from_int1(int1) AS IMPLICIT;
CREATE CAST (uint1 AS int1) WITH FUNCTION uint1_to_int1(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_int16(int16) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_int16';

CREATE FUNCTION uint1_to_int16(uint1) RETURNS int16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_int16';

CREATE CAST (int16 AS uint1) WITH FUNCTION uint1_from_int16(int16) AS IMPLICIT;
CREATE CAST (uint1 AS int16) WITH FUNCTION uint1_to_int16(uint1) AS IMPLICIT;

-- Ops block

CREATE FUNCTION uint1_eq_uint2(uint1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_uint2';

CREATE FUNCTION uint1_eq_uint4(uint1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_uint4';

CREATE FUNCTION uint1_eq_uint8(uint1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_uint8';

CREATE FUNCTION uint1_eq_uint16(uint1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_uint16';

CREATE FUNCTION uint1_eq_int1(uint1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_int1';

CREATE FUNCTION uint1_eq_int16(uint1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_eq_int16';


CREATE FUNCTION uint1_ne_uint2(uint1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_uint2';

CREATE FUNCTION uint1_ne_uint4(uint1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_uint4';

CREATE FUNCTION uint1_ne_uint8(uint1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_uint8';

CREATE FUNCTION uint1_ne_uint16(uint1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_uint16';

CREATE FUNCTION uint1_ne_int1(uint1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_int1';

CREATE FUNCTION uint1_ne_int16(uint1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ne_int16';


CREATE FUNCTION uint1_gt_uint2(uint1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_uint2';

CREATE FUNCTION uint1_gt_uint4(uint1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_uint4';

CREATE FUNCTION uint1_gt_uint8(uint1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_uint8';

CREATE FUNCTION uint1_gt_uint16(uint1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_uint16';

CREATE FUNCTION uint1_gt_int1(uint1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_int1';

CREATE FUNCTION uint1_gt_int16(uint1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_gt_int16';


CREATE FUNCTION uint1_lt_uint2(uint1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_uint2';

CREATE FUNCTION uint1_lt_uint4(uint1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_uint4';

CREATE FUNCTION uint1_lt_uint8(uint1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_uint8';

CREATE FUNCTION uint1_lt_uint16(uint1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_uint16';

CREATE FUNCTION uint1_lt_int1(uint1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_int1';

CREATE FUNCTION uint1_lt_int16(uint1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_lt_int16';


CREATE FUNCTION uint1_ge_uint2(uint1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_uint2';

CREATE FUNCTION uint1_ge_uint4(uint1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_uint4';

CREATE FUNCTION uint1_ge_uint8(uint1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_uint8';

CREATE FUNCTION uint1_ge_uint16(uint1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_uint16';

CREATE FUNCTION uint1_ge_int1(uint1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_int1';

CREATE FUNCTION uint1_ge_int16(uint1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_ge_int16';


CREATE FUNCTION uint1_le_uint2(uint1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_uint2';

CREATE FUNCTION uint1_le_uint4(uint1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_uint4';

CREATE FUNCTION uint1_le_uint8(uint1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_uint8';

CREATE FUNCTION uint1_le_uint16(uint1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_uint16';

CREATE FUNCTION uint1_le_int1(uint1, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_int1';

CREATE FUNCTION uint1_le_int16(uint1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_le_int16';


CREATE FUNCTION uint1_add_uint2(uint1, uint2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_uint2';

CREATE FUNCTION uint1_add_uint4(uint1, uint4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_uint4';

CREATE FUNCTION uint1_add_uint8(uint1, uint8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_uint8';

CREATE FUNCTION uint1_add_uint16(uint1, uint16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_uint16';

CREATE FUNCTION uint1_add_int1(uint1, int1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_int1';

CREATE FUNCTION uint1_add_int16(uint1, int16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_add_int16';


CREATE FUNCTION uint1_sub_uint2(uint1, uint2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_uint2';

CREATE FUNCTION uint1_sub_uint4(uint1, uint4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_uint4';

CREATE FUNCTION uint1_sub_uint8(uint1, uint8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_uint8';

CREATE FUNCTION uint1_sub_uint16(uint1, uint16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_uint16';

CREATE FUNCTION uint1_sub_int1(uint1, int1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_int1';

CREATE FUNCTION uint1_sub_int16(uint1, int16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_sub_int16';


CREATE FUNCTION uint1_mul_uint2(uint1, uint2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_uint2';

CREATE FUNCTION uint1_mul_uint4(uint1, uint4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_uint4';

CREATE FUNCTION uint1_mul_uint8(uint1, uint8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_uint8';

CREATE FUNCTION uint1_mul_uint16(uint1, uint16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_uint16';

CREATE FUNCTION uint1_mul_int1(uint1, int1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_int1';

CREATE FUNCTION uint1_mul_int16(uint1, int16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mul_int16';


CREATE FUNCTION uint1_div_uint2(uint1, uint2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_uint2';

CREATE FUNCTION uint1_div_uint4(uint1, uint4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_uint4';

CREATE FUNCTION uint1_div_uint8(uint1, uint8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_uint8';

CREATE FUNCTION uint1_div_uint16(uint1, uint16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_uint16';

CREATE FUNCTION uint1_div_int1(uint1, int1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_int1';

CREATE FUNCTION uint1_div_int16(uint1, int16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_div_int16';


CREATE FUNCTION uint1_mod_uint2(uint1, uint2) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_uint2';

CREATE FUNCTION uint1_mod_uint4(uint1, uint4) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_uint4';

CREATE FUNCTION uint1_mod_uint8(uint1, uint8) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_uint8';

CREATE FUNCTION uint1_mod_uint16(uint1, uint16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_uint16';

CREATE FUNCTION uint1_mod_int1(uint1, int1) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_int1';

CREATE FUNCTION uint1_mod_int16(uint1, int16) RETURNS uint1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_mod_int16';


CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_eq_uint2,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_eq_uint4,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_eq_uint8,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_eq_uint16,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_eq_int16,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_ne_uint2,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_ne_uint4,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_ne_uint8,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_ne_uint16,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_ne_int16,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_gt_uint2,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_gt_uint4,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_gt_uint8,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_gt_uint16,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_gt_int16,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_lt_uint2,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_lt_uint4,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_lt_uint8,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_lt_uint16,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_lt_int16,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_ge_uint2,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_ge_uint4,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_ge_uint8,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_ge_uint16,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_ge_int16,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_le_uint2,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_le_uint4,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_le_uint8,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_le_uint16,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_le_int16,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_add_uint2,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_add_uint4,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_add_uint8,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_add_uint16,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_add_int1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_add_int16,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_sub_uint2,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_sub_uint4,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_sub_uint8,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_sub_uint16,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_sub_int1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_sub_int16,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_mul_uint2
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_mul_uint4
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_mul_uint8
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_mul_uint16
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_mul_int1
);

CREATE OPERATOR * (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_mul_int16
);


CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_div_uint2
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_div_uint4
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_div_uint8
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_div_uint16
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_div_int1
);

CREATE OPERATOR / (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_div_int16
);


CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=uint2,
    PROCEDURE=uint1_mod_uint2
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=uint4,
    PROCEDURE=uint1_mod_uint4
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=uint8,
    PROCEDURE=uint1_mod_uint8
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=uint16,
    PROCEDURE=uint1_mod_uint16
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=int1,
    PROCEDURE=uint1_mod_int1
);

CREATE OPERATOR % (
    LEFTARG=uint1,
    RIGHTARG=int16,
    PROCEDURE=uint1_mod_int16
);





-- Type int1 block


-- Casts block

CREATE FUNCTION int1_from_int16(int16) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_int16';

CREATE FUNCTION int1_to_int16(int1) RETURNS int16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_int16';

CREATE CAST (int16 AS int1) WITH FUNCTION int1_from_int16(int16) AS IMPLICIT;
CREATE CAST (int1 AS int16) WITH FUNCTION int1_to_int16(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_uint2(uint2) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint2';

CREATE FUNCTION int1_to_uint2(int1) RETURNS uint2
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_uint2';

CREATE CAST (uint2 AS int1) WITH FUNCTION int1_from_uint2(uint2) AS IMPLICIT;
CREATE CAST (int1 AS uint2) WITH FUNCTION int1_to_uint2(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_uint4(uint4) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint4';

CREATE FUNCTION int1_to_uint4(int1) RETURNS uint4
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_uint4';

CREATE CAST (uint4 AS int1) WITH FUNCTION int1_from_uint4(uint4) AS IMPLICIT;
CREATE CAST (int1 AS uint4) WITH FUNCTION int1_to_uint4(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_uint8(uint8) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint8';

CREATE FUNCTION int1_to_uint8(int1) RETURNS uint8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_uint8';

CREATE CAST (uint8 AS int1) WITH FUNCTION int1_from_uint8(uint8) AS IMPLICIT;
CREATE CAST (int1 AS uint8) WITH FUNCTION int1_to_uint8(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_uint16(uint16) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_uint16';

CREATE FUNCTION int1_to_uint16(int1) RETURNS uint16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_uint16';

CREATE CAST (uint16 AS int1) WITH FUNCTION int1_from_uint16(uint16) AS IMPLICIT;
CREATE CAST (int1 AS uint16) WITH FUNCTION int1_to_uint16(int1) AS IMPLICIT;

-- Ops block

CREATE FUNCTION int1_eq_int16(int1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_int16';

CREATE FUNCTION int1_eq_uint1(int1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_uint1';

CREATE FUNCTION int1_eq_uint2(int1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_uint2';

CREATE FUNCTION int1_eq_uint4(int1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_uint4';

CREATE FUNCTION int1_eq_uint8(int1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_uint8';

CREATE FUNCTION int1_eq_uint16(int1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_eq_uint16';


CREATE FUNCTION int1_ne_int16(int1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_int16';

CREATE FUNCTION int1_ne_uint1(int1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_uint1';

CREATE FUNCTION int1_ne_uint2(int1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_uint2';

CREATE FUNCTION int1_ne_uint4(int1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_uint4';

CREATE FUNCTION int1_ne_uint8(int1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_uint8';

CREATE FUNCTION int1_ne_uint16(int1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ne_uint16';


CREATE FUNCTION int1_gt_int16(int1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_int16';

CREATE FUNCTION int1_gt_uint1(int1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_uint1';

CREATE FUNCTION int1_gt_uint2(int1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_uint2';

CREATE FUNCTION int1_gt_uint4(int1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_uint4';

CREATE FUNCTION int1_gt_uint8(int1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_uint8';

CREATE FUNCTION int1_gt_uint16(int1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_gt_uint16';


CREATE FUNCTION int1_lt_int16(int1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_int16';

CREATE FUNCTION int1_lt_uint1(int1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_uint1';

CREATE FUNCTION int1_lt_uint2(int1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_uint2';

CREATE FUNCTION int1_lt_uint4(int1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_uint4';

CREATE FUNCTION int1_lt_uint8(int1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_uint8';

CREATE FUNCTION int1_lt_uint16(int1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_lt_uint16';


CREATE FUNCTION int1_ge_int16(int1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_int16';

CREATE FUNCTION int1_ge_uint1(int1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_uint1';

CREATE FUNCTION int1_ge_uint2(int1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_uint2';

CREATE FUNCTION int1_ge_uint4(int1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_uint4';

CREATE FUNCTION int1_ge_uint8(int1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_uint8';

CREATE FUNCTION int1_ge_uint16(int1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_ge_uint16';


CREATE FUNCTION int1_le_int16(int1, int16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_int16';

CREATE FUNCTION int1_le_uint1(int1, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_uint1';

CREATE FUNCTION int1_le_uint2(int1, uint2) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_uint2';

CREATE FUNCTION int1_le_uint4(int1, uint4) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_uint4';

CREATE FUNCTION int1_le_uint8(int1, uint8) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_uint8';

CREATE FUNCTION int1_le_uint16(int1, uint16) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int1_le_uint16';


CREATE FUNCTION int1_add_int16(int1, int16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_int16';

CREATE FUNCTION int1_add_uint1(int1, uint1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_uint1';

CREATE FUNCTION int1_add_uint2(int1, uint2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_uint2';

CREATE FUNCTION int1_add_uint4(int1, uint4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_uint4';

CREATE FUNCTION int1_add_uint8(int1, uint8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_uint8';

CREATE FUNCTION int1_add_uint16(int1, uint16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_add_uint16';


CREATE FUNCTION int1_sub_int16(int1, int16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_int16';

CREATE FUNCTION int1_sub_uint1(int1, uint1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_uint1';

CREATE FUNCTION int1_sub_uint2(int1, uint2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_uint2';

CREATE FUNCTION int1_sub_uint4(int1, uint4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_uint4';

CREATE FUNCTION int1_sub_uint8(int1, uint8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_uint8';

CREATE FUNCTION int1_sub_uint16(int1, uint16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_sub_uint16';


CREATE FUNCTION int1_mul_int16(int1, int16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_int16';

CREATE FUNCTION int1_mul_uint1(int1, uint1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_uint1';

CREATE FUNCTION int1_mul_uint2(int1, uint2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_uint2';

CREATE FUNCTION int1_mul_uint4(int1, uint4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_uint4';

CREATE FUNCTION int1_mul_uint8(int1, uint8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_uint8';

CREATE FUNCTION int1_mul_uint16(int1, uint16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mul_uint16';


CREATE FUNCTION int1_div_int16(int1, int16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_int16';

CREATE FUNCTION int1_div_uint1(int1, uint1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_uint1';

CREATE FUNCTION int1_div_uint2(int1, uint2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_uint2';

CREATE FUNCTION int1_div_uint4(int1, uint4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_uint4';

CREATE FUNCTION int1_div_uint8(int1, uint8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_uint8';

CREATE FUNCTION int1_div_uint16(int1, uint16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_div_uint16';


CREATE FUNCTION int1_mod_int16(int1, int16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_int16';

CREATE FUNCTION int1_mod_uint1(int1, uint1) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_uint1';

CREATE FUNCTION int1_mod_uint2(int1, uint2) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_uint2';

CREATE FUNCTION int1_mod_uint4(int1, uint4) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_uint4';

CREATE FUNCTION int1_mod_uint8(int1, uint8) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_uint8';

CREATE FUNCTION int1_mod_uint16(int1, uint16) RETURNS int1
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_mod_uint16';


CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_eq_int16,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_eq_uint2,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_eq_uint4,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_eq_uint8,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_eq_uint16,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_ne_int16,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_ne_uint2,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_ne_uint4,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_ne_uint8,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_ne_uint16,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_gt_int16,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_gt_uint2,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_gt_uint4,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_gt_uint8,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_gt_uint16,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_lt_int16,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_lt_uint2,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_lt_uint4,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_lt_uint8,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_lt_uint16,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_ge_int16,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_ge_uint2,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_ge_uint4,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_ge_uint8,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_ge_uint16,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_le_int16,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_le_uint2,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_le_uint4,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_le_uint8,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_le_uint16,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_add_int16,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_add_uint2,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_add_uint4,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_add_uint8,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_add_uint16,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_sub_int16,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_sub_uint2,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_sub_uint4,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_sub_uint8,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_sub_uint16,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_mul_int16
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_mul_uint2
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_mul_uint4
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_mul_uint8
);

CREATE OPERATOR * (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_mul_uint16
);


CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_div_int16
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_div_uint2
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_div_uint4
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_div_uint8
);

CREATE OPERATOR / (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_div_uint16
);


CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=int16,
    PROCEDURE=int1_mod_int16
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=uint1,
    PROCEDURE=int1_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=uint2,
    PROCEDURE=int1_mod_uint2
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=uint4,
    PROCEDURE=int1_mod_uint4
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=uint8,
    PROCEDURE=int1_mod_uint8
);

CREATE OPERATOR % (
    LEFTARG=int1,
    RIGHTARG=uint16,
    PROCEDURE=int1_mod_uint16
);





-- Type uint16 block


-- Casts block
-- Ops block

CREATE FUNCTION uint16_eq_uint1(uint16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_eq_uint1';

CREATE FUNCTION uint16_eq_int1(uint16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_eq_int1';


CREATE FUNCTION uint16_ne_uint1(uint16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_ne_uint1';

CREATE FUNCTION uint16_ne_int1(uint16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_ne_int1';


CREATE FUNCTION uint16_gt_uint1(uint16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_gt_uint1';

CREATE FUNCTION uint16_gt_int1(uint16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_gt_int1';


CREATE FUNCTION uint16_lt_uint1(uint16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_lt_uint1';

CREATE FUNCTION uint16_lt_int1(uint16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_lt_int1';


CREATE FUNCTION uint16_ge_uint1(uint16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_ge_uint1';

CREATE FUNCTION uint16_ge_int1(uint16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_ge_int1';


CREATE FUNCTION uint16_le_uint1(uint16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_le_uint1';

CREATE FUNCTION uint16_le_int1(uint16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_le_int1';


CREATE FUNCTION uint16_add_uint1(uint16, uint1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_add_uint1';

CREATE FUNCTION uint16_add_int1(uint16, int1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_add_int1';


CREATE FUNCTION uint16_sub_uint1(uint16, uint1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_sub_uint1';

CREATE FUNCTION uint16_sub_int1(uint16, int1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_sub_int1';


CREATE FUNCTION uint16_mul_uint1(uint16, uint1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_mul_uint1';

CREATE FUNCTION uint16_mul_int1(uint16, int1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_mul_int1';


CREATE FUNCTION uint16_div_uint1(uint16, uint1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_div_uint1';

CREATE FUNCTION uint16_div_int1(uint16, int1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_div_int1';


CREATE FUNCTION uint16_mod_uint1(uint16, uint1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_mod_uint1';

CREATE FUNCTION uint16_mod_int1(uint16, int1) RETURNS uint16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_mod_int1';


CREATE OPERATOR = (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_add_int1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_sub_int1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_mul_int1
);


CREATE OPERATOR / (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_div_int1
);


CREATE OPERATOR % (
    LEFTARG=uint16,
    RIGHTARG=uint1,
    PROCEDURE=uint16_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint16,
    RIGHTARG=int1,
    PROCEDURE=uint16_mod_int1
);





-- Type uint8 block


-- Casts block
-- Ops block

CREATE FUNCTION uint8_eq_uint1(uint8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_eq_uint1';

CREATE FUNCTION uint8_eq_int1(uint8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_eq_int1';


CREATE FUNCTION uint8_ne_uint1(uint8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_ne_uint1';

CREATE FUNCTION uint8_ne_int1(uint8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_ne_int1';


CREATE FUNCTION uint8_gt_uint1(uint8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_gt_uint1';

CREATE FUNCTION uint8_gt_int1(uint8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_gt_int1';


CREATE FUNCTION uint8_lt_uint1(uint8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_lt_uint1';

CREATE FUNCTION uint8_lt_int1(uint8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_lt_int1';


CREATE FUNCTION uint8_ge_uint1(uint8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_ge_uint1';

CREATE FUNCTION uint8_ge_int1(uint8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_ge_int1';


CREATE FUNCTION uint8_le_uint1(uint8, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_le_uint1';

CREATE FUNCTION uint8_le_int1(uint8, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_le_int1';


CREATE FUNCTION uint8_add_uint1(uint8, uint1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_add_uint1';

CREATE FUNCTION uint8_add_int1(uint8, int1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_add_int1';


CREATE FUNCTION uint8_sub_uint1(uint8, uint1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_sub_uint1';

CREATE FUNCTION uint8_sub_int1(uint8, int1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_sub_int1';


CREATE FUNCTION uint8_mul_uint1(uint8, uint1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_mul_uint1';

CREATE FUNCTION uint8_mul_int1(uint8, int1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_mul_int1';


CREATE FUNCTION uint8_div_uint1(uint8, uint1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_div_uint1';

CREATE FUNCTION uint8_div_int1(uint8, int1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_div_int1';


CREATE FUNCTION uint8_mod_uint1(uint8, uint1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_mod_uint1';

CREATE FUNCTION uint8_mod_int1(uint8, int1) RETURNS uint8
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_mod_int1';


CREATE OPERATOR = (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_add_int1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_sub_int1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_mul_int1
);


CREATE OPERATOR / (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_div_int1
);


CREATE OPERATOR % (
    LEFTARG=uint8,
    RIGHTARG=uint1,
    PROCEDURE=uint8_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint8,
    RIGHTARG=int1,
    PROCEDURE=uint8_mod_int1
);





-- Type uint4 block


-- Casts block
-- Ops block

CREATE FUNCTION uint4_eq_uint1(uint4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_eq_uint1';

CREATE FUNCTION uint4_eq_int1(uint4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_eq_int1';


CREATE FUNCTION uint4_ne_uint1(uint4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_ne_uint1';

CREATE FUNCTION uint4_ne_int1(uint4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_ne_int1';


CREATE FUNCTION uint4_gt_uint1(uint4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_gt_uint1';

CREATE FUNCTION uint4_gt_int1(uint4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_gt_int1';


CREATE FUNCTION uint4_lt_uint1(uint4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_lt_uint1';

CREATE FUNCTION uint4_lt_int1(uint4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_lt_int1';


CREATE FUNCTION uint4_ge_uint1(uint4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_ge_uint1';

CREATE FUNCTION uint4_ge_int1(uint4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_ge_int1';


CREATE FUNCTION uint4_le_uint1(uint4, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_le_uint1';

CREATE FUNCTION uint4_le_int1(uint4, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_le_int1';


CREATE FUNCTION uint4_add_uint1(uint4, uint1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_add_uint1';

CREATE FUNCTION uint4_add_int1(uint4, int1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_add_int1';


CREATE FUNCTION uint4_sub_uint1(uint4, uint1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_sub_uint1';

CREATE FUNCTION uint4_sub_int1(uint4, int1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_sub_int1';


CREATE FUNCTION uint4_mul_uint1(uint4, uint1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_mul_uint1';

CREATE FUNCTION uint4_mul_int1(uint4, int1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_mul_int1';


CREATE FUNCTION uint4_div_uint1(uint4, uint1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_div_uint1';

CREATE FUNCTION uint4_div_int1(uint4, int1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_div_int1';


CREATE FUNCTION uint4_mod_uint1(uint4, uint1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_mod_uint1';

CREATE FUNCTION uint4_mod_int1(uint4, int1) RETURNS uint4
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_mod_int1';


CREATE OPERATOR = (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_add_int1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_sub_int1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_mul_int1
);


CREATE OPERATOR / (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_div_int1
);


CREATE OPERATOR % (
    LEFTARG=uint4,
    RIGHTARG=uint1,
    PROCEDURE=uint4_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint4,
    RIGHTARG=int1,
    PROCEDURE=uint4_mod_int1
);





-- Type uint2 block


-- Casts block
-- Ops block

CREATE FUNCTION uint2_eq_uint1(uint2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_eq_uint1';

CREATE FUNCTION uint2_eq_int1(uint2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_eq_int1';


CREATE FUNCTION uint2_ne_uint1(uint2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_ne_uint1';

CREATE FUNCTION uint2_ne_int1(uint2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_ne_int1';


CREATE FUNCTION uint2_gt_uint1(uint2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_gt_uint1';

CREATE FUNCTION uint2_gt_int1(uint2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_gt_int1';


CREATE FUNCTION uint2_lt_uint1(uint2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_lt_uint1';

CREATE FUNCTION uint2_lt_int1(uint2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_lt_int1';


CREATE FUNCTION uint2_ge_uint1(uint2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_ge_uint1';

CREATE FUNCTION uint2_ge_int1(uint2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_ge_int1';


CREATE FUNCTION uint2_le_uint1(uint2, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_le_uint1';

CREATE FUNCTION uint2_le_int1(uint2, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_le_int1';


CREATE FUNCTION uint2_add_uint1(uint2, uint1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_add_uint1';

CREATE FUNCTION uint2_add_int1(uint2, int1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_add_int1';


CREATE FUNCTION uint2_sub_uint1(uint2, uint1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_sub_uint1';

CREATE FUNCTION uint2_sub_int1(uint2, int1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_sub_int1';


CREATE FUNCTION uint2_mul_uint1(uint2, uint1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_mul_uint1';

CREATE FUNCTION uint2_mul_int1(uint2, int1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_mul_int1';


CREATE FUNCTION uint2_div_uint1(uint2, uint1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_div_uint1';

CREATE FUNCTION uint2_div_int1(uint2, int1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_div_int1';


CREATE FUNCTION uint2_mod_uint1(uint2, uint1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_mod_uint1';

CREATE FUNCTION uint2_mod_int1(uint2, int1) RETURNS uint2
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_mod_int1';


CREATE OPERATOR = (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_add_int1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_sub_int1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_mul_int1
);


CREATE OPERATOR / (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_div_int1
);


CREATE OPERATOR % (
    LEFTARG=uint2,
    RIGHTARG=uint1,
    PROCEDURE=uint2_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=uint2,
    RIGHTARG=int1,
    PROCEDURE=uint2_mod_int1
);





-- Type int16 block


-- Casts block
-- Ops block

CREATE FUNCTION int16_eq_uint1(int16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_eq_uint1';

CREATE FUNCTION int16_eq_int1(int16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_eq_int1';


CREATE FUNCTION int16_ne_uint1(int16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_ne_uint1';

CREATE FUNCTION int16_ne_int1(int16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_ne_int1';


CREATE FUNCTION int16_gt_uint1(int16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_gt_uint1';

CREATE FUNCTION int16_gt_int1(int16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_gt_int1';


CREATE FUNCTION int16_lt_uint1(int16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_lt_uint1';

CREATE FUNCTION int16_lt_int1(int16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_lt_int1';


CREATE FUNCTION int16_ge_uint1(int16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_ge_uint1';

CREATE FUNCTION int16_ge_int1(int16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_ge_int1';


CREATE FUNCTION int16_le_uint1(int16, uint1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_le_uint1';

CREATE FUNCTION int16_le_int1(int16, int1) RETURNS boolean
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LEAKPROOF
    LANGUAGE C
    AS '$libdir/uint128', 'int16_le_int1';


CREATE FUNCTION int16_add_uint1(int16, uint1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_add_uint1';

CREATE FUNCTION int16_add_int1(int16, int1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_add_int1';


CREATE FUNCTION int16_sub_uint1(int16, uint1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_sub_uint1';

CREATE FUNCTION int16_sub_int1(int16, int1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_sub_int1';


CREATE FUNCTION int16_mul_uint1(int16, uint1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_mul_uint1';

CREATE FUNCTION int16_mul_int1(int16, int1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_mul_int1';


CREATE FUNCTION int16_div_uint1(int16, uint1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_div_uint1';

CREATE FUNCTION int16_div_int1(int16, int1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_div_int1';


CREATE FUNCTION int16_mod_uint1(int16, uint1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_mod_uint1';

CREATE FUNCTION int16_mod_int1(int16, int1) RETURNS int16
    IMMUTABLE
    PARALLEL SAFE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_mod_int1';


CREATE OPERATOR = (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_eq_uint1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR = (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_eq_int1,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR <> (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_ne_uint1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);

CREATE OPERATOR <> (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_ne_int1,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel,
    HASHES,
    MERGES
);


CREATE OPERATOR > (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_gt_uint1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR > (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_gt_int1,
    COMMUTATOR = >,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR < (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_lt_uint1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR < (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_lt_int1,
    COMMUTATOR = <,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR >= (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_ge_uint1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);

CREATE OPERATOR >= (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_ge_int1,
    COMMUTATOR = >=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


CREATE OPERATOR <= (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_le_uint1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);

CREATE OPERATOR <= (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_le_int1,
    COMMUTATOR = <=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


CREATE OPERATOR + (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_add_uint1,
    COMMUTATOR = +
);

CREATE OPERATOR + (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_add_int1,
    COMMUTATOR = +
);


CREATE OPERATOR - (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_sub_uint1,
    COMMUTATOR = -
);

CREATE OPERATOR - (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_sub_int1,
    COMMUTATOR = -
);


CREATE OPERATOR * (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_mul_uint1
);

CREATE OPERATOR * (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_mul_int1
);


CREATE OPERATOR / (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_div_uint1
);

CREATE OPERATOR / (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_div_int1
);


CREATE OPERATOR % (
    LEFTARG=int16,
    RIGHTARG=uint1,
    PROCEDURE=int16_mod_uint1
);

CREATE OPERATOR % (
    LEFTARG=int16,
    RIGHTARG=int1,
    PROCEDURE=int16_mod_int1
);





