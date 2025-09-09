#include "postgres.h"
#include "utils.h"

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
