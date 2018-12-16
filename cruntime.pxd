# def extern from "stdbool.h":
#     ctypedef bint bool 

cdef extern from "vendor/tree-sitter/include/tree_sitter/runtime.h":
    ctypedef struct TSParser:
        pass
    
    ctypedef struct TSLanguage:
        pass
    
    ctypedef struct TSNode:
        pass
    
    ctypedef struct TSTree:
        pass

    TSParser *ts_parser_new()
    void ts_parser_delete(TSParser *parser)

    const TSLanguage *ts_parser_language(const TSParser *parser)
    bint ts_parser_set_language(TSParser *parser, const TSLanguage *language)

    # TSLogger ts_parser_logger(const TSParser *parser)
    # void ts_parser_set_logger(TSParser *parser, TSLogger logger)

    TSTree* ts_parser_parse_string(TSParser* parser, const TSTree* tree, const char* string, unsigned int length) # TODO: uint_32?



    void ts_tree_delete(TSTree* tree)



    TSNode ts_node_child(TSNode node, unsigned int index)  # TODO: uint_32?

    unsigned int ts_node_child_count(TSNode node) # TODO: uint_32?

    TSNode ts_tree_root_node(const TSTree* tree)


    char *ts_node_string(TSNode)
