// WARNING: This file is generated, do not edit

#include "postgres.h"

#if PG_VERSION_NUM >= 120000

#include "utils/rangetypes.h"

#include "uint_utils.h"
#include "int_utils.h"

PG_FUNCTION_INFO_V1(uint2_range_subdiff);
Datum uint2_range_subdiff(PG_FUNCTION_ARGS)
{
    uint16		v1 = PG_GETARG_UINT16(0);
    uint16		v2 = PG_GETARG_UINT16(1);

    PG_RETURN_FLOAT8((float8) v1 - (float8) v2);
}

PG_FUNCTION_INFO_V1(uint2_range_canonical);
Datum uint2_range_canonical(PG_FUNCTION_ARGS)
{
    RangeType  *r = PG_GETARG_RANGE_P(0);
#if PG_VERSION_NUM >= 160000
    Node	   *escontext = fcinfo->context;
#endif
    TypeCacheEntry *typcache;
    RangeBound	lower;
    RangeBound	upper;
    bool		empty;

    typcache = range_get_typcache(fcinfo, RangeTypeGetOid(r));

    range_deserialize(typcache, r, &lower, &upper, &empty);

    if (empty)
        PG_RETURN_RANGE_P(r);

    if (!lower.infinite && !lower.inclusive)
    {
        uint16		bnd = DatumGetUInt16(lower.val);

        /* Handle possible overflow manually */
        if (unlikely(bnd == UINT16_MAX))
            OUT_OF_RANGE_ERR(uint2);
            // ereturn(escontext, (Datum) 0,
                    // (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                     // errmsg("bigint out of range")));
        lower.val = UInt16GetDatum(bnd + 1);
        lower.inclusive = true;
    }

    if (!upper.infinite && upper.inclusive)
    {
        uint16		bnd = DatumGetUInt16(upper.val);

        /* Handle possible overflow manually */
        if (unlikely(bnd == UINT16_MAX))
            OUT_OF_RANGE_ERR(uint2);
            // ereturn(escontext, (Datum) 0,
                    // (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                     // errmsg("bigint out of range")));
        upper.val = UInt16GetDatum(bnd + 1);
        upper.inclusive = false;
    }

#if PG_VERSION_NUM >= 160000
    PG_RETURN_RANGE_P(range_serialize(typcache, &lower, &upper, false, escontext));
#else
    PG_RETURN_RANGE_P(range_serialize(typcache, &lower, &upper, false));
#endif
}

#endif
