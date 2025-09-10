// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"
#include "utils/fmgrprotos.h"
#include "utils/builtins.h"
#include "json_utils.h"
#include <math.h>


PG_FUNCTION_INFO_V1(float8_from_uint1);
Datum float8_from_uint1(PG_FUNCTION_ARGS)
{
	uint8		arg = PG_GETARG_UINT8(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

PG_FUNCTION_INFO_V1(float8_from_uint2);
Datum float8_from_uint2(PG_FUNCTION_ARGS)
{
	uint16		arg = PG_GETARG_UINT16(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

PG_FUNCTION_INFO_V1(float8_from_uint4);
Datum float8_from_uint4(PG_FUNCTION_ARGS)
{
	uint32		arg = PG_GETARG_UINT32(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

PG_FUNCTION_INFO_V1(float8_from_uint8);
Datum float8_from_uint8(PG_FUNCTION_ARGS)
{
	uint64		arg = PG_GETARG_UINT64(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

PG_FUNCTION_INFO_V1(float8_from_uint16);
Datum float8_from_uint16(PG_FUNCTION_ARGS)
{
	uint128		arg = PG_GETARG_UINT128(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

PG_FUNCTION_INFO_V1(float8_from_int1);
Datum float8_from_int1(PG_FUNCTION_ARGS)
{
	int8		arg = PG_GETARG_INT8(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

PG_FUNCTION_INFO_V1(float8_from_int16);
Datum float8_from_int16(PG_FUNCTION_ARGS)
{
	int128		arg = PG_GETARG_INT128(0);
	float8		result;

	result = (float8)arg;

	PG_RETURN_FLOAT8(result);
}

