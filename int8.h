#ifndef _INT8_H
#define _INT8_H

#include "postgres.h"

static int int8_internal_cmp(const int8 arg1, const int8 arg2)
{
    if (arg1 < arg2) return -1; // arg1 is less than arg2
    if (arg1 > arg2) return 1; // arg1 is greater than arg2

    return 0; // arg1 is equal to arg2
}

#endif
