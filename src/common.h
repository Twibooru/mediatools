#ifndef _COMMON_H_INCLUDED
#define _COMMON_H_INCLUDED

enum mediatools_result_code {
    SUCCESS,
    FILE_READ_ERROR,
    FORMAT_VALIDATE_ERROR,
    DURATION_VALIDATE_ERROR,
    _RESULT_CODE_LAST
};

const char *mediatools_strerror(enum mediatools_result_code code);

#endif
