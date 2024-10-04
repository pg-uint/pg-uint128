// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"

// Unsigned comparison

PG_FUNCTION_INFO_V1(uint2_eq_uint2);
Datum uint2_eq_uint2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint16 b = PG_GETARG_UINT16(1);
    PG_RETURN_BOOL(a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_uint2);
Datum uint2_ne_uint2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint16 b = PG_GETARG_UINT16(1);
    PG_RETURN_BOOL(a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_uint2);
Datum uint2_gt_uint2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint16 b = PG_GETARG_UINT16(1);
    PG_RETURN_BOOL(a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_uint2);
Datum uint2_lt_uint2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint16 b = PG_GETARG_UINT16(1);
    PG_RETURN_BOOL(a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_uint2);
Datum uint2_ge_uint2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint16 b = PG_GETARG_UINT16(1);
    PG_RETURN_BOOL(a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_uint2);
Datum uint2_le_uint2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint16 b = PG_GETARG_UINT16(1);
    PG_RETURN_BOOL(a <= b);
}


PG_FUNCTION_INFO_V1(uint2_eq_uint4);
Datum uint2_eq_uint4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint32 b = PG_GETARG_UINT32(1);
    PG_RETURN_BOOL((uint32)a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_uint4);
Datum uint2_ne_uint4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint32 b = PG_GETARG_UINT32(1);
    PG_RETURN_BOOL((uint32)a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_uint4);
Datum uint2_gt_uint4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint32 b = PG_GETARG_UINT32(1);
    PG_RETURN_BOOL((uint32)a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_uint4);
Datum uint2_lt_uint4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint32 b = PG_GETARG_UINT32(1);
    PG_RETURN_BOOL((uint32)a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_uint4);
Datum uint2_ge_uint4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint32 b = PG_GETARG_UINT32(1);
    PG_RETURN_BOOL((uint32)a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_uint4);
Datum uint2_le_uint4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint32 b = PG_GETARG_UINT32(1);
    PG_RETURN_BOOL((uint32)a <= b);
}


PG_FUNCTION_INFO_V1(uint2_eq_uint8);
Datum uint2_eq_uint8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint64 b = PG_GETARG_UINT64(1);
    PG_RETURN_BOOL((uint64)a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_uint8);
Datum uint2_ne_uint8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint64 b = PG_GETARG_UINT64(1);
    PG_RETURN_BOOL((uint64)a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_uint8);
Datum uint2_gt_uint8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint64 b = PG_GETARG_UINT64(1);
    PG_RETURN_BOOL((uint64)a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_uint8);
Datum uint2_lt_uint8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint64 b = PG_GETARG_UINT64(1);
    PG_RETURN_BOOL((uint64)a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_uint8);
Datum uint2_ge_uint8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint64 b = PG_GETARG_UINT64(1);
    PG_RETURN_BOOL((uint64)a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_uint8);
Datum uint2_le_uint8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint64 b = PG_GETARG_UINT64(1);
    PG_RETURN_BOOL((uint64)a <= b);
}


PG_FUNCTION_INFO_V1(uint2_eq_uint16);
Datum uint2_eq_uint16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint128 b = PG_GETARG_UINT128(1);
    PG_RETURN_BOOL((uint128)a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_uint16);
Datum uint2_ne_uint16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint128 b = PG_GETARG_UINT128(1);
    PG_RETURN_BOOL((uint128)a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_uint16);
Datum uint2_gt_uint16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint128 b = PG_GETARG_UINT128(1);
    PG_RETURN_BOOL((uint128)a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_uint16);
Datum uint2_lt_uint16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint128 b = PG_GETARG_UINT128(1);
    PG_RETURN_BOOL((uint128)a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_uint16);
Datum uint2_ge_uint16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint128 b = PG_GETARG_UINT128(1);
    PG_RETURN_BOOL((uint128)a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_uint16);
Datum uint2_le_uint16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const uint128 b = PG_GETARG_UINT128(1);
    PG_RETURN_BOOL((uint128)a <= b);
}


// Signed comparison

PG_FUNCTION_INFO_V1(uint2_eq_int2);
Datum uint2_eq_int2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int16 b = PG_GETARG_INT16(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL(a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_int2);
Datum uint2_ne_int2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int16 b = PG_GETARG_INT16(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL(a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_int2);
Datum uint2_gt_int2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int16 b = PG_GETARG_INT16(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL(a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_int2);
Datum uint2_lt_int2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int16 b = PG_GETARG_INT16(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL(a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_int2);
Datum uint2_ge_int2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int16 b = PG_GETARG_INT16(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL(a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_int2);
Datum uint2_le_int2(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int16 b = PG_GETARG_INT16(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL(a <= b);
}


PG_FUNCTION_INFO_V1(uint2_eq_int4);
Datum uint2_eq_int4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int32 b = PG_GETARG_INT32(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int32)a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_int4);
Datum uint2_ne_int4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int32 b = PG_GETARG_INT32(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int32)a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_int4);
Datum uint2_gt_int4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int32 b = PG_GETARG_INT32(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int32)a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_int4);
Datum uint2_lt_int4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int32 b = PG_GETARG_INT32(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int32)a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_int4);
Datum uint2_ge_int4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int32 b = PG_GETARG_INT32(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int32)a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_int4);
Datum uint2_le_int4(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int32 b = PG_GETARG_INT32(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int32)a <= b);
}


PG_FUNCTION_INFO_V1(uint2_eq_int8);
Datum uint2_eq_int8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int64 b = PG_GETARG_INT64(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int64)a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_int8);
Datum uint2_ne_int8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int64 b = PG_GETARG_INT64(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int64)a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_int8);
Datum uint2_gt_int8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int64 b = PG_GETARG_INT64(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int64)a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_int8);
Datum uint2_lt_int8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int64 b = PG_GETARG_INT64(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int64)a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_int8);
Datum uint2_ge_int8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int64 b = PG_GETARG_INT64(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int64)a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_int8);
Datum uint2_le_int8(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int64 b = PG_GETARG_INT64(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int64)a <= b);
}


PG_FUNCTION_INFO_V1(uint2_eq_int16);
Datum uint2_eq_int16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int128 b = PG_GETARG_INT128(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int128)a == b);
}


PG_FUNCTION_INFO_V1(uint2_ne_int16);
Datum uint2_ne_int16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int128 b = PG_GETARG_INT128(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int128)a != b);
}


PG_FUNCTION_INFO_V1(uint2_gt_int16);
Datum uint2_gt_int16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int128 b = PG_GETARG_INT128(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int128)a > b);
}


PG_FUNCTION_INFO_V1(uint2_lt_int16);
Datum uint2_lt_int16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int128 b = PG_GETARG_INT128(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int128)a < b);
}


PG_FUNCTION_INFO_V1(uint2_ge_int16);
Datum uint2_ge_int16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int128 b = PG_GETARG_INT128(1);
    if (b < 0) {
        PG_RETURN_BOOL(true);
    }
    PG_RETURN_BOOL((int128)a >= b);
}


PG_FUNCTION_INFO_V1(uint2_le_int16);
Datum uint2_le_int16(PG_FUNCTION_ARGS)
{
    const uint16 a = PG_GETARG_UINT16(0);
    const int128 b = PG_GETARG_INT128(1);
    if (b < 0) {
        PG_RETURN_BOOL(false);
    }
    PG_RETURN_BOOL((int128)a <= b);
}


