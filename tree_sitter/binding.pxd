from libc.stdint cimport uint32_t

cdef extern from "tree_sitter/runtime.h":
    ctypedef struct TSLanguage:
        pass
    
    ctypedef struct TSNode:
        pass
    
    ctypedef struct TSParser:
        pass
    
    ctypedef struct TSPoint:
        uint32_t row
        uint32_t column

    ctypedef struct TSTree:
        pass
    
    ctypedef struct TSTreeCursor:
        pass

    TSParser *ts_parser_new()
    void ts_parser_delete(TSParser *parser)
    const TSLanguage *ts_parser_language(const TSParser *parser)
    bint ts_parser_set_language(TSParser *parser, const TSLanguage *language)
    
    TSTree* ts_parser_parse_string(TSParser* parser, const TSTree* tree, const char* string, unsigned int length) # TODO: uint_32?
    void ts_tree_delete(TSTree* tree)
    TSNode ts_tree_root_node(const TSTree* tree)

    TSNode ts_node_child(TSNode node, uint32_t index)
    TSNode ts_node_named_child(TSNode node, uint32_t index)
    uint32_t ts_node_child_count(TSNode node)
    uint32_t ts_node_named_child_count(TSNode node)
    bint ts_node_is_named(TSNode node)
    bint ts_node_is_missing(TSNode node)
    const char* ts_node_string(TSNode node)
    const char* ts_node_type(TSNode node)
    TSPoint ts_node_start_point(TSNode node)
    TSPoint ts_node_end_point(TSNode node)
    uint32_t ts_node_child_count(TSNode node)
    uint32_t ts_node_start_byte(TSNode node)
    uint32_t ts_node_end_byte(TSNode node)
    TSNode ts_node_next_sibling(TSNode node)
    TSNode ts_node_next_named_sibling(TSNode node)
    TSNode ts_node_prev_sibling(TSNode node)
    TSNode ts_node_prev_named_sibling(TSNode node)
    bint ts_node_has_error(TSNode node)
    bint ts_node_has_changes(TSNode node)
    TSNode ts_node_parent(TSNode node)
