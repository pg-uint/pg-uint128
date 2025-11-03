<?php

declare(strict_types=1);

require_once __DIR__ . '/../core/index.php';

function getCastUIntFromIntFunc(Type $left, Type $right): string
{
    if (!$left->isUnsigned || $right->isUnsigned) {
        throw new InvalidArgumentException("Only cast uint from signed int is supported");
    }

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $right->name a = $right->pgGetArgMacro(0);\n";
    $fn .= "    if (a < 0) {\n";
    $fn .= "        OUT_OF_RANGE_ERR($left->pgName);\n";
    $fn .= "    }\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($right->bitSize > $left->bitSize) {
        $fn .= "    if (a > {$left->getMaxConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($left->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $left->pgReturnMacro(($left->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastIntFromUIntFunc(Type $left, Type $right): string
{
    if ($left->isUnsigned || !$right->isUnsigned) {
        throw new InvalidArgumentException("Only cast signed int from uint is supported");
    }

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $right->name a = $right->pgGetArgMacro(0);\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($right->bitSize >= $left->bitSize) {
        $fn .= "    if (a > {$left->getMaxConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($left->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $left->pgReturnMacro(($left->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastIntFromIntFunc(Type $left, Type $right): string
{
    if ($left->isUnsigned || $right->isUnsigned) {
        throw new InvalidArgumentException("Only cast signed int from signed int is supported");
    }

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $right->name a = $right->pgGetArgMacro(0);\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($right->bitSize > $left->bitSize) {
        $fn .= "    if (a > {$left->getMaxConstC()} || a < {$left->getMinConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($left->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $left->pgReturnMacro(($left->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastUIntFromUIntFunc(Type $left, Type $right): string
{
    if (!$left->isUnsigned || !$right->isUnsigned) {
        throw new InvalidArgumentException("Only cast uint from uint is supported");
    }

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $right->name a = $right->pgGetArgMacro(0);\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($right->bitSize > $left->bitSize) {
        $fn .= "    if (a > {$left->getMaxConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($left->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $left->pgReturnMacro(($left->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastToJSONFunc(Type $left): string
{
    $right = JSON;

    $funcName = "{$right->pgName}_from_{$left->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum {$funcName}(PG_FUNCTION_ARGS) {
    $left->name a = $left->pgGetArgMacro(0);
    char buf[{$left->getStrBufLenConstC()}];

    char *bufPtr = {$left->name}_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    $right->pgReturnMacro(result);
}
C;
}

function getCastFromNumeric(Type $left): string
{
    $right = NUMERIC;

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    // Fast path for small integers
    if ($left->bitSize < 64) {
        /**
         * @var string $numericFnName
         * @var Type $intTyp
         */

        if ($left->isUnsigned) {
            [$numericFnName, $intTyp] = match ($left->bitSize) {
                8 => ['numeric_int2', INT16],
                16 => ['numeric_int4', INT32],
                32 => ['numeric_int8', INT64],
            };
        } else {
            [$numericFnName, $intTyp] = match ($left->bitSize) {
                8 => ['numeric_int2', INT16],
            };
        }

        return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
	Numeric num = PG_GETARG_NUMERIC(0);
	$intTyp->name numInt = 0;

    // Fast path for small integers
    numInt = $intTyp->fromDatum(DirectFunctionCall1($numericFnName, NumericGetDatum(num)));
    if (numInt < $left->minValue || numInt > $left->maxValue) {
        OUT_OF_RANGE_ERR($left->pgName);
    }

	$left->pgReturnMacro(($left->name)numInt);
}
C;
    }

    return '';
}

function getCastToNumeric(Type $left): string
{
    $right = NUMERIC;

    $funcName = "{$right->pgName}_from_{$left->pgName}";

    // Fast path for small integers
    if ($left->bitSize < 64) {
        /**
         * @var string $numericFnName
         * @var Type $intTyp
         */

        if ($left->isUnsigned) {
            [$numericFnName, $intTyp] = match ($left->bitSize) {
                8 => ['int2_numeric', INT16],
                16 => ['int4_numeric', INT32],
                32 => ['int8_numeric', INT64],
            };
        } else {
            [$numericFnName, $intTyp] = match ($left->bitSize) {
                8 => ['int2_numeric', INT16],
            };
        }

        return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
	$left->name		val = $left->pgGetArgMacro(0);

	PG_RETURN_DATUM(DirectFunctionCall1($numericFnName, $intTyp->toDatum(($intTyp->name)val)));
}
C;
    }

    return '';
}

function getCastFromFloat(Type $left, Type $right): string
{
    $funcName = "{$left->pgName}_from_{$right->pgName}";

    $boundsCheckMacro = strtoupper($right->name) . "_FITS_IN_" . strtoupper($left->name);

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
	$right->name		num = $right->pgGetArgMacro(0);

	/*
	 * Get rid of any fractional part in the input.  This is so we don't fail
	 * on just-out-of-range values that would round into range.  Note
	 * assumption that rint() will pass through a NaN or Inf unchanged.
	 */
	num = ($right->name)rint(num);

	/* Range check */
	if (unlikely(isnan(num) || !$boundsCheckMacro(num)))
		OUT_OF_RANGE_ERR($left->pgName);

	$left->pgReturnMacro(($left->name) num);
}
C;
}

function getCastToFloat(Type $left, Type $right): string
{
    $funcName = "{$right->pgName}_from_{$left->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
	$left->name		arg = $left->pgGetArgMacro(0);
	$right->name		result;

	result = ($right->name)arg;

	$right->pgReturnMacro(result);
}
C;
}

function getCastToJSONBFunc(Type $left): string
{
    $right = JSONB;

    $funcName = "{$right->pgName}_from_{$left->pgName}";

    // Fast path for small integers
    if ($left->bitSize < 64) {
        /**
         * @var string $numericFnName
         * @var Type $intTyp
         */

        if ($left->isUnsigned) {
            [$numericFnName, $intTyp] = match ($left->bitSize) {
                8 => ['int2_numeric', INT16],
                16 => ['int4_numeric', INT32],
                32 => ['int8_numeric', INT64],
            };
        } else {
            [$numericFnName, $intTyp] = match ($left->bitSize) {
                8 => ['int2_numeric', INT16],
            };
        }

        $numericTyp = NUMERIC;

        return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
    $left->name val = $left->pgGetArgMacro(0);

    JsonbValue jbv;
    Jsonb* result;

    Numeric num = $numericTyp->fromDatum(DirectFunctionCall1($numericFnName, $intTyp->toDatum(($intTyp->name)val)));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    $right->pgReturnMacro(result);
}
C;
    }

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum {$funcName}(PG_FUNCTION_ARGS) {
    $left->name val = $left->pgGetArgMacro(0);
    JsonbValue jbv;
    Jsonb* result;

    /* convert to Numeric */
    char buf[{$left->getStrBufLenConstC()}];
    Numeric num = {$left->name}_to_numeric(val, buf, sizeof(buf));

    /* convert Numeric to JsonbValue */
    jbv.type = jbvNumeric;
    jbv.val.numeric = num;

    /* wrap into a Jsonb container */
    result = JsonbValueToJsonb(&jbv);

    $right->pgReturnMacro(result);
}
C;
}

function getCastFromJSONBFunc(Type $left): string
{
    $right = JSONB;

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
    Jsonb* in = PG_GETARG_JSONB_P(0);
    JsonbValue v;
    char* cStrValue;
    parse_uint_res_t convRes;
    $left->name retValue = 0;

    if (!JsonbExtractScalar(&in->root, &v))
        cannotCastJsonbValue(v.type, "{$left->pgName}");

    if (v.type == jbvNull)
    {
        PG_FREE_IF_COPY(in, 0);
        PG_RETURN_NULL();
    }

    if (v.type != jbvNumeric)
        cannotCastJsonbValue(v.type, "{$left->pgName}");

    // Numeric string
    cStrValue = DatumGetCString(
        DirectFunctionCall1(
            numeric_out,
            NumericGetDatum(v.val.numeric)
        )
    );

    convRes = parse_{$left->name}(cStrValue, &retValue);
    if (convRes == ParseOK) {
        pfree(cStrValue);

        PG_FREE_IF_COPY(in, 0);

        $left->pgReturnMacro(retValue);
    }

    if (convRes == ParseError)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type {$left->pgName}: \"%s\"", cStrValue)
            )
        );
    }

    OUT_OF_RANGE_ERR($left->pgName);
}
C;
}

