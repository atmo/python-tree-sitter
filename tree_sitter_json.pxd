cimport binding

cdef class Language:
    cdef binding.TSLanguage* _c_language

cpdef Language get_language()