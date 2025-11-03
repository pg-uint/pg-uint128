// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>

// Signed comparison

PG_FUNCTION_INFO_V1(int8_from_int1);
Datum int8_from_int1(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_int2);
Datum int8_from_int2(PG_FUNCTION_ARGS) {
    int16 a = PG_GETARG_INT16(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_int4);
Datum int8_from_int4(PG_FUNCTION_ARGS) {
    int32 a = PG_GETARG_INT32(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_int16);
Datum int8_from_int16(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT64_MAX || a < INT64_MIN) {
        OUT_OF_RANGE_ERR(int8);
    }
    PG_RETURN_INT64((int64) a);
}


// Unsigned comparison

PG_FUNCTION_INFO_V1(int8_from_uint1);
Datum int8_from_uint1(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_uint2);
Datum int8_from_uint2(PG_FUNCTION_ARGS) {
    uint16 a = PG_GETARG_UINT16(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_uint4);
Datum int8_from_uint4(PG_FUNCTION_ARGS) {
    uint32 a = PG_GETARG_UINT32(0);

    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_uint8);
Datum int8_from_uint8(PG_FUNCTION_ARGS) {
    uint64 a = PG_GETARG_UINT64(0);

    if (a > INT64_MAX) {
        OUT_OF_RANGE_ERR(int8);
    }
    PG_RETURN_INT64((int64) a);
}


PG_FUNCTION_INFO_V1(int8_from_uint16);
Datum int8_from_uint16(PG_FUNCTION_ARGS) {
    uint128 a = PG_GETARG_UINT128(0);

    if (a > INT64_MAX) {
        OUT_OF_RANGE_ERR(int8);
    }
    PG_RETURN_INT64((int64) a);
}


