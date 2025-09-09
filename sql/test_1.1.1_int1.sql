-- Testing cross-types compatibility

SELECT (0::int1)::json;
SELECT json_build_object('some', 0::int1);
SELECT ('0'::json)::int1;
SELECT (0::int1)::jsonb;
SELECT jsonb_build_object('some', 0::int1);
SELECT ('0'::jsonb)::int1;
