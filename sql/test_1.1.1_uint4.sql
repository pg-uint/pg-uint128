-- Testing cross-types compatibility

SELECT (0::uint4)::json;
SELECT json_build_object('some', 0::uint4);
SELECT ('0'::json)::uint4;
SELECT (0::uint4)::jsonb;
SELECT jsonb_build_object('some', 0::uint4);
SELECT ('0'::jsonb)::uint4;
SELECT ('"abc"'::jsonb)::uint4;