function getCastFromJSONFunc(Type $left): string
{
    $right = JSON;

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
    text* json = PG_GETARG_TEXT_PP(0);
    char* cStrValue;
    $left->name retValue = 0;
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
        cannotCastJsonValue(token, "$left->pgName");
    }
#endif

    /* Convert the text to C string */
    cStrValue = text_to_cstring(json);
    convRes = parse_{$left->name}(cStrValue, &retValue);

    pfree(cStrValue);
    PG_FREE_IF_COPY(json, 0);

    if (convRes == ParseOK) {
        $left->pgReturnMacro(retValue);
    }

    if (convRes == ParseError)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type $left->pgName")
            )
        );
    }

    OUT_OF_RANGE_ERR($left->pgName);
}
C;
}

$header = <<<C
// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>

C;

/**
 * @param array<Type> $types
 */
function genJsonCasts(array $types): void
{
    global $header;

    $buf = $header . "\n\n";

    foreach ($types as $type) {
        $buf .= getCastToJSONFunc($type) . "\n\n";
    }

    file_put_contents("casts/json.c", $buf);
    echo "casts/json.c successfully generated\n";
}

/**
 * @param array<Type> $types
 */
function genJsonbCasts(array $types): void
{
    global $header;

    $buf = $header . "\n\n";

    foreach ($types as $type) {
        $buf .= getCastToJSONBFunc($type) . "\n\n";
    }

    file_put_contents("casts/jsonb.c", $buf);
    echo "casts/jsonb.c successfully generated\n";
}

