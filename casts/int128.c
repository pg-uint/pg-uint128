// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"

// Signed comparison

PG_FUNCTION_INFO_V1(int16_from_int1);
Datum int16_from_int1(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_int1);
Datum int16_to_int1(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT8_MAX || a < INT8_MIN) {
        OUT_OF_RANGE_ERR(int1);
    }
    PG_RETURN_INT8((int8) a);
}


PG_FUNCTION_INFO_V1(int16_from_int2);
Datum int16_from_int2(PG_FUNCTION_ARGS) {
    int16 a = PG_GETARG_INT16(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_int2);
Datum int16_to_int2(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT16_MAX || a < INT16_MIN) {
        OUT_OF_RANGE_ERR(int2);
    }
    PG_RETURN_INT16((int16) a);
}


PG_FUNCTION_INFO_V1(int16_from_int4);
Datum int16_from_int4(PG_FUNCTION_ARGS) {
    int32 a = PG_GETARG_INT32(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_int4);
Datum int16_to_int4(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT32_MAX || a < INT32_MIN) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int16_from_int8);
Datum int16_from_int8(PG_FUNCTION_ARGS) {
    int64 a = PG_GETARG_INT64(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_int8);
Datum int16_to_int8(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT64_MAX || a < INT64_MIN) {
        OUT_OF_RANGE_ERR(int8);
    }
    PG_RETURN_INT64((int64) a);
}


// Unsigned comparison

PG_FUNCTION_INFO_V1(int16_from_uint1);
Datum int16_from_uint1(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_uint1);
Datum int16_to_uint1(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint1);
    }
    if (a > UINT8_MAX) {
        OUT_OF_RANGE_ERR(uint1);
    }
    PG_RETURN_UINT8((uint8) a);
}


PG_FUNCTION_INFO_V1(int16_from_uint2);
Datum int16_from_uint2(PG_FUNCTION_ARGS) {
    uint16 a = PG_GETARG_UINT16(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_uint2);
Datum int16_to_uint2(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint2);
    }
    if (a > UINT16_MAX) {
        OUT_OF_RANGE_ERR(uint2);
    }
    PG_RETURN_UINT16((uint16) a);
}


PG_FUNCTION_INFO_V1(int16_from_uint4);
Datum int16_from_uint4(PG_FUNCTION_ARGS) {
    uint32 a = PG_GETARG_UINT32(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_uint4);
Datum int16_to_uint4(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }
    if (a > UINT32_MAX) {
        OUT_OF_RANGE_ERR(uint4);
    }
    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(int16_from_uint8);
Datum int16_from_uint8(PG_FUNCTION_ARGS) {
    uint64 a = PG_GETARG_UINT64(0);

    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_uint8);
Datum int16_to_uint8(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint8);
    }
    if (a > UINT64_MAX) {
        OUT_OF_RANGE_ERR(uint8);
    }
    PG_RETURN_UINT64((uint64) a);
}


PG_FUNCTION_INFO_V1(int16_from_uint16);
Datum int16_from_uint16(PG_FUNCTION_ARGS) {
    uint128 a = PG_GETARG_UINT128(0);

    if (a > INT128_MAX) {
        OUT_OF_RANGE_ERR(int16);
    }
    PG_RETURN_INT128((int128) a);
}


PG_FUNCTION_INFO_V1(int16_to_uint16);
Datum int16_to_uint16(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a < 0) {
        OUT_OF_RANGE_ERR(uint16);
    }
    PG_RETURN_UINT128((uint128) a);
}


// JSON casts

PG_FUNCTION_INFO_V1(int16_to_json);
Datum int16_to_json(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);
    char buf[INT128_STRBUFLEN];

    char *bufPtr = int128_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(int16_to_jsonb);
Datum int16_to_jsonb(PG_FUNCTION_ARGS) {
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

PG_FUNCTION_INFO_V1(int16_from_json);
Datum int16_from_json(PG_FUNCTION_ARGS)
{
    text* json = PG_GETARG_TEXT_PP(0);
    char* cStrValue;
    int128 retValue = 0;
    int convRes;

    // Enforce JSON validation for supported PostgreSQL versions
#if PG_VERSION_NUM >= 130000
    JsonTokenType token;

#if PG_VERSION_NUM >= 170000 // 17+
    /* Lex one token to check JSON type */
    JsonLexContext lex;
    JsonParseErrorType lexResult;

    makeJsonLexContext(&lex, json, false);
    lexResult = json_lex(&lex);
    if (lexResult != JSON_SUCCESS)
        json_errsave_error(lexResult, &lex, NULL);

    token = lex.token_type;
#elif PG_VERSION_NUM >= 160000 // 16
    JsonParseErrorType result;
    JsonLexContext *lex = makeJsonLexContext(json, false);

    /* Lex exactly one token from the input and check its type. */
    result = json_lex(lex);
    if (result != JSON_SUCCESS)
        json_errsave_error(result, lex, NULL);

    token = lex->token_type;
#else // 13-15
    JsonLexContext *lex;
    JsonParseErrorType result;

    lex = makeJsonLexContext(json, false);

    /* Lex exactly one token from the input and check its type. */
    result = json_lex(lex);
    if (result != JSON_SUCCESS)
        json_ereport_error(result, lex);

    token = lex->token_type;
#endif

    if (token == JSON_TOKEN_NULL)
    {
        PG_FREE_IF_COPY(json, 0);
        PG_RETURN_NULL();
    }

    if (token != JSON_TOKEN_NUMBER)
    {
        PG_FREE_IF_COPY(json, 0);
        cannotCastJsonValue(token, "int16");
    }
#endif

    /* Convert the text to C string */
    cStrValue = text_to_cstring(json);
    convRes = parse_int128(cStrValue, &retValue);

    pfree(cStrValue);
    PG_FREE_IF_COPY(json, 0);

    if (convRes == -1)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type int16")
            )
        );
    }

    if (convRes == -2)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                errmsg("int16 out of range")
            )
        );
    }

    PG_RETURN_INT128(retValue);
}

PG_FUNCTION_INFO_V1(int16_from_jsonb);
Datum int16_from_jsonb(PG_FUNCTION_ARGS)
{
    Jsonb* in = PG_GETARG_JSONB_P(0);
    JsonbValue v;
    char* cStrValue;
    int convRes;
    int128 retValue = 0;

    if (!JsonbExtractScalar(&in->root, &v))
        cannotCastJsonbValue(v.type, "int16");

    if (v.type == jbvNull)
    {
        PG_FREE_IF_COPY(in, 0);
        PG_RETURN_NULL();
    }

    if (v.type != jbvNumeric)
        cannotCastJsonbValue(v.type, "int16");

    // Numeric string
    cStrValue = DatumGetCString(
        DirectFunctionCall1(
            numeric_out,
            NumericGetDatum(v.val.numeric)
        )
    );

    convRes = parse_int128(cStrValue, &retValue);
    // Syntax error
    if (convRes == -1)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type int16: \"%s\"", cStrValue)
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
                errmsg("int16 out of range: %s", cStrValue)
            )
        );
    }

    pfree(cStrValue);

    PG_FREE_IF_COPY(in, 0);

    PG_RETURN_INT128(retValue);
}

