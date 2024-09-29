#include "postgres.h"
#include "fmgr.h"
#include "utils/builtins.h"
#include "utils/uuid.h"
#include "utils/numeric.h"
#include "utils/memutils.h"
#include <access/hash.h>
#include "lib/stringinfo.h"
#include <libpq/pqformat.h>
#include <stdint.h>
#include "uint_utils.h"

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

Datum uint16_in(PG_FUNCTION_ARGS);
Datum uint16_out(PG_FUNCTION_ARGS);

Datum uint16_send(PG_FUNCTION_ARGS);
Datum uint16_recv(PG_FUNCTION_ARGS);

Datum uint16_eq(PG_FUNCTION_ARGS);
Datum uint16_ne(PG_FUNCTION_ARGS);
Datum uint16_lt(PG_FUNCTION_ARGS);
Datum uint16_gt(PG_FUNCTION_ARGS);
Datum uint16_le(PG_FUNCTION_ARGS);
Datum uint16_ge(PG_FUNCTION_ARGS);

Datum uint16_cmp(PG_FUNCTION_ARGS);
static int uint128_internal_cmp(const uint128 *arg1, const uint128 *arg2);

Datum uint16_hash(PG_FUNCTION_ARGS);
Datum hashuint8(uint64);

Datum uint16_add(PG_FUNCTION_ARGS);
Datum uint16_sub(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(uint16_in);
PG_FUNCTION_INFO_V1(uint16_out);
PG_FUNCTION_INFO_V1(uint16_send);
PG_FUNCTION_INFO_V1(uint16_recv);

PG_FUNCTION_INFO_V1(uint16_eq);
PG_FUNCTION_INFO_V1(uint16_ne);
PG_FUNCTION_INFO_V1(uint16_lt);
PG_FUNCTION_INFO_V1(uint16_gt);
PG_FUNCTION_INFO_V1(uint16_le);
PG_FUNCTION_INFO_V1(uint16_ge);

PG_FUNCTION_INFO_V1(uint16_cmp);
PG_FUNCTION_INFO_V1(uint16_hash);

PG_FUNCTION_INFO_V1(uint16_add);
PG_FUNCTION_INFO_V1(uint16_sub);

Datum uint16_in(PG_FUNCTION_ARGS)
{
	char	   *num_str = PG_GETARG_CSTRING(0);
	uint128    *num;

    if (num_str == NULL)
		elog(ERROR, "NULL pointer");

    if (*num_str == 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type %s: \"%s\"", "uint16", num_str)
            )
        );
    }

    // elog(INFO, "uint16in num_str: %s", num_str);

	num = (uint128*)palloc(sizeof(uint128));
    *num = 0;

    if (parse_uint128(num_str, num) != 0) {
        pfree(num);

        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type %s: \"%s\"", "uint16", num_str)
            )
        );
    }

    // elog(INFO, "uint16in high %llu low %llu", (uint64)((*num) >> 64), (uint64)low_part);

	PG_RETURN_Uint128_P(num);
}

Datum uint16_out(PG_FUNCTION_ARGS)
{
	uint128  *num = PG_GETARG_Uint128_P(0);
    char     *buf;
    char     *bufPtr;
    char     *str;

    if (num == NULL)
		elog(ERROR, "NULL pointer");

    // elog(INFO, "uint16out high %llu low %llu", (uint64)((*num) >> 64), (uint64)(*num));

    buf = (char*)palloc(41);

    bufPtr = uint128_to_string_v2(*num, buf, 41);

    // elog(INFO, "uint16out buf (%p) bufPtr (%p): %s", buf, bufPtr, bufPtr);

    str = (char*)palloc(strlen(bufPtr));
    strcpy(str, bufPtr);

    pfree(buf);

    // elog(INFO, "uint16out str: %s", str);

	PG_RETURN_CSTRING(str);
}

/*
 *		uint16recv			- converts external binary format to uint16
 */
Datum uint16_recv(PG_FUNCTION_ARGS)
{
    uint128* result;
    uint64 high_part, low_part;

	StringInfo	buf = (StringInfo)PG_GETARG_POINTER(0);

    // Read the high 64 bits from the buffer
    high_part = pq_getmsgint64(buf);
    // Read the low 64 bits from the buffer
    low_part = pq_getmsgint64(buf);

    result = (uint128*)palloc(sizeof(uint128));

    // Combine the two 64-bit parts into a 128-bit value
    *result = ((uint128)high_part << 64) | (uint128)low_part;

	PG_RETURN_Uint128_P(result);
}

