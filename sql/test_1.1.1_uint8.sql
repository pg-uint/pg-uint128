-- Testing cross-types compatibility

SELECT (0::uint8)::json;
SELECT json_build_object('some', 0::uint8);
SELECT ('0'::json)::uint8;
SELECT (0::uint8)::jsonb;
SELECT jsonb_build_object('some', 0::uint8);
SELECT ('0'::jsonb)::uint8;
SELECT ('"abc"'::jsonb)::uint8;
