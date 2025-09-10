-- Testing cross-types compatibility

SELECT (0::uint1)::json;
SELECT json_build_object('some', 0::uint1);
SELECT ('0'::json)::uint1;
SELECT (0::uint1)::jsonb;
SELECT jsonb_build_object('some', 0::uint1);
SELECT ('0'::jsonb)::uint1;
SELECT ('"abc"'::jsonb)::uint1;
