cimport cruntime

cdef class Language:
    cdef cruntime.TSLanguage* _c_language
