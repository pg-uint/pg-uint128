#include "postgres.h"
#include "fmgr.h"
#include <access/hash.h>
#include "lib/stringinfo.h"
#include <libpq/pqformat.h>
#include "uint_utils.h"
#include "uint8.h"

PG_FUNCTION_INFO_V1(uint1_in);
PG_FUNCTION_INFO_V1(uint1_out);
PG_FUNCTION_INFO_V1(uint1_send);
PG_FUNCTION_INFO_V1(uint1_recv);

PG_FUNCTION_INFO_V1(uint1_cmp);
PG_FUNCTION_INFO_V1(uint1_hash);

// Serialization ops

Datum uint1_in(PG_FUNCTION_ARGS)
{
    char *num_str = PG_GETARG_CSTRING(0);
    uint8 num = 0;

    if (num_str == NULL)
        elog(ERROR, "NULL pointer");

    if (*num_str == 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type %s: \"%s\"", "uint1", num_str)
            )
        );
    }

    if (parse_uint8(num_str, &num) != 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type %s: \"%s\"", "uint1", num_str)
            )
        );
    }

    PG_RETURN_UINT8(num);
}

Datum uint1_out(PG_FUNCTION_ARGS)
{
    char buf[UINT8_STRBUFLEN];
    uint8 num = PG_GETARG_UINT8(0);

    char *bufPtr = uint8_to_string(num, buf, sizeof(buf));

    PG_RETURN_CSTRING(pstrdup(bufPtr));
}

/*
 *		uint1recv			- converts external binary format to uint4
 */
Datum uint1_recv(PG_FUNCTION_ARGS)
{
    uint8 result;

    StringInfo buf = (StringInfo) PG_GETARG_POINTER(0);

    result = pq_getmsgint(buf, 1);

    PG_RETURN_UINT8(result);
}

/*
 *		uint1send			- converts uint4 to binary format
 */
Datum uint1_send(PG_FUNCTION_ARGS)
{
    StringInfoData buf;
    uint8 arg1 = PG_GETARG_UINT8(0);

    pq_begintypsend(&buf);
    pq_sendint8(&buf, arg1);
    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

/* handler for btree index operator */
Datum uint1_cmp(PG_FUNCTION_ARGS)
{
    uint8 arg1 = PG_GETARG_UINT8(0);
    uint8 arg2 = PG_GETARG_UINT8(1);

    PG_RETURN_INT32(uint8_internal_cmp(arg1, arg2));
}

// Hashing ops

Datum uint1_hash(PG_FUNCTION_ARGS)
{
    uint8 val = PG_GETARG_UINT8(0);

    PG_RETURN_UINT64(hash_uint32(val));
}
