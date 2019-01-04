from binding cimport TSLanguage

cdef class Language:
    cdef TSLanguage* _c_language
