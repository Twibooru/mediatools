#include "common.h"

static const char *mediastat_error_strings[_RESULT_CODE_LAST] = {
    "Success",
    "File read error",
    "Error detecting stream info",
    "Error finding media stream",
    "Error creating decoding context",
    "Error decoding stream",
    "Error writing image file",
    "No frame found for requested time",
    "Format validation error",
    "Duration validation error"
};

const char *mediatools_strerror(enum mediatools_result_code code) {
    return mediastat_error_strings[code];
}
