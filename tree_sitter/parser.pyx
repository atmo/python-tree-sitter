cimport cruntime
from tree_sitter.language cimport Language
from tree_sitter.node cimport Node
from tree_sitter.tree cimport Tree

# cdef set_language
# cdef get_logger
# cdef set_logger
# cdef parse
# cdef parse_text_buffer
# cdef parse_text_buffer_sync?
# cdef print_dot_graphs


cdef class Parser:
    cdef cruntime.TSParser* _c_parser

    def __cinit__(self):
        self._c_parser = cruntime.ts_parser_new()
    
    def __deallloc__(self):
        cruntime.ts_parser_delete(self._c_parser)
    
    def set_language(self, Language language):
        return cruntime.ts_parser_set_language(self._c_parser, <cruntime.TSLanguage*>language._c_language)

    def parse(self, str source):
        cdef bytes source_bytes = source.encode()
        cdef cruntime.TSTree* ctree = cruntime.ts_parser_parse_string(self._c_parser, NULL, <char*>source_bytes, len(source_bytes))
        tree = Tree()
        tree._c_tree = ctree
        return tree

    # cpdef cruntime.TSTree* _parse_with_tree(self, const char* source, cruntime.TSTree* tree):
    #     return ts_parser_parse_string(self._c_parser, tree, source, strlen(source))
