cimport cruntime

cdef class Node:

    def child(self, int index):    
        cdef cruntime.TSNode cnode = cruntime.ts_node_child(self._c_node, index)
        node = Node()
        node._c_node = cnode
        return node
    
    def __str__(self):
        return <bytes>cruntime.ts_node_string(self._c_node)
