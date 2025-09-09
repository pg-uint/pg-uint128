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

function getCastUIntToIntFunc(Type $left, Type $right): string
{
    if (!$left->isUnsigned || $right->isUnsigned) {
        throw new InvalidArgumentException("Only cast uint to signed int is supported");
    }

    $funcName = "{$left->pgName}_to_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $left->name a = $left->pgGetArgMacro(0);\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($left->bitSize >= $right->bitSize) {
        $fn .= "    if (a > {$right->getMaxConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($right->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $right->pgReturnMacro(($right->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastIntToUIntFunc(Type $left, Type $right): string
{
    if ($left->isUnsigned || !$right->isUnsigned) {
        throw new InvalidArgumentException("Only cast signed int to uint is supported");
    }

    $funcName = "{$left->pgName}_to_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $left->name a = $left->pgGetArgMacro(0);\n";
    $fn .= "\n";
    $fn .= "    if (a < 0) {\n";
    $fn .= "        OUT_OF_RANGE_ERR($right->pgName);\n";
    $fn .= "    }\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($left->bitSize > $right->bitSize) {
        $fn .= "    if (a > {$right->getMaxConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($right->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $right->pgReturnMacro(($right->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastIntToIntFunc(Type $left, Type $right): string
{
    if ($left->isUnsigned || $right->isUnsigned) {
        throw new InvalidArgumentException("Only cast signed int to signed int is supported");
    }

    $funcName = "{$left->pgName}_to_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $left->name a = $left->pgGetArgMacro(0);\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($left->bitSize > $right->bitSize) {
        $fn .= "    if (a > {$right->getMaxConstC()} || a < {$right->getMinConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($right->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $right->pgReturnMacro(($right->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastUIntToUIntFunc(Type $left, Type $right): string
{
    if (!$left->isUnsigned || !$right->isUnsigned) {
        throw new InvalidArgumentException("Only cast uint to uint is supported");
    }

    $funcName = "{$left->pgName}_to_{$right->pgName}";

    $fn = "PG_FUNCTION_INFO_V1($funcName);\n";
    $fn .= "Datum $funcName(PG_FUNCTION_ARGS) {\n";
    $fn .= "    $left->name a = $left->pgGetArgMacro(0);\n";
    $fn .= "\n";

    // Check for overflow when casting wider integer types than receiver type
    if ($left->bitSize > $right->bitSize) {
        $fn .= "    if (a > {$right->getMaxConstC()}) {\n";
        $fn .= "        OUT_OF_RANGE_ERR($right->pgName);\n";
        $fn .= "    }\n";
    }

    $fn .= "    $right->pgReturnMacro(($right->name) a);\n";
    $fn .= "}\n";

    return $fn;
}

function getCastToJSONFunc(Type $left): string
{
    $right = JSON;

    $funcName = "{$left->pgName}_to_{$right->pgName}";

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

function getCastToJSONBFunc(Type $left): string {
    $right = JSONB;

    $funcName = "{$left->pgName}_to_{$right->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum {$funcName}(PG_FUNCTION_ARGS) {
    $left->name val = $left->pgGetArgMacro(0);
    JsonbValue jbv;
    Jsonb* result;

    /* convert to Numeric using your internal function */
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

function getCastFromJSONBFunc(Type $left): string {
    $right = JSONB;

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
    Jsonb* in = PG_GETARG_JSONB_P(0);
    JsonbValue v;
    char* cStrValue;
    int convRes;
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
    // Syntax error
    if (convRes == -1)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type {$left->pgName}: \"%s\"", cStrValue)
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
                errmsg("{$left->pgName} out of range: %s", cStrValue)
            )
        );
    }

    pfree(cStrValue);

    PG_FREE_IF_COPY(in, 0);

    $left->pgReturnMacro(retValue);
}
C;
}

function getCastFromJSONFunc(Type $left): string {
    $right = JSON;

    $funcName = "{$left->pgName}_from_{$right->pgName}";

    return <<<C
PG_FUNCTION_INFO_V1($funcName);
Datum $funcName(PG_FUNCTION_ARGS)
{
    text* in = PG_GETARG_TEXT_PP(0);
    char* cStrValue;
    $left->name retValue = 0;
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
                    errmsg("cannot cast json type to type $left->pgName")));
    }

    /* Convert the text to C string */
    cStrValue = text_to_cstring(in);
    convRes = parse_{$left->name}(cStrValue, &retValue);

    pfree(cStrValue);
    PG_FREE_IF_COPY(in, 0);

    if (convRes == -1)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type $left->pgName")
            )
        );
    }

    if (convRes == -2)
    {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                errmsg("$left->pgName out of range")
            )
        );
    }

    $left->pgReturnMacro(retValue);
}
C;
}

$header = <<<C
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

C;

@mkdir("casts");

foreach (UINT_TYPES as $LEFT_TYPE) {
    $buf = $header;

    $buf .= "\n// Unsigned casts\n\n";

    foreach (UINT_TYPES as $RIGHT_TYPE) {
        if ($RIGHT_TYPE === $LEFT_TYPE) {
            continue;
        }

        $buf .= getCastUIntFromUIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
        $buf .= getCastUIntToUIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    $buf .= "// Signed casts\n\n";

    foreach (INT_TYPES as $RIGHT_TYPE) {
        $buf .= getCastUIntFromIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
        $buf .= getCastUIntToIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    $buf .= "// JSON casts\n\n";

    $buf .= getCastToJSONFunc($LEFT_TYPE) . "\n\n";
    $buf .= getCastToJSONBFunc($LEFT_TYPE) . "\n\n";
    $buf .= getCastFromJSONFunc($LEFT_TYPE) . "\n\n";
    $buf .= getCastFromJSONBFunc($LEFT_TYPE) . "\n\n";

    file_put_contents("casts/{$LEFT_TYPE->name}.c", $buf);
    echo "casts/{$LEFT_TYPE->name}.c successfully generated\n";
}

foreach (INT_TYPES as $LEFT_TYPE) {
    $buf = $header;

    $buf .= "\n// Signed comparison\n\n";

    foreach (INT_TYPES as $RIGHT_TYPE) {
        if ($RIGHT_TYPE === $LEFT_TYPE) {
            continue;
        }

        $buf .= getCastIntFromIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
        $buf .= getCastIntToIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    $buf .= "// Unsigned comparison\n\n";

    foreach (UINT_TYPES as $RIGHT_TYPE) {
        $buf .= getCastIntFromUIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
        $buf .= getCastIntToUIntFunc($LEFT_TYPE, $RIGHT_TYPE) . "\n\n";
    }

    if (in_array($LEFT_TYPE, CUSTOM_INT_TYPES, true)) {
        $buf .= "// JSON casts\n\n";

        $buf .= getCastToJSONFunc($LEFT_TYPE) . "\n\n";
        $buf .= getCastToJSONBFunc($LEFT_TYPE) . "\n\n";
        $buf .= getCastFromJSONFunc($LEFT_TYPE) . "\n\n";
        $buf .= getCastFromJSONBFunc($LEFT_TYPE) . "\n\n";
    }

    file_put_contents("casts/{$LEFT_TYPE->name}.c", $buf);
    echo "casts/{$LEFT_TYPE->name}.c successfully generated\n";
}
