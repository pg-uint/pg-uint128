// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"

// INT with INT (signed) arithmetic funcs

PG_FUNCTION_INFO_V1(int4_add_int1);
Datum int4_add_int1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int8 b = PG_GETARG_INT8(1);
    int32 result = 0;
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_int1);
Datum int4_sub_int1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int8 b = PG_GETARG_INT8(1);
    int32 result = 0;
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_int1);
Datum int4_mul_int1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int8 b = PG_GETARG_INT8(1);
    int32 result = 0;
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_int1);
Datum int4_div_int1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int8 b = PG_GETARG_INT8(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_int1);
Datum int4_mod_int1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int8 b = PG_GETARG_INT8(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32(a % (int32)b);
}


PG_FUNCTION_INFO_V1(int4_add_int2);
Datum int4_add_int2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int16 b = PG_GETARG_INT16(1);
    int32 result = 0;
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_int2);
Datum int4_sub_int2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int16 b = PG_GETARG_INT16(1);
    int32 result = 0;
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_int2);
Datum int4_mul_int2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int16 b = PG_GETARG_INT16(1);
    int32 result = 0;
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_int2);
Datum int4_div_int2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int16 b = PG_GETARG_INT16(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_int2);
Datum int4_mod_int2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int16 b = PG_GETARG_INT16(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32(a % (int32)b);
}


PG_FUNCTION_INFO_V1(int4_add_int4);
Datum int4_add_int4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int32 b = PG_GETARG_INT32(1);
    int32 result = 0;
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_int4);
Datum int4_sub_int4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int32 b = PG_GETARG_INT32(1);
    int32 result = 0;
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_int4);
Datum int4_mul_int4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int32 b = PG_GETARG_INT32(1);
    int32 result = 0;
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_int4);
Datum int4_div_int4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int32 b = PG_GETARG_INT32(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32(a / b);
}


PG_FUNCTION_INFO_V1(int4_mod_int4);
Datum int4_mod_int4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int32 b = PG_GETARG_INT32(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32(a % b);
}


PG_FUNCTION_INFO_V1(int4_add_int8);
Datum int4_add_int8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int64 b = PG_GETARG_INT64(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_int8);
Datum int4_sub_int8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int64 b = PG_GETARG_INT64(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_int8);
Datum int4_mul_int8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int64 b = PG_GETARG_INT64(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_int8);
Datum int4_div_int8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int64 b = PG_GETARG_INT64(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32((int64)a / b);
}


PG_FUNCTION_INFO_V1(int4_mod_int8);
Datum int4_mod_int8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int64 b = PG_GETARG_INT64(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32((int64)a % b);
}


PG_FUNCTION_INFO_V1(int4_add_int16);
Datum int4_add_int16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int128 b = PG_GETARG_INT128(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_int16);
Datum int4_sub_int16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int128 b = PG_GETARG_INT128(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_int16);
Datum int4_mul_int16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int128 b = PG_GETARG_INT128(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_int16);
Datum int4_div_int16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int128 b = PG_GETARG_INT128(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32((int128)a / b);
}


PG_FUNCTION_INFO_V1(int4_mod_int16);
Datum int4_mod_int16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    int128 b = PG_GETARG_INT128(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    PG_RETURN_INT32((int128)a % b);
}



// Mixed sign, signed INT with UINT arithmetic funcs

PG_FUNCTION_INFO_V1(int4_add_uint1);
Datum int4_add_uint1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint8 b = PG_GETARG_UINT8(1);
    int32 result = 0;
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_uint1);
Datum int4_sub_uint1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint8 b = PG_GETARG_UINT8(1);
    int32 result = 0;
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_uint1);
Datum int4_mul_uint1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint8 b = PG_GETARG_UINT8(1);
    int32 result = 0;
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_uint1);
Datum int4_div_uint1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint8 b = PG_GETARG_UINT8(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0) {
        PG_RETURN_INT32(0);
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_uint1);
Datum int4_mod_uint1(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint8 b = PG_GETARG_UINT8(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0) {
        PG_RETURN_INT32(a);
    }
    PG_RETURN_INT32(a % (int32)b);
}


