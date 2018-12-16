#cython language_level=2
from libc.stdint cimport uint32_t

cdef extern from "vendor/tree-sitter-json/src/tree_sitter/parser.h":
    ctypedef struct TSLanguage:
        uint32_t version
    
cdef extern TSLanguage* tree_sitter_json()