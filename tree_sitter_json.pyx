from libc.stdint cimport uint32_t

cimport binding

cdef class Language:
    @property
    def version(self):
        return <uint32_t>self._c_language.version


cpdef Language get_language():
    cdef binding.TSLanguage* clang = <binding.TSLanguage*>binding.tree_sitter_json()
    language = Language()
    language._c_language = clang
    return language
