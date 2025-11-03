// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>


PG_FUNCTION_INFO_V1(numeric_from_uint1);
Datum numeric_from_uint1(PG_FUNCTION_ARGS)
{
	uint8		val = PG_GETARG_UINT8(0);

	PG_RETURN_DATUM(DirectFunctionCall1(int2_numeric, Int16GetDatum((int16)val)));
}

PG_FUNCTION_INFO_V1(numeric_from_uint2);
Datum numeric_from_uint2(PG_FUNCTION_ARGS)
{
	uint16		val = PG_GETARG_UINT16(0);

	PG_RETURN_DATUM(DirectFunctionCall1(int4_numeric, Int32GetDatum((int32)val)));
}

PG_FUNCTION_INFO_V1(numeric_from_uint4);
Datum numeric_from_uint4(PG_FUNCTION_ARGS)
{
	uint32		val = PG_GETARG_UINT32(0);

	PG_RETURN_DATUM(DirectFunctionCall1(int8_numeric, Int64GetDatum((int64)val)));
}





PG_FUNCTION_INFO_V1(numeric_from_int1);
Datum numeric_from_int1(PG_FUNCTION_ARGS)
{
	int8		val = PG_GETARG_INT8(0);

	PG_RETURN_DATUM(DirectFunctionCall1(int2_numeric, Int16GetDatum((int16)val)));
}



