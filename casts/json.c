// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>


PG_FUNCTION_INFO_V1(json_from_uint1);
Datum json_from_uint1(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);
    char buf[UINT8_STRBUFLEN];

    char *bufPtr = uint8_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(json_from_uint2);
Datum json_from_uint2(PG_FUNCTION_ARGS) {
    uint16 a = PG_GETARG_UINT16(0);
    char buf[UINT16_STRBUFLEN];

    char *bufPtr = uint16_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(json_from_uint4);
Datum json_from_uint4(PG_FUNCTION_ARGS) {
    uint32 a = PG_GETARG_UINT32(0);
    char buf[UINT32_STRBUFLEN];

    char *bufPtr = uint32_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(json_from_uint8);
Datum json_from_uint8(PG_FUNCTION_ARGS) {
    uint64 a = PG_GETARG_UINT64(0);
    char buf[UINT64_STRBUFLEN];

    char *bufPtr = uint64_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(json_from_uint16);
Datum json_from_uint16(PG_FUNCTION_ARGS) {
    uint128 a = PG_GETARG_UINT128(0);
    char buf[UINT128_STRBUFLEN];

    char *bufPtr = uint128_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(json_from_int1);
Datum json_from_int1(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    char buf[INT8_STRBUFLEN];

    char *bufPtr = int8_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

PG_FUNCTION_INFO_V1(json_from_int16);
Datum json_from_int16(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);
    char buf[INT128_STRBUFLEN];

    char *bufPtr = int128_to_string(a, buf, sizeof(buf));

    /* json type in Postgres is really just text with json input cast */
    Datum result = DirectFunctionCall1(json_in, CStringGetDatum(bufPtr));

    PG_RETURN_DATUM(result);
}

