
-- Casts block

CREATE FUNCTION uint1_from_json(json) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_json';

CREATE FUNCTION uint1_to_json(uint1) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_json';

CREATE CAST (json AS uint1) WITH FUNCTION uint1_from_json(json) AS IMPLICIT;
CREATE CAST (uint1 AS json) WITH FUNCTION uint1_to_json(uint1) AS IMPLICIT;


CREATE FUNCTION uint1_from_jsonb(jsonb) RETURNS uint1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_from_jsonb';

CREATE FUNCTION uint1_to_jsonb(uint1) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint1_to_jsonb';

CREATE CAST (jsonb AS uint1) WITH FUNCTION uint1_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (uint1 AS jsonb) WITH FUNCTION uint1_to_jsonb(uint1) AS IMPLICIT;

-- Ops block




-- Casts block

CREATE FUNCTION uint2_from_json(json) RETURNS uint2
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_json';

CREATE FUNCTION uint2_to_json(uint2) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_to_json';

CREATE CAST (json AS uint2) WITH FUNCTION uint2_from_json(json) AS IMPLICIT;
CREATE CAST (uint2 AS json) WITH FUNCTION uint2_to_json(uint2) AS IMPLICIT;


CREATE FUNCTION uint2_from_jsonb(jsonb) RETURNS uint2
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_from_jsonb';

CREATE FUNCTION uint2_to_jsonb(uint2) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint2_to_jsonb';

CREATE CAST (jsonb AS uint2) WITH FUNCTION uint2_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (uint2 AS jsonb) WITH FUNCTION uint2_to_jsonb(uint2) AS IMPLICIT;

-- Ops block




-- Casts block

CREATE FUNCTION uint4_from_json(json) RETURNS uint4
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_json';

CREATE FUNCTION uint4_to_json(uint4) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_to_json';

CREATE CAST (json AS uint4) WITH FUNCTION uint4_from_json(json) AS IMPLICIT;
CREATE CAST (uint4 AS json) WITH FUNCTION uint4_to_json(uint4) AS IMPLICIT;


CREATE FUNCTION uint4_from_jsonb(jsonb) RETURNS uint4
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_from_jsonb';

CREATE FUNCTION uint4_to_jsonb(uint4) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint4_to_jsonb';

CREATE CAST (jsonb AS uint4) WITH FUNCTION uint4_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (uint4 AS jsonb) WITH FUNCTION uint4_to_jsonb(uint4) AS IMPLICIT;

-- Ops block




-- Casts block

CREATE FUNCTION uint8_from_json(json) RETURNS uint8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_json';

CREATE FUNCTION uint8_to_json(uint8) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_to_json';

CREATE CAST (json AS uint8) WITH FUNCTION uint8_from_json(json) AS IMPLICIT;
CREATE CAST (uint8 AS json) WITH FUNCTION uint8_to_json(uint8) AS IMPLICIT;


CREATE FUNCTION uint8_from_jsonb(jsonb) RETURNS uint8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_from_jsonb';

CREATE FUNCTION uint8_to_jsonb(uint8) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint8_to_jsonb';

CREATE CAST (jsonb AS uint8) WITH FUNCTION uint8_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (uint8 AS jsonb) WITH FUNCTION uint8_to_jsonb(uint8) AS IMPLICIT;

-- Ops block




-- Casts block

CREATE FUNCTION uint16_from_json(json) RETURNS uint16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_json';

CREATE FUNCTION uint16_to_json(uint16) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_to_json';

CREATE CAST (json AS uint16) WITH FUNCTION uint16_from_json(json) AS IMPLICIT;
CREATE CAST (uint16 AS json) WITH FUNCTION uint16_to_json(uint16) AS IMPLICIT;


CREATE FUNCTION uint16_from_jsonb(jsonb) RETURNS uint16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_from_jsonb';

CREATE FUNCTION uint16_to_jsonb(uint16) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'uint16_to_jsonb';

CREATE CAST (jsonb AS uint16) WITH FUNCTION uint16_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (uint16 AS jsonb) WITH FUNCTION uint16_to_jsonb(uint16) AS IMPLICIT;

-- Ops block




-- Casts block

CREATE FUNCTION int1_from_json(json) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_json';

CREATE FUNCTION int1_to_json(int1) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_json';

CREATE CAST (json AS int1) WITH FUNCTION int1_from_json(json) AS IMPLICIT;
CREATE CAST (int1 AS json) WITH FUNCTION int1_to_json(int1) AS IMPLICIT;


CREATE FUNCTION int1_from_jsonb(jsonb) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_from_jsonb';

CREATE FUNCTION int1_to_jsonb(int1) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int1_to_jsonb';

CREATE CAST (jsonb AS int1) WITH FUNCTION int1_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (int1 AS jsonb) WITH FUNCTION int1_to_jsonb(int1) AS IMPLICIT;

-- Ops block




-- Casts block

CREATE FUNCTION int16_from_json(json) RETURNS int16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_json';

CREATE FUNCTION int16_to_json(int16) RETURNS json
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_to_json';

CREATE CAST (json AS int16) WITH FUNCTION int16_from_json(json) AS IMPLICIT;
CREATE CAST (int16 AS json) WITH FUNCTION int16_to_json(int16) AS IMPLICIT;


CREATE FUNCTION int16_from_jsonb(jsonb) RETURNS int16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_from_jsonb';

CREATE FUNCTION int16_to_jsonb(int16) RETURNS jsonb
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint128', 'int16_to_jsonb';

CREATE CAST (jsonb AS int16) WITH FUNCTION int16_from_jsonb(jsonb) AS IMPLICIT;
CREATE CAST (int16 AS jsonb) WITH FUNCTION int16_to_jsonb(int16) AS IMPLICIT;

-- Ops block



