// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/jsonb.h"
#include "utils/jsonfuncs.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "utils.h"

// Signed comparison

PG_FUNCTION_INFO_V1(int1_from_int2);
Datum int1_from_int2(PG_FUNCTION_ARGS) {
    int16 a = PG_GETARG_INT16(0);

    if (a > INT8_MAX || a < INT8_MIN) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_int2);
Datum int1_to_int2(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT16((int16) a);
}


PG_FUNCTION_INFO_V1(int1_from_int4);
Datum int1_from_int4(PG_FUNCTION_ARGS) {
    int32 a = PG_GETARG_INT32(0);

    if (a > INT8_MAX || a < INT8_MIN) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_int4);
Datum int1_to_int4(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int1_from_int8);
Datum int1_from_int8(PG_FUNCTION_ARGS) {
    int64 a = PG_GETARG_INT64(0);

    if (a > INT8_MAX || a < INT8_MIN) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_int8);
Datum int1_to_int8(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int1_from_int16);
Datum int1_from_int16(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT8_MAX || a < INT8_MIN) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_int16);
Datum int1_to_int16(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT128((int128) a);
}


// Unsigned comparison

PG_FUNCTION_INFO_V1(int1_from_uint1);
Datum int1_from_uint1(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);

    if (a > INT8_MAX) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_uint1);
Datum int1_to_uint1(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint1);
    }
    PG_RETURN_UINT8((uint8) a);
}


PG_FUNCTION_INFO_V1(int1_from_uint2);
Datum int1_from_uint2(PG_FUNCTION_ARGS) {
    uint16 a = PG_GETARG_UINT16(0);

    if (a > INT8_MAX) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_uint2);
Datum int1_to_uint2(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint2);
    }
    PG_RETURN_UINT16((uint16) a);
}


PG_FUNCTION_INFO_V1(int1_from_uint4);
Datum int1_from_uint4(PG_FUNCTION_ARGS) {
    uint32 a = PG_GETARG_UINT32(0);

    if (a > INT8_MAX) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_uint4);
Datum int1_to_uint4(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }
    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(int1_from_uint8);
Datum int1_from_uint8(PG_FUNCTION_ARGS) {
    uint64 a = PG_GETARG_UINT64(0);

    if (a > INT8_MAX) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_uint8);
Datum int1_to_uint8(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint8);
    }
    PG_RETURN_UINT64((uint64) a);
}


PG_FUNCTION_INFO_V1(int1_from_uint16);
Datum int1_from_uint16(PG_FUNCTION_ARGS) {
    uint128 a = PG_GETARG_UINT128(0);

    if (a > INT8_MAX) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int1_to_uint16);
Datum int1_to_uint16(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint16);
    }
    PG_RETURN_UINT128((uint128) a);
}


// JSON casts

PG_FUNCTION_INFO_V1(int1_to_json);
Datum int1_to_json(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    char buf[INT8_STRBUFLEN];

    char *bufPtr = int8_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(int1_to_jsonb);
Datum int1_to_jsonb(PG_FUNCTION_ARGS) {
    int8 val = PG_GETARG_INT8(0);
    JsonbValue jbv;
    Jsonb* result;

    /* convert to Numeric using your internal function */
    char buf[INT8_STRBUFLEN];
    Numeric num = int8_to_numeric(val, buf, sizeof(buf));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    PG_RETURN_JSONB_P(result);
}

PG_FUNCTION_INFO_V1(int1_from_json);
Datum int1_from_json(PG_FUNCTION_ARGS)
{
    text* in = PG_GETARG_TEXT_PP(0);
    char* cStrValue;
    int8 retValue = 0;
    int convRes;

    /* Lex one token to check JSON type */
    JsonLexContext lex;
    JsonParseErrorType lexResult;
    JsonTokenType token;

    makeJsonLexContext(&lex, in, false);
    lexResult = json_lex(&lex);
    if (lexResult != JSON_SUCCESS)
        json_errsave_error(lexResult, &lex, NULL);

    token = lex.token_type;

    if (token == JSON_TOKEN_NULL)
    {
        PG_FREE_IF_COPY(in, 0);
        PG_RETURN_NULL();
    }

    if (token != JSON_TOKEN_NUMBER)
    {
        PG_FREE_IF_COPY(in, 0);
        ereport(ERROR,
                (errcode(ERRCODE_INVALID_PARAMETER_VALUE),
                    errmsg("cannot cast json type to type int1")));
    }

    /* Convert the text to C string */
    cStrValue = text_to_cstring(in);
    convRes = parse_int8(cStrValue, &retValue);

    pfree(cStrValue);
    PG_FREE_IF_COPY(in, 0);

    if (convRes == -1)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type int1")
            )
        );
    }

    if (convRes == -2)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                errmsg("int1 out of range")
            )
        );
    }

    PG_RETURN_INT8(retValue);
}

PG_FUNCTION_INFO_V1(int1_from_jsonb);
Datum int1_from_jsonb(PG_FUNCTION_ARGS)
{
    Jsonb* in = PG_GETARG_JSONB_P(0);
    JsonbValue v;
    char* cStrValue;
    int convRes;
    int8 retValue = 0;

    if (!JsonbExtractScalar(&in->root, &v))
        cannotCastJsonbValue(v.type, "int1");

    if (v.type == jbvNull)
    {
        PG_FREE_IF_COPY(in, 0);
        PG_RETURN_NULL();
    }

    if (v.type != jbvNumeric)
        cannotCastJsonbValue(v.type, "int1");

    // Numeric string
    cStrValue = DatumGetCString(
        DirectFunctionCall1(
            numeric_out,
            NumericGetDatum(v.val.numeric)
        )
    );

    convRes = parse_int8(cStrValue, &retValue);
    // Syntax error
    if (convRes == -1)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type int1: \"%s\"", cStrValue)
            )
        );
    }

    // Overflow error
    if (convRes == -2)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                errmsg("int1 out of range: %s", cStrValue)
            )
        );
    }

    pfree(cStrValue);

    PG_FREE_IF_COPY(in, 0);

    PG_RETURN_INT8(retValue);
}

