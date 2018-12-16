# distutils: sources = vendor/tree-sitter/src/runtime/parser.c
# distutils: include_dirs = vendor/tree-sitter/include/, vendor/tree-sitter/src/
 
# from cruntime cimport TSParser, TSLanguage, \
#     ts_parser_new, ts_parser_delete, ts_parser_set_language

cimport cruntime
from libc.string cimport strlen
from tree_sitter_json cimport Language
# from tree cimport Tree

cdef class Node:
    cdef cruntime.TSNode _c_node

    def child(self, int index):    
        cdef cruntime.TSNode cnode = cruntime.ts_node_child(self._c_node, index)
        node = Node()
        node._c_node = cnode
        return node
    
    def __str__(self):
        return <bytes>cruntime.ts_node_string(self._c_node)
    


cdef class Tree:
    cdef cruntime.TSTree* _c_tree

    # def __init__(self):
    #     pass

    # @classmethod
    # cdef create(self, cruntime.TSTree* tree):
    #     self._c_tree = cruntime.ts_tree_copy(tree)
    
    def __deallloc__(self):
        cruntime.ts_tree_delete(self._c_tree)
    
    def root_node(self):
        cdef cruntime.TSNode cnode = cruntime.ts_tree_root_node(self._c_tree)
        node = Node()
        node._c_node = cnode
        return node

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
        # print(source.shape)
        cdef bytes source_bytes = source.encode()
        cdef cruntime.TSTree* ctree = cruntime.ts_parser_parse_string(self._c_parser, NULL, <char*>source_bytes, len(source_bytes))
        tree = Tree()
        tree._c_tree = ctree
        return tree
        # self._parse_with_tree(source, NULL)

    # cpdef cruntime.TSTree* _parse_with_tree(self, const char* source, cruntime.TSTree* tree):
    #     return ts_parser_parse_string(self._c_parser, tree, source, strlen(source))



    # cdef set_language
    # cdef get_logger
    # cdef set_logger
    # cdef parse
