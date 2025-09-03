#include "postgres.h"
#include "fmgr.h"
#include <access/hash.h>
#include "lib/stringinfo.h"
#include <libpq/pqformat.h>
#include "int_utils.h"
#include "int8.h"

PG_FUNCTION_INFO_V1(int1_in);
PG_FUNCTION_INFO_V1(int1_out);
PG_FUNCTION_INFO_V1(int1_send);
PG_FUNCTION_INFO_V1(int1_recv);

PG_FUNCTION_INFO_V1(int1_cmp);
PG_FUNCTION_INFO_V1(int1_hash);

// Serialization ops

Datum int1_in(PG_FUNCTION_ARGS)
{
    char *num_str = PG_GETARG_CSTRING(0);
    int8 num = 0;

    if (num_str == NULL)
        elog(ERROR, "NULL pointer");

    if (*num_str == 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type %s: \"%s\"", "int1", num_str)
            )
        );
    }

    // elog(INFO, "int1in num_str: %s", num_str);

    if (parse_int8(num_str, &num) != 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type %s: \"%s\"", "int1", num_str)
            )
        );
    }

    PG_RETURN_INT8(num);
}

Datum int1_out(PG_FUNCTION_ARGS)
{
    char buf[INT8_STRBUFLEN];

    int8 num = PG_GETARG_INT8(0);

    char *bufPtr = int8_to_string(num, buf, sizeof(buf));

    PG_RETURN_CSTRING(pstrdup(bufPtr));
}

/*
 *		int1recv			- converts external binary format to int1
 */
Datum int1_recv(PG_FUNCTION_ARGS)
{
    int8 result = 0;

    StringInfo buf = (StringInfo) PG_GETARG_POINTER(0);

    result = (int8)pq_getmsgint(buf, 1);

    PG_RETURN_INT8(result);
}

/*
 *		int1send			- converts int1 to binary format
 */
Datum int1_send(PG_FUNCTION_ARGS)
{
    StringInfoData buf;
    int8 arg1 = PG_GETARG_INT8(0);

    pq_begintypsend(&buf);
    pq_sendint8(&buf, arg1);
    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

/* handler for btree index operator */
Datum int1_cmp(PG_FUNCTION_ARGS)
{
    int8 arg1 = PG_GETARG_INT8(0);
    int8 arg2 = PG_GETARG_INT8(1);

    PG_RETURN_INT32(int8_internal_cmp(arg1, arg2));
}

// Hashing ops

Datum int1_hash(PG_FUNCTION_ARGS)
{
    int8 val = PG_GETARG_INT8(0);

    PG_RETURN_UINT64(hash_uint32(val));
}
