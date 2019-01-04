from binding cimport TSTree

cdef class Tree:
    cdef TSTree* _c_tree