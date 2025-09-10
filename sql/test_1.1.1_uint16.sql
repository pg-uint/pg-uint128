-- Testing cross-types compatibility

SELECT (0::uint16)::json;
SELECT json_build_object('some', 0::uint16);
SELECT ('0'::json)::uint16;
SELECT (0::uint16)::jsonb;
SELECT jsonb_build_object('some', 0::uint16);
SELECT ('0'::jsonb)::uint16;
SELECT ('"abc"'::jsonb)::uint16;