/**
 * @param array<Type> $types
 */
function genNumericCasts(array $types): void
{
    global $header;

    $buf = $header . "\n\n";

    foreach ($types as $type) {
        $buf .= getCastToNumeric($type) . "\n\n";
    }

    file_put_contents("casts/numeric.c", $buf);
    echo "casts/numeric.c successfully generated\n";
}

/**
 * @param array<Type> $types
 */
function genFloat32Casts(array $types): void
{
    global $header;

    $buf = $header . "\n\n";

    foreach ($types as $type) {
        $buf .= getCastToFloat($type, FLOAT4) . "\n\n";
    }

    file_put_contents("casts/float4.c", $buf);
    echo "casts/float4.c successfully generated\n";
}

/**
 * @param array<Type> $types
 */
function genFloat64Casts(array $types): void
{
    global $header;

    $buf = $header . "\n\n";

    foreach ($types as $type) {
        $buf .= getCastToFloat($type, FLOAT8) . "\n\n";
    }

    file_put_contents("casts/float8.c", $buf);
    echo "casts/float8.c successfully generated\n";
}

@mkdir("casts");

/**
 * @var Type $LEFT_TYPE
 */
foreach (UINT_TYPES as $LEFT_TYPE) {
    $buf = $header;

    $buf .= "\n// Unsigned casts\n\n";

    foreach (UINT_TYPES as $RIGHT_TYPE) {
        if ($RIGHT_TYPE === $LEFT_TYPE) {
            continue;
        }

        $buf .= getCastUIntFromUIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    $buf .= "// Signed casts\n\n";

    foreach (INT_TYPES as $RIGHT_TYPE) {
        $buf .= getCastUIntFromIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    // Fast path for numeric casts for small ints
    if ($LEFT_TYPE->bitSize < 64) {
        $buf .= "// Numeric casts\n\n";
        $buf .= getCastFromNumeric($LEFT_TYPE) . "\n\n";
    }

    $buf .= "// Float casts\n\n";
    $buf .= getCastFromFloat($LEFT_TYPE, FLOAT4) . "\n\n";
    $buf .= getCastFromFloat($LEFT_TYPE, FLOAT8) . "\n\n";

    $buf .= "// JSON casts\n\n";

    $buf .= getCastFromJSONFunc($LEFT_TYPE) . "\n\n";
    $buf .= getCastFromJSONBFunc($LEFT_TYPE) . "\n\n";

    file_put_contents("casts/{$LEFT_TYPE->name}.c", $buf);
    echo "casts/{$LEFT_TYPE->name}.c successfully generated\n";
}

/**
 * @var Type $LEFT_TYPE
 */
foreach (INT_TYPES as $LEFT_TYPE) {
    $buf = $header;

    $buf .= "\n// Signed comparison\n\n";

    foreach (INT_TYPES as $RIGHT_TYPE) {
        if ($RIGHT_TYPE === $LEFT_TYPE) {
            continue;
        }

        $buf .= getCastIntFromIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    $buf .= "// Unsigned comparison\n\n";

    foreach (UINT_TYPES as $RIGHT_TYPE) {
        $buf .= getCastIntFromUIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    if (in_array($LEFT_TYPE, CUSTOM_INT_TYPES, true)) {
        if ($LEFT_TYPE->bitSize < 64) {
            $buf .= "// Numeric casts\n\n";
            $buf .= getCastFromNumeric($LEFT_TYPE) . "\n\n";
        }

        $buf .= "// Float casts\n\n";
        $buf .= getCastFromFloat($LEFT_TYPE, FLOAT4) . "\n\n";
        $buf .= getCastFromFloat($LEFT_TYPE, FLOAT8) . "\n\n";

        $buf .= "// JSON casts\n\n";

        $buf .= getCastFromJSONFunc($LEFT_TYPE) . "\n\n";
        $buf .= getCastFromJSONBFunc($LEFT_TYPE) . "\n\n";
    }

    file_put_contents("casts/{$LEFT_TYPE->name}.c", $buf);
    echo "casts/{$LEFT_TYPE->name}.c successfully generated\n";
}

$customCasts = [...UINT_TYPES, ...CUSTOM_INT_TYPES];
genJsonCasts($customCasts);
genJsonbCasts($customCasts);
genNumericCasts($customCasts);
genFloat32Casts($customCasts);
genFloat64Casts($customCasts);