PG_FUNCTION_INFO_V1(int4_add_uint2);
Datum int4_add_uint2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint16 b = PG_GETARG_UINT16(1);
    int32 result = 0;
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_uint2);
Datum int4_sub_uint2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint16 b = PG_GETARG_UINT16(1);
    int32 result = 0;
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_uint2);
Datum int4_mul_uint2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint16 b = PG_GETARG_UINT16(1);
    int32 result = 0;
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_uint2);
Datum int4_div_uint2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint16 b = PG_GETARG_UINT16(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0) {
        PG_RETURN_INT32(0);
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_uint2);
Datum int4_mod_uint2(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint16 b = PG_GETARG_UINT16(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0) {
        PG_RETURN_INT32(a);
    }
    PG_RETURN_INT32(a % (int32)b);
}


PG_FUNCTION_INFO_V1(int4_add_uint4);
Datum int4_add_uint4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint32 b = PG_GETARG_UINT32(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_uint4);
Datum int4_sub_uint4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint32 b = PG_GETARG_UINT32(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_uint4);
Datum int4_mul_uint4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint32 b = PG_GETARG_UINT32(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_uint4);
Datum int4_div_uint4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint32 b = PG_GETARG_UINT32(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0 || b > INT32_MAX) {
        PG_RETURN_INT32(0);
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_uint4);
Datum int4_mod_uint4(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint32 b = PG_GETARG_UINT32(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0 || b > INT32_MAX) {
        PG_RETURN_INT32(a);
    }
    PG_RETURN_INT32(a % (int32)b);
}


PG_FUNCTION_INFO_V1(int4_add_uint8);
Datum int4_add_uint8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint64 b = PG_GETARG_UINT64(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_uint8);
Datum int4_sub_uint8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint64 b = PG_GETARG_UINT64(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_uint8);
Datum int4_mul_uint8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint64 b = PG_GETARG_UINT64(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_uint8);
Datum int4_div_uint8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint64 b = PG_GETARG_UINT64(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0 || b > INT32_MAX) {
        PG_RETURN_INT32(0);
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_uint8);
Datum int4_mod_uint8(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint64 b = PG_GETARG_UINT64(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0 || b > INT32_MAX) {
        PG_RETURN_INT32(a);
    }
    PG_RETURN_INT32(a % (int32)b);
}


PG_FUNCTION_INFO_V1(int4_add_uint16);
Datum int4_add_uint16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint128 b = PG_GETARG_UINT128(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (add_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_sub_uint16);
Datum int4_sub_uint16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint128 b = PG_GETARG_UINT128(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (sub_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_mul_uint16);
Datum int4_mul_uint16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint128 b = PG_GETARG_UINT128(1);
    int32 result = 0;
    if (b > INT32_MAX) {
        OUT_OF_RANGE_ERR(int4);
    }
    if (mul_s32_overflow(a, b, &result)) {
        OUT_OF_RANGE_ERR(int4);
    }
    PG_RETURN_INT32(result);
}


PG_FUNCTION_INFO_V1(int4_div_uint16);
Datum int4_div_uint16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint128 b = PG_GETARG_UINT128(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0 || b > INT32_MAX) {
        PG_RETURN_INT32(0);
    }
    PG_RETURN_INT32(a / (int32)b);
}


PG_FUNCTION_INFO_V1(int4_mod_uint16);
Datum int4_mod_uint16(PG_FUNCTION_ARGS)
{
    int32 a = PG_GETARG_INT32(0);
    uint128 b = PG_GETARG_UINT128(1);
    if (b == 0) {
        DIVISION_BY_ZERO_ERR;
    }
    if (a < 0 || b > INT32_MAX) {
        PG_RETURN_INT32(a);
    }
    PG_RETURN_INT32(a % (int32)b);
}


