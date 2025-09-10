// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>

// Unsigned casts

PG_FUNCTION_INFO_V1(uint4_from_uint1);
Datum uint4_from_uint1(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);

    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_uint2);
Datum uint4_from_uint2(PG_FUNCTION_ARGS) {
    uint16 a = PG_GETARG_UINT16(0);

    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_uint8);
Datum uint4_from_uint8(PG_FUNCTION_ARGS) {
    uint64 a = PG_GETARG_UINT64(0);

    if (a > UINT32_MAX) {
        OUT_OF_RANGE_ERR(uint4);
    }
    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_uint16);
Datum uint4_from_uint16(PG_FUNCTION_ARGS) {
    uint128 a = PG_GETARG_UINT128(0);

    if (a > UINT32_MAX) {
        OUT_OF_RANGE_ERR(uint4);
    }
    PG_RETURN_UINT32((uint32) a);
}


// Signed casts

PG_FUNCTION_INFO_V1(uint4_from_int1);
Datum uint4_from_int1(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }

    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_int2);
Datum uint4_from_int2(PG_FUNCTION_ARGS) {
    int16 a = PG_GETARG_INT16(0);
    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }

    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_int4);
Datum uint4_from_int4(PG_FUNCTION_ARGS) {
    int32 a = PG_GETARG_INT32(0);
    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }

    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_int8);
Datum uint4_from_int8(PG_FUNCTION_ARGS) {
    int64 a = PG_GETARG_INT64(0);
    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }

    if (a > UINT32_MAX) {
        OUT_OF_RANGE_ERR(uint4);
    }
    PG_RETURN_UINT32((uint32) a);
}


PG_FUNCTION_INFO_V1(uint4_from_int16);
Datum uint4_from_int16(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);
    if (a < 0) {
        OUT_OF_RANGE_ERR(uint4);
    }

    if (a > UINT32_MAX) {
        OUT_OF_RANGE_ERR(uint4);
    }
    PG_RETURN_UINT32((uint32) a);
}


// Numeric casts

PG_FUNCTION_INFO_V1(uint4_from_numeric);
Datum uint4_from_numeric(PG_FUNCTION_ARGS)
{
	Numeric num = PG_GETARG_NUMERIC(0);
	int64 numInt = 0;

    // Fast path for small integers
    numInt = DatumGetInt64(DirectFunctionCall1(numeric_int8, NumericGetDatum(num)));
    if (numInt < 0 || numInt > 4294967295) {
        OUT_OF_RANGE_ERR(uint4);
    }

	PG_RETURN_UINT32((uint32)numInt);
}

// Float casts

PG_FUNCTION_INFO_V1(uint4_from_float4);
Datum uint4_from_float4(PG_FUNCTION_ARGS)
{
	float4		num = PG_GETARG_FLOAT4(0);

	/*
	 * Get rid of any fractional part in the input.  This is so we don't fail
	 * on just-out-of-range values that would round into range.  Note
	 * assumption that rint() will pass through a NaN or Inf unchanged.
	 */
	num = (float4)rint(num);

	/* Range check */
	if (unlikely(isnan(num) || !FLOAT4_FITS_IN_UINT32(num)))
		OUT_OF_RANGE_ERR(uint4);

	PG_RETURN_UINT32((uint32) num);
}

PG_FUNCTION_INFO_V1(uint4_from_float8);
Datum uint4_from_float8(PG_FUNCTION_ARGS)
{
	float8		num = PG_GETARG_FLOAT8(0);

	/*
	 * Get rid of any fractional part in the input.  This is so we don't fail
	 * on just-out-of-range values that would round into range.  Note
	 * assumption that rint() will pass through a NaN or Inf unchanged.
	 */
	num = (float8)rint(num);

	/* Range check */
	if (unlikely(isnan(num) || !FLOAT8_FITS_IN_UINT32(num)))
		OUT_OF_RANGE_ERR(uint4);

	PG_RETURN_UINT32((uint32) num);
}

// JSON casts

PG_FUNCTION_INFO_V1(uint4_from_json);
Datum uint4_from_json(PG_FUNCTION_ARGS)
{
    text* json = PG_GETARG_TEXT_PP(0);
    char* cStrValue;
    uint32 retValue = 0;
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
        cannotCastJsonValue(token, "uint4");
    }
#endif

    /* Convert the text to C string */
    cStrValue = text_to_cstring(json);
    convRes = parse_uint32(cStrValue, &retValue);

    pfree(cStrValue);
    PG_FREE_IF_COPY(json, 0);

    if (convRes == ParseOK) {
        PG_RETURN_UINT32(retValue);
    }

    if (convRes == ParseError)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type uint4")
            )
        );
    }

    OUT_OF_RANGE_ERR(uint4);
}

PG_FUNCTION_INFO_V1(uint4_from_jsonb);
Datum uint4_from_jsonb(PG_FUNCTION_ARGS)
{
    Jsonb* in = PG_GETARG_JSONB_P(0);
    JsonbValue v;
    char* cStrValue;
    parse_uint_res_t convRes;
    uint32 retValue = 0;

    if (!JsonbExtractScalar(&in->root, &v))
        cannotCastJsonbValue(v.type, "uint4");

    if (v.type == jbvNull)
    {
        PG_FREE_IF_COPY(in, 0);
        PG_RETURN_NULL();
    }

    if (v.type != jbvNumeric)
        cannotCastJsonbValue(v.type, "uint4");

    // Numeric string
    cStrValue = DatumGetCString(
        DirectFunctionCall1(
            numeric_out,
            NumericGetDatum(v.val.numeric)
        )
    );

    convRes = parse_uint32(cStrValue, &retValue);
    if (convRes == ParseOK) {
        pfree(cStrValue);

        PG_FREE_IF_COPY(in, 0);

        PG_RETURN_UINT32(retValue);
    }

    if (convRes == ParseError)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type uint4: \"%s\"", cStrValue)
            )
        );
    }

    OUT_OF_RANGE_ERR(uint4);
}

