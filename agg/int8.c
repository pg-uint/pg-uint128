// WARNING: This file is generated, do not edit

#include "postgres.h"
#include "utils/fmgrprotos.h"
#include "int_utils.h"
#include "uint_utils.h"
#include "numeric_utils.h"

PG_FUNCTION_INFO_V1(int1_avg_accum);
Datum int1_avg_accum(PG_FUNCTION_ARGS) {
    char buf[INT8_STRBUFLEN];
    int8 num = PG_GETARG_INT8(1);

    Numeric numParsed = int8_to_numeric(num, buf, sizeof(buf));
    /* Initialize the FunctionCallInfoData for numeric_avg_accum */
    fcinfo->args[1].value = NumericGetDatum(numParsed);

    return numeric_avg_accum(fcinfo);
}

PG_FUNCTION_INFO_V1(int1_avg_accum_inv);
Datum int1_avg_accum_inv(PG_FUNCTION_ARGS) {
    char buf[INT8_STRBUFLEN];
    int8 num = PG_GETARG_INT8(1);

    Numeric numParsed = int8_to_numeric(num, buf, sizeof(buf));
    /* Initialize the FunctionCallInfoData for numeric_accum_inv */
    fcinfo->args[1].value = NumericGetDatum(numParsed);

    return numeric_accum_inv(fcinfo);
}


PG_FUNCTION_INFO_V1(int1_smaller);
Datum int1_smaller(PG_FUNCTION_ARGS) {
    int8		arg1 = PG_GETARG_INT8(0);
    int8		arg2 = PG_GETARG_INT8(1);

    PG_RETURN_INT8(arg1 < arg2 ? arg1 : arg2);
}


PG_FUNCTION_INFO_V1(int1_larger);
Datum int1_larger(PG_FUNCTION_ARGS) {
    int8		arg1 = PG_GETARG_INT8(0);
    int8		arg2 = PG_GETARG_INT8(1);

    PG_RETURN_INT8(arg1 > arg2 ? arg1 : arg2);
}


