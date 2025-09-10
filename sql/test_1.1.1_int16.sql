-- Testing cross-types compatibility

SELECT (0::int16)::json;
SELECT json_build_object('some', 0::int16);
SELECT ('0'::json)::int16;
SELECT (0::int16)::jsonb;
SELECT jsonb_build_object('some', 0::int16);
SELECT ('0'::jsonb)::int16;
SELECT ('"abc"'::jsonb)::int16;
