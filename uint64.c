#include "postgres.h"
#include "fmgr.h"
#include "utils/memutils.h"
#include <access/hash.h>
#include "lib/stringinfo.h"
#include <libpq/pqformat.h>
#include <stdint.h>
#include "uint_utils.h"
#include "uint64.h"

#include <math.h>
#include <utils/fmgrprotos.h>
#include "numeric_utils.h"

#include "funcapi.h"
#include "nodes/supportnodes.h"
#include "nodes/nodeFuncs.h"
#include "optimizer/optimizer.h"

// #include "executor/spi.h"
// #include "utils/lsyscache.h"

PG_FUNCTION_INFO_V1(uint8_in);
PG_FUNCTION_INFO_V1(uint8_out);
PG_FUNCTION_INFO_V1(uint8_send);
PG_FUNCTION_INFO_V1(uint8_recv);

PG_FUNCTION_INFO_V1(uint8_cmp);
PG_FUNCTION_INFO_V1(uint8_hash);

// Serialization ops

Datum uint8_in(PG_FUNCTION_ARGS)
{
    char *num_str = PG_GETARG_CSTRING(0);
    uint64 num = 0;
	int convRes = 0;

    if (num_str == NULL)
        elog(ERROR, "NULL pointer");

    if (*num_str == 0) {
        ereport(
            ERROR,
            (
                errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                errmsg("invalid input syntax for type uint8: \"%s\"", num_str)
            )
        );
    }

    // elog(INFO, "uint8in num_str: %s", num_str);

	convRes = parse_uint64(num_str, &num);
	if (convRes == -1)
	{
		ereport(
			ERROR,
			(
				errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
				errmsg("invalid input syntax for type uint8: \"%s\"", num_str)
			)
		);
	}
	if (convRes == -2)
	{
		OUT_OF_RANGE_ERR(uint8);
	}

    // elog(INFO, "uint8in high %llu low %llu", (uint64)((*num) >> 64), (uint64)low_part);

    PG_RETURN_UINT64(num);
}

Datum uint8_out(PG_FUNCTION_ARGS)
{
    uint64 num = PG_GETARG_UINT64(0);
    char buf[UINT64_STRBUFLEN];

    char *bufPtr = uint64_to_string(num, buf, sizeof(buf));

    PG_RETURN_CSTRING(pstrdup(bufPtr));
}

/*
 *		uint8recv			- converts external binary format to uint8
 */
Datum uint8_recv(PG_FUNCTION_ARGS)
{
    uint64 result;

    StringInfo buf = (StringInfo) PG_GETARG_POINTER(0);

    result = (uint64) pq_getmsgint64(buf);

    PG_RETURN_UINT64(result);
}

/*
 *		uint8send			- converts uint8 to binary format
 */
