#ifndef CAST_UTILS_H
#define CAST_UTILS_H

#include <utils/jsonb.h>
#if PG_VERSION_NUM < 130000
#include <utils/jsonapi.h>
#else
#include <utils/jsonfuncs.h>  // PG 13+
#endif

void cannotCastJsonbValue(enum jbvType type, const char* sqltype);
void cannotCastJsonValue(JsonTokenType type, const char* sqltype);

#endif
