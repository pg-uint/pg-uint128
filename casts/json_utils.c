#include "postgres.h"
#include "json_utils.h"

/*
* Emit correct, translatable cast error message
 */
void cannotCastJsonbValue(enum jbvType type, const char* sqltype)
{
    static const struct
    {
        enum jbvType type;
        const char* msg;
    }

        messages[] = {
            {jbvNull, gettext_noop("cannot cast jsonb null to type %s")},
            {jbvString, gettext_noop("cannot cast jsonb string to type %s")},
            {jbvNumeric, gettext_noop("cannot cast jsonb numeric to type %s")},
            {jbvBool, gettext_noop("cannot cast jsonb boolean to type %s")},
            {jbvArray, gettext_noop("cannot cast jsonb array to type %s")},
            {jbvObject, gettext_noop("cannot cast jsonb object to type %s")},
            {jbvBinary, gettext_noop("cannot cast jsonb array or object to type %s")}
        };

    int i = 0;
    for (i = 0; i < lengthof(messages); i++)
    {
        if (messages[i].type == type)
        {
            ereport(
                ERROR,
                (
                    errcode(ERRCODE_INVALID_PARAMETER_VALUE),
                    errmsg(messages[i].msg, sqltype)
                )
            );
        }
    }

    /* should be unreachable */
    elog(ERROR, "unknown jsonb type: %d", (int)type);
}

/*
* Emit correct, translatable cast error message
 */
void cannotCastJsonValue(JsonTokenType type, const char* sqltype)
{
    static const struct
    {
        JsonTokenType type;
        const char* msg;
    }

        messages[] = {
            {JSON_TOKEN_INVALID, gettext_noop("cannot cast invalid json to type %s")},
            {JSON_TOKEN_NULL, gettext_noop("cannot cast json null to type %s")},
            {JSON_TOKEN_STRING, gettext_noop("cannot cast json string to type %s")},
            {JSON_TOKEN_NUMBER, gettext_noop("cannot cast json number to type %s")},
            {JSON_TOKEN_FALSE, gettext_noop("cannot cast json boolean to type %s")},
            {JSON_TOKEN_TRUE, gettext_noop("cannot cast json boolean to type %s")},
            {JSON_TOKEN_ARRAY_START, gettext_noop("cannot cast json array to type %s")},
            {JSON_TOKEN_ARRAY_END, gettext_noop("cannot cast json array to type %s")},
            {JSON_TOKEN_OBJECT_START, gettext_noop("cannot cast json object to type %s")},
            {JSON_TOKEN_OBJECT_END, gettext_noop("cannot cast json object to type %s")},
            {JSON_TOKEN_COLON, gettext_noop("cannot cast json colon to type %s")},
            {JSON_TOKEN_COMMA, gettext_noop("cannot cast json comma to type %s")},
            {JSON_TOKEN_END, gettext_noop("cannot cast json end to type %s")},
        };

    int i = 0;
    for (i = 0; i < lengthof(messages); i++)
    {
        if (messages[i].type == type)
        {
            ereport(
                ERROR,
                (
                    errcode(ERRCODE_INVALID_PARAMETER_VALUE),
                    errmsg(messages[i].msg, sqltype)
                )
            );
        }
    }

    /* should be unreachable */
    elog(ERROR, "unknown json type: %d", (int)type);
}
