-- ALTER OPERATOR cannot remove or replace an existing commutator.
-- Update only extension members, preserving operator OIDs and dependent objects.
WITH config(sign, commutator, same_type_only) AS (
    VALUES
    ('=', '=', false),
    ('<>', '<>', false),
    ('>', '<', false),
    ('<', '>', false),
    ('>=', '<=', false),
    ('<=', '>=', false),
    ('+', '+', true),
    ('-', NULL, false),
    ('*', NULL, false),
    ('/', NULL, false),
    ('%', NULL, false),
    ('#', '#', false),
    ('&', '&', false),
    ('|', '|', false),
    ('~', NULL, false),
    ('<<', NULL, false),
    ('>>', NULL, false)
),
desired AS (
    SELECT
        o.oid,
        CASE
            WHEN config.commutator IS NULL
            OR (config.same_type_only AND o.oprleft <> o.oprright) THEN 0::oid
            ELSE c.oid
        END AS commutator
    FROM pg_catalog.pg_operator o
    JOIN pg_catalog.pg_depend d ON
        d.classid = 'pg_catalog.pg_operator'::regclass
        AND d.objid = o.oid
        AND d.refclassid = 'pg_catalog.pg_extension'::regclass
        AND d.deptype = 'e'
    JOIN pg_catalog.pg_extension e ON e.oid = d.refobjid AND e.extname = 'uint128'
    JOIN config ON config.sign = o.oprname
    LEFT JOIN pg_catalog.pg_operator c ON
        c.oprnamespace = o.oprnamespace
        AND c.oprname = config.commutator
        AND c.oprleft = o.oprright
        AND c.oprright = o.oprleft
        AND c.oprresult = o.oprresult
        AND c.oprcode <> 0
)
UPDATE pg_catalog.pg_operator o
SET oprcom = desired.commutator
FROM desired
WHERE o.oid = desired.oid AND o.oprcom IS DISTINCT FROM desired.commutator;
