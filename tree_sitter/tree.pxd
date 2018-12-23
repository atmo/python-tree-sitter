cimport cruntime

cdef class Tree:
    cdef cruntime.TSTree* _c_tree