#ifndef CAST_UTILS_H
#define CAST_UTILS_H

#include <utils/jsonb.h>

void cannotCastJsonbValue(enum jbvType type, const char* sqltype);

#endif
