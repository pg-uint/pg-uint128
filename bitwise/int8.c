// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"

PG_FUNCTION_INFO_V1(int1_and);
Datum int1_and(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    int8 b = PG_GETARG_INT8(1);
    PG_RETURN_INT8(a & b);
}


PG_FUNCTION_INFO_V1(int1_or);
Datum int1_or(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    int8 b = PG_GETARG_INT8(1);
    PG_RETURN_INT8(a | b);
}


PG_FUNCTION_INFO_V1(int1_xor);
Datum int1_xor(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    int8 b = PG_GETARG_INT8(1);
    PG_RETURN_INT8(a ^ b);
}


PG_FUNCTION_INFO_V1(int1_not);
Datum int1_not(PG_FUNCTION_ARGS) {
    PG_RETURN_INT8(~(PG_GETARG_INT8(0)));
}


PG_FUNCTION_INFO_V1(int1_shl);
Datum int1_shl(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    int32 shift = PG_GETARG_INT32(1);
    PG_RETURN_INT8(a << shift);
}


PG_FUNCTION_INFO_V1(int1_shr);
Datum int1_shr(PG_FUNCTION_ARGS) {
    int8 a = PG_GETARG_INT8(0);
    int32 shift = PG_GETARG_INT32(1);
    PG_RETURN_INT8(a >> shift);
}