/*
 *		uint16send			- converts uint16 to binary format
 */
Datum uint16_send(PG_FUNCTION_ARGS)
{
    StringInfoData buf;
	uint128* arg1 = PG_GETARG_Uint128_P(0);

	pq_begintypsend(&buf);
	pq_sendint64(&buf, (uint64)((*arg1) >> 64)); // Extract the high 64 bits
	pq_sendint64(&buf, (uint64)(*arg1));         // Extract the low 64 bits
	PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

Datum uint16_eq(PG_FUNCTION_ARGS)
{
	uint128		*val1 = PG_GETARG_Uint128_P(0);
    uint128		*val2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_BOOL(*val1 == *val2);
}

Datum uint16_ne(PG_FUNCTION_ARGS)
{
	uint128		*val1 = PG_GETARG_Uint128_P(0);
	uint128		*val2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_BOOL(*val1 != *val2);
}

Datum uint16_lt(PG_FUNCTION_ARGS)
{
	uint128		*val1 = PG_GETARG_Uint128_P(0);
	uint128		*val2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_BOOL(*val1 < *val2);
}

Datum uint16_gt(PG_FUNCTION_ARGS)
{
	uint128		*val1 = PG_GETARG_Uint128_P(0);
	uint128		*val2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_BOOL(*val1 > *val2);
}

Datum uint16_le(PG_FUNCTION_ARGS)
{
	uint128		*val1 = PG_GETARG_Uint128_P(0);
	uint128		*val2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_BOOL(*val1 <= *val2);
}

Datum uint16_ge(PG_FUNCTION_ARGS)
{
	uint128		*val1 = PG_GETARG_Uint128_P(0);
	uint128		*val2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_BOOL(*val1 >= *val2);
}

/* handler for btree index operator */
Datum uint16_cmp(PG_FUNCTION_ARGS)
{
	uint128  *arg1 = PG_GETARG_Uint128_P(0);
	uint128  *arg2 = PG_GETARG_Uint128_P(1);

	PG_RETURN_INT32(uint128_internal_cmp(arg1, arg2));
}

static int uint128_internal_cmp(const uint128 *arg1, const uint128 *arg2)
{
    if (*arg1 < *arg2) return -1; // arg1 is less than arg2
    if (*arg1 > *arg2) return 1;  // arg1 is greater than arg2

    return 0;                     // arg1 is equal to arg2
}

Datum uint16_hash(PG_FUNCTION_ARGS)
{
    uint128* val = PG_GETARG_Uint128_P(0);
    uint64 high = (uint64)(*val >> 64);
    uint64 low = (uint64)(*val);

    PG_RETURN_UINT64(
        hash_combine(
            DatumGetUInt32(hashuint8(high)),
            DatumGetUInt32(hashuint8(low))
        )
    );
}

Datum hashuint8(uint64 val)
{
	uint32		lohalf = (uint32) val;
	uint32		hihalf = (uint32) (val >> 32);

	lohalf ^= hihalf;

	return hash_uint32(lohalf);
}

#define INT128_MAX (__int128) (((unsigned __int128) 1 << ((__SIZEOF_INT128__ * __CHAR_BIT__) - 1)) - 1)
#define INT128_MIN (-INT128_MAX - 1)
#define UINT128_MAX ((2 * (unsigned __int128) INT128_MAX) + 1)

Datum uint16_add(PG_FUNCTION_ARGS)
{
	uint128		*a = PG_GETARG_Uint128_P(0);
	uint128		*b = PG_GETARG_Uint128_P(1);
	uint128		*result;

    // Check for overflow
    if (*a > UINT128_MAX - *b) {
        ereport(ERROR,
            (
                errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                errmsg("uint16 out of range")
            )
        );
    }

    result = (uint128*)palloc(sizeof(uint128));
    *result = *a + *b;

    PG_RETURN_Uint128_P(result);
}

Datum uint16_sub(PG_FUNCTION_ARGS)
{
	uint128		*a = PG_GETARG_Uint128_P(0);
	uint128		*b = PG_GETARG_Uint128_P(1);
	uint128		*result;

    // Check for overflow
    if (*b > *a) {
        ereport(ERROR,
            (
                errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                errmsg("uint16 out of range")
            )
        );
    }

    result = (uint128*)palloc(sizeof(uint128));
    *result = *a - *b;

    PG_RETURN_Uint128_P(result);
}