Datum uint8_send(PG_FUNCTION_ARGS)
{
    StringInfoData buf;
    uint64 arg1 = PG_GETARG_UINT64(0);

    pq_begintypsend(&buf);
    pq_sendint64(&buf, arg1);
    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

/* handler for btree index operator */
Datum uint8_cmp(PG_FUNCTION_ARGS)
{
    uint64 arg1 = PG_GETARG_UINT64(0);
    uint64 arg2 = PG_GETARG_UINT64(1);

    PG_RETURN_INT32(uint64_internal_cmp(arg1, arg2));
}

// Hashing ops

Datum uint8_hash(PG_FUNCTION_ARGS)
{
    uint64 val = PG_GETARG_UINT64(0);

    PG_RETURN_UINT64(hashuint8(val));
}

typedef struct
{
    uint64		current;
    uint64		finish;
    uint64		step;
} generate_series_fctx;

/*
 * non-persistent numeric series generator
 */
Datum generate_series_int8(PG_FUNCTION_ARGS)
{
	return generate_series_step_int8(fcinfo);
}

Datum generate_series_step_int8(PG_FUNCTION_ARGS)
{
	FuncCallContext *funcctx;
	generate_series_fctx *fctx;
	uint64		result;
	MemoryContext oldcontext;

	/* stuff done only on the first call of the function */
	if (SRF_IS_FIRSTCALL())
	{
		uint64		start = PG_GETARG_UINT64(0);
		uint64		finish = PG_GETARG_UINT64(1);
		uint64		step = 1;

		/* see if we were given an explicit step size */
		if (PG_NARGS() == 3)
			step = PG_GETARG_UINT64(2);
		if (step == 0)
			ereport(ERROR,
					(errcode(ERRCODE_INVALID_PARAMETER_VALUE),
					 errmsg("step size cannot equal zero")));

		/* create a function context for cross-call persistence */
		funcctx = SRF_FIRSTCALL_INIT();

		/*
		 * switch to memory context appropriate for multiple function calls
		 */
		oldcontext = MemoryContextSwitchTo(funcctx->multi_call_memory_ctx);

		/* allocate memory for user context */
		fctx = (generate_series_fctx *) palloc(sizeof(generate_series_fctx));

		/*
		 * Use fctx to keep state from call to call. Seed current with the
		 * original start value
		 */
		fctx->current = start;
		fctx->finish = finish;
		fctx->step = step;

		funcctx->user_fctx = fctx;
		MemoryContextSwitchTo(oldcontext);
	}

	/* stuff done on every call of the function */
	funcctx = SRF_PERCALL_SETUP();

	/*
	 * get the saved state and use current as the result for this iteration
	 */
	fctx = funcctx->user_fctx;
	result = fctx->current;

	if ((fctx->step > 0 && fctx->current <= fctx->finish) ||
		(fctx->step < 0 && fctx->current >= fctx->finish))
	{
		/*
		 * Increment current in preparation for next iteration. If next-value
		 * computation overflows, this is the final result.
		 */
		if (add_u64_overflow(fctx->current, fctx->step, &fctx->current))
			fctx->step = 0;

		/* do when there is more left to send */
		SRF_RETURN_NEXT(funcctx, UInt64GetDatum(result));
	}
	else
		/* do when there is no more left */
		SRF_RETURN_DONE(funcctx);
}

/*
 * Planner support function for generate_series(int8, int8 [, int8])
 */
Datum generate_series_int8_support(PG_FUNCTION_ARGS)
{
	Node	   *rawreq = (Node *) PG_GETARG_POINTER(0);
	Node	   *ret = NULL;

	if (IsA(rawreq, SupportRequestRows))
	{
		/* Try to estimate the number of rows returned */
		SupportRequestRows *req = (SupportRequestRows *) rawreq;

		if (is_funcclause(req->node))	/* be paranoid */
		{
			List	   *args = ((FuncExpr *) req->node)->args;
			Node	   *arg1,
					   *arg2,
					   *arg3;

			/* We can use estimated argument values here */
			arg1 = estimate_expression_value(req->root, linitial(args));
			arg2 = estimate_expression_value(req->root, lsecond(args));
			if (list_length(args) >= 3)
				arg3 = estimate_expression_value(req->root, lthird(args));
			else
				arg3 = NULL;

			/*
			 * If any argument is constant NULL, we can safely assume that
			 * zero rows are returned.  Otherwise, if they're all non-NULL
			 * constants, we can calculate the number of rows that will be
			 * returned.  Use double arithmetic to avoid overflow hazards.
			 */
			if ((IsA(arg1, Const) &&
				 ((Const *) arg1)->constisnull) ||
				(IsA(arg2, Const) &&
				 ((Const *) arg2)->constisnull) ||
				(arg3 != NULL && IsA(arg3, Const) &&
				 ((Const *) arg3)->constisnull))
			{
				req->rows = 0;
				ret = (Node *) req;
			}
			else if (IsA(arg1, Const) &&
					 IsA(arg2, Const) &&
					 (arg3 == NULL || IsA(arg3, Const)))
			{
				double		start,
							finish,
							step;

				start = DatumGetUInt64(((Const *) arg1)->constvalue);
				finish = DatumGetUInt64(((Const *) arg2)->constvalue);
				step = arg3 ? DatumGetUInt64(((Const *) arg3)->constvalue) : 1;

				/* This equation works for either sign of step */
				if (step != 0)
				{
					req->rows = floor((finish - start + step) / step);
					ret = (Node *) req;
				}
			}
		}
	}

	PG_RETURN_POINTER(ret);
}
