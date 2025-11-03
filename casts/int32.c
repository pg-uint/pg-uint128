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

PG_FUNCTION_INFO_V1(int4_from_int1);
Datum int4_from_int1(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);

    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_int2);
Datum int4_from_int2(PG_FUNCTION_ARGS) {
    int16 a = PG_GETARG_INT16(0);

    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_int8);
Datum int4_from_int8(PG_FUNCTION_ARGS) {
    int64 a = PG_GETARG_INT64(0);

    if (a > INT32_MAX || a < INT32_MIN) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_int16);
Datum int4_from_int16(PG_FUNCTION_ARGS) {
    int128 a = PG_GETARG_INT128(0);

    if (a > INT32_MAX || a < INT32_MIN) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32((int32) a);
}


// Unsigned comparison

PG_FUNCTION_INFO_V1(int4_from_uint1);
Datum int4_from_uint1(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);

    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_uint2);
Datum int4_from_uint2(PG_FUNCTION_ARGS) {
    uint16 a = PG_GETARG_UINT16(0);

    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_uint4);
Datum int4_from_uint4(PG_FUNCTION_ARGS) {
    uint32 a = PG_GETARG_UINT32(0);

    if (a > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_uint8);
Datum int4_from_uint8(PG_FUNCTION_ARGS) {
    uint64 a = PG_GETARG_UINT64(0);

    if (a > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32((int32) a);
}


PG_FUNCTION_INFO_V1(int4_from_uint16);
Datum int4_from_uint16(PG_FUNCTION_ARGS) {
    uint128 a = PG_GETARG_UINT128(0);

    if (a > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32((int32) a);
}


