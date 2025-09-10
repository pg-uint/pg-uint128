// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>


PG_FUNCTION_INFO_V1(jsonb_from_uint1);
Datum jsonb_from_uint1(PG_FUNCTION_ARGS)
{
    uint8 val = PG_GETARG_UINT8(0);

    JsonbValue jbv;
    Jsonb* result;

    Numeric num = DatumGetNumeric(DirectFunctionCall1(int2_numeric, Int16GetDatum((int16)val)));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(jsonb_from_uint2);
Datum jsonb_from_uint2(PG_FUNCTION_ARGS)
{
    uint16 val = PG_GETARG_UINT16(0);

    JsonbValue jbv;
    Jsonb* result;

    Numeric num = DatumGetNumeric(DirectFunctionCall1(int4_numeric, Int32GetDatum((int32)val)));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(jsonb_from_uint4);
Datum jsonb_from_uint4(PG_FUNCTION_ARGS)
{
    uint32 val = PG_GETARG_UINT32(0);

    JsonbValue jbv;
    Jsonb* result;

    Numeric num = DatumGetNumeric(DirectFunctionCall1(int8_numeric, Int64GetDatum((int64)val)));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(jsonb_from_uint8);
Datum jsonb_from_uint8(PG_FUNCTION_ARGS) {
    uint64 val = PG_GETARG_UINT64(0);
    JsonbValue jbv;
    Jsonb* result;

    /* convert to Numeric */
    char buf[UINT64_STRBUFLEN];
    Numeric num = uint64_to_numeric(val, buf, sizeof(buf));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(jsonb_from_uint16);
Datum jsonb_from_uint16(PG_FUNCTION_ARGS) {
    uint128 val = PG_GETARG_UINT128(0);
    JsonbValue jbv;
    Jsonb* result;

    /* convert to Numeric */
    char buf[UINT128_STRBUFLEN];
    Numeric num = uint128_to_numeric(val, buf, sizeof(buf));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(jsonb_from_int1);
Datum jsonb_from_int1(PG_FUNCTION_ARGS)
{
    int8 val = PG_GETARG_INT8(0);

    JsonbValue jbv;
    Jsonb* result;

    Numeric num = DatumGetNumeric(DirectFunctionCall1(int2_numeric, Int16GetDatum((int16)val)));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(jsonb_from_int16);
Datum jsonb_from_int16(PG_FUNCTION_ARGS) {
    int128 val = PG_GETARG_INT128(0);
    JsonbValue jbv;
    Jsonb* result;

    /* convert to Numeric */
    char buf[INT128_STRBUFLEN];
    Numeric num = int128_to_numeric(val, buf, sizeof(buf));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

