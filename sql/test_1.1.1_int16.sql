-- Testing cross-types compatibility

SELECT (0::int16)::numeric;
SELECT ('0'::numeric)::int16;
SELECT ('170141183460469231731687303715884105728'::numeric)::int16;
SELECT (0::int16)::json;
SELECT json_build_object('some', 0::int16);
SELECT ('0'::json)::int16;
SELECT (0::int16)::jsonb;
SELECT jsonb_build_object('some', 0::int16);
SELECT ('0'::jsonb)::int16;
SELECT ('"abc"'::jsonb)::int16;
