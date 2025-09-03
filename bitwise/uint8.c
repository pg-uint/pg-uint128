// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"

PG_FUNCTION_INFO_V1(uint1_and);
Datum uint1_and(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);
    uint8 b = PG_GETARG_UINT8(1);
    PG_RETURN_UINT8(a & b);
}


PG_FUNCTION_INFO_V1(uint1_or);
Datum uint1_or(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);
    uint8 b = PG_GETARG_UINT8(1);
    PG_RETURN_UINT8(a | b);
}


PG_FUNCTION_INFO_V1(uint1_xor);
Datum uint1_xor(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);
    uint8 b = PG_GETARG_UINT8(1);
    PG_RETURN_UINT8(a ^ b);
}


PG_FUNCTION_INFO_V1(uint1_not);
Datum uint1_not(PG_FUNCTION_ARGS) {
    PG_RETURN_UINT8(~(PG_GETARG_UINT8(0)));
}


PG_FUNCTION_INFO_V1(uint1_shl);
Datum uint1_shl(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);
    int32 shift = PG_GETARG_INT32(1);
    PG_RETURN_UINT8(a << shift);
}


PG_FUNCTION_INFO_V1(uint1_shr);
Datum uint1_shr(PG_FUNCTION_ARGS) {
    uint8 a = PG_GETARG_UINT8(0);
    int32 shift = PG_GETARG_INT32(1);
    PG_RETURN_UINT8(a >> shift);
}


