from binding cimport TSNode

cdef class Node:
    cdef TSNode _c_node
