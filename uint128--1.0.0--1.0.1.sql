-- uint16 pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'uint16'::regtype AS oid) typ

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
        'uint16_cmp(uint16, uint16)'::regprocedure::oid AS oid,
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
        
    FROM (SELECT 'uint16'::regtype AS oid) typ

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
        'uint16_hash(uint16)'::regprocedure::oid AS oid,
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

-- uint8 pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'uint8'::regtype AS oid) typ

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
        'uint8_cmp(uint8, uint8)'::regprocedure::oid AS oid,
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
        
    FROM (SELECT 'uint8'::regtype AS oid) typ

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
        'uint8_hash(uint8)'::regprocedure::oid AS oid,
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


-- uint4 pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'uint4'::regtype AS oid) typ

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
        'uint4_cmp(uint4, uint4)'::regprocedure::oid AS oid,
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
        
    FROM (SELECT 'uint4'::regtype AS oid) typ

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
        'uint4_hash(uint4)'::regprocedure::oid AS oid,
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


-- uint2 pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'uint2'::regtype AS oid) typ

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
        'uint2_cmp(uint2, uint2)'::regprocedure::oid AS oid,
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
        
    FROM (SELECT 'uint2'::regtype AS oid) typ

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
        'uint2_hash(uint2)'::regprocedure::oid AS oid,
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


-- int16 pg_depend records to prevent incorrect restoration order from binary dump

-- BTREE OPERATOR CLASS
WITH typ AS (
    SELECT 
        typ.oid AS typ_oid,
        pg_opclass.oid AS opc_oid
        
    FROM (SELECT 'int16'::regtype AS oid) typ

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
        'int16_cmp(int16, int16)'::regprocedure::oid AS oid,
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
        
    FROM (SELECT 'int16'::regtype AS oid) typ

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
        'int16_hash(int16)'::regprocedure::oid AS oid,
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
