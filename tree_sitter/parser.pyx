cimport cruntime
from tree_sitter.language cimport Language
from tree_sitter.node cimport Node
from tree_sitter.tree cimport Tree

cdef class Parser:
    cdef cruntime.TSParser* _c_parser

    def __cinit__(self):
        self._c_parser = cruntime.ts_parser_new()
    
    def __deallloc__(self):
        cruntime.ts_parser_delete(self._c_parser)
    
    def set_language(self, Language language):
        return cruntime.ts_parser_set_language(self._c_parser, <cruntime.TSLanguage*>language._c_language)

    @property
    def language(self) -> Language:
        language = Language()
        language._c_language = cruntime.ts_parser_language(self._c_parser)
        return language

    # TODO: implement async version if needed
    def parse(self, str source, Tree previous_tree=None):
        if previous_tree is not None:
            raise NotImplementedError

        cdef bytes source_bytes = source.encode()
        cdef cruntime.TSTree* ctree = cruntime.ts_parser_parse_string(self._c_parser, NULL, <char*>source_bytes, len(source_bytes))
        tree = Tree()
        tree._c_tree = ctree
        return tree
    
    # let's imagine logger is a callable for now
    def set_logger(self, logger):
        raise NotImplementedError
    
    @property
    def logger(self):
        raise NotImplementedError
