#include "postgres.h"
#include "fmgr.h"
#include <access/hash.h>
#include "lib/stringinfo.h"
#include <libpq/pqformat.h>
#include "uint_utils.h"
#include "uint16.h"

PG_FUNCTION_INFO_V1(uint2_in);
PG_FUNCTION_INFO_V1(uint2_out);
PG_FUNCTION_INFO_V1(uint2_send);
PG_FUNCTION_INFO_V1(uint2_recv);

PG_FUNCTION_INFO_V1(uint2_cmp);
PG_FUNCTION_INFO_V1(uint2_hash);

// Serialization ops

Datum uint2_in(PG_FUNCTION_ARGS)
{
    char *num_str = PG_GETARG_CSTRING(0);
    uint16 num = 0;
    parse_uint_res_t convRes = 0;

    if (num_str == NULL)
        elog(ERROR, "NULL pointer");

    if (*num_str == 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type uint2: \"%s\"", num_str)
            )
        );
    }

    convRes = parse_uint16(num_str, &num);
    if (convRes == ParseOK)
    {
        PG_RETURN_UINT16(num);
    }

    if (convRes == ParseError) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type uint2: \"%s\"", num_str)
            )
        );
    }

    OUT_OF_RANGE_ERR(uint2);
}

Datum uint2_out(PG_FUNCTION_ARGS)
{
    char buf[UINT16_STRBUFLEN];
    uint16 num = PG_GETARG_UINT16(0);

    char *bufPtr = uint16_to_string(num, buf, sizeof(buf));

    PG_RETURN_CSTRING(pstrdup(bufPtr));
}

/*
 *		uint2recv			- converts external binary format to uint4
 */
Datum uint2_recv(PG_FUNCTION_ARGS)
{
    uint16 result;

    StringInfo buf = (StringInfo) PG_GETARG_POINTER(0);

    result = pq_getmsgint(buf, 2);

    PG_RETURN_UINT16(result);
}

/*
 *		uint2send			- converts uint4 to binary format
 */
Datum uint2_send(PG_FUNCTION_ARGS)
{
    StringInfoData buf;
    uint16 arg1 = PG_GETARG_UINT16(0);

    pq_begintypsend(&buf);
    pq_sendint16(&buf, arg1);
    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

/* handler for btree index operator */
Datum uint2_cmp(PG_FUNCTION_ARGS)
{
    uint16 arg1 = PG_GETARG_UINT16(0);
    uint16 arg2 = PG_GETARG_UINT16(1);

    PG_RETURN_INT32(uint16_internal_cmp(arg1, arg2));
}

// Hashing ops

Datum uint2_hash(PG_FUNCTION_ARGS)
{
    uint16 val = PG_GETARG_UINT16(0);

    PG_RETURN_UINT64(hash_uint32(val));
}
