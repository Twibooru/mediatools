#include "common.h"

static const char *mediastat_error_strings[_RESULT_CODE_LAST] = {
    "Success",
    "File read error",
    "Format validation error",
    "Duration validation error"
};

const char *mediatools_strerror(enum mediatools_result_code code) {
    return mediastat_error_strings[code];
}
