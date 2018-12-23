cimport cruntime

cdef class Node:
    cdef cruntime.TSNode _c_node
