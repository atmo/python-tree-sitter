# distutils: sources = vendor/tree-sitter/src/runtime/parser.c
# distutils: include_dirs = vendor/tree-sitter/include/, vendor/tree-sitter/src/
 
# from cruntime cimport TSParser, TSLanguage, \
#     ts_parser_new, ts_parser_delete, ts_parser_set_language

cimport cruntime
from libc.string cimport strlen
from tree_sitter_json cimport Language

cdef class Parser:
    cdef cruntime.TSParser* _c_parser

    def __cinit__(self):
        self._c_parser = cruntime.ts_parser_new()
    
    def __deallloc__(self):
        cruntime.ts_parser_delete(self._c_parser)
    
    def set_language(self, Language language):
        return cruntime.ts_parser_set_language(self._c_parser, <cruntime.TSLanguage*>language._c_language)

    # cpdef cruntime.TSTree* parse(self, const char* source):
    #     #  TSTree *ts_parser_parse_string(TSParser *, const TSTree *, const char *, uint32_t);
    #     self._parse_with_tree(source, NULL)

    # cpdef cruntime.TSTree* _parse_with_tree(self, const char* source, cruntime.TSTree* tree):
    #     return ts_parser_parse_string(self._c_parser, tree, source, strlen(source))



    # cdef set_language
    # cdef get_logger
    # cdef set_logger
    # cdef parse
