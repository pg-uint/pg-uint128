// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "utils/fmgrprotos.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"

PG_FUNCTION_INFO_V1(uint1_avg_accum);
Datum uint1_avg_accum(PG_FUNCTION_ARGS) {
    char buf[UINT8_STRBUFLEN];
    uint8 num = PG_GETARG_UINT8(1);

    Numeric numParsed = uint8_to_numeric(num, buf, sizeof(buf));
    /* Initialize the FunctionCallInfoData for numeric_avg_accum */
    fcinfo->args[1].value = NumericGetDatum(numParsed);

    return numeric_avg_accum(fcinfo);
}

PG_FUNCTION_INFO_V1(uint1_avg_accum_inv);
Datum uint1_avg_accum_inv(PG_FUNCTION_ARGS) {
    char buf[UINT8_STRBUFLEN];
    uint8 num = PG_GETARG_UINT8(1);

    Numeric numParsed = uint8_to_numeric(num, buf, sizeof(buf));
    /* Initialize the FunctionCallInfoData for numeric_accum_inv */
    fcinfo->args[1].value = NumericGetDatum(numParsed);

    return numeric_accum_inv(fcinfo);
}


PG_FUNCTION_INFO_V1(uint1_smaller);
Datum uint1_smaller(PG_FUNCTION_ARGS) {
    uint8		arg1 = PG_GETARG_UINT8(0);
    uint8		arg2 = PG_GETARG_UINT8(1);

    PG_RETURN_UINT8(arg1 < arg2 ? arg1 : arg2);
}


PG_FUNCTION_INFO_V1(uint1_larger);
Datum uint1_larger(PG_FUNCTION_ARGS) {
    uint8		arg1 = PG_GETARG_UINT8(0);
    uint8		arg2 = PG_GETARG_UINT8(1);

    PG_RETURN_UINT8(arg1 > arg2 ? arg1 : arg2);
}


