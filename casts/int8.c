// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"

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


// Numeric casts

PG_FUNCTION_INFO_V1(int1_from_numeric);
Datum int1_from_numeric(PG_FUNCTION_ARGS)
{
	Numeric num = PG_GETARG_NUMERIC(0);
	int16 numInt = 0;

    // Fast path for small integers
    numInt = DatumGetInt16(DirectFunctionCall1(numeric_int2, NumericGetDatum(num)));
    if (numInt < -128 || numInt > 127) {
        OUT_OF_RANGE_ERR(int1);
    }

	PG_RETURN_INT8((int8)numInt);
}

PG_FUNCTION_INFO_V1(int1_to_numeric);
Datum int1_to_numeric(PG_FUNCTION_ARGS)
{
	int8		val = PG_GETARG_INT8(0);

	PG_RETURN_DATUM(DirectFunctionCall1(int2_numeric, Int16GetDatum((int16)val)));
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
Datum int1_to_jsonb(PG_FUNCTION_ARGS)
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

PG_FUNCTION_INFO_V1(int1_from_json);
Datum int1_from_json(PG_FUNCTION_ARGS)
{
    text* json = PG_GETARG_TEXT_PP(0);
    char* cStrValue;
    int8 retValue = 0;
    parse_uint_res_t convRes;

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
        cannotCastJsonValue(token, "int1");
    }
#endif

    /* Convert the text to C string */
    cStrValue = text_to_cstring(json);
    convRes = parse_int8(cStrValue, &retValue);

    pfree(cStrValue);
    PG_FREE_IF_COPY(json, 0);

    if (convRes == ParseOK) {
        PG_RETURN_INT8(retValue);
    }

    if (convRes == ParseError)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type int1")
            )
        );
    }

    OUT_OF_RANGE_ERR(int1);
}

PG_FUNCTION_INFO_V1(int1_from_jsonb);
Datum int1_from_jsonb(PG_FUNCTION_ARGS)
{
    Jsonb* in = PG_GETARG_JSONB_P(0);
    JsonbValue v;
    char* cStrValue;
    parse_uint_res_t convRes;
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
    if (convRes == ParseOK) {
        pfree(cStrValue);

        PG_FREE_IF_COPY(in, 0);

        PG_RETURN_INT8(retValue);
    }

    if (convRes == ParseError)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type int1: \"%s\"", cStrValue)
            )
        );
    }

    OUT_OF_RANGE_ERR(int1);
}

