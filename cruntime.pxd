# def extern from "stdbool.h":
#     ctypedef bint bool 

cdef extern from "vendor/tree-sitter/include/tree_sitter/runtime.h":
    ctypedef struct TSParser:
        pass
    
    ctypedef struct TSLanguage:
        pass
    
    ctypedef struct TSLogger:
        pass
    
    ctypedef struct TSTree:
        pass
    
    ctypedef struct TSInput:
        pass

    TSParser *ts_parser_new()
    void ts_parser_delete(TSParser *parser)

    const TSLanguage *ts_parser_language(const TSParser *parser)
    bint ts_parser_set_language(TSParser *parser, const TSLanguage *language)

    TSLogger ts_parser_logger(const TSParser *parser)
    void ts_parser_set_logger(TSParser *parser, TSLogger logger)

    TSTree* ts_parser_parse(TSParser* parser, const TSTree* tree, TSInput input)

    TSTree* ts_parser_string(TSParser* parser, const TSTree* tree, const char* string, unsigned int length)
