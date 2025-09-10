-- Testing cross-types compatibility

SELECT (0::uint2)::numeric;
SELECT ('0'::numeric)::uint2;
SELECT ('65536'::numeric)::uint2;
SELECT (0::uint2)::json;
SELECT json_build_object('some', 0::uint2);
SELECT ('0'::json)::uint2;
SELECT (0::uint2)::jsonb;
SELECT jsonb_build_object('some', 0::uint2);
SELECT ('0'::jsonb)::uint2;
SELECT ('"abc"'::jsonb)::uint2;
