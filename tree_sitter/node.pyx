from binding cimport TSNode, ts_node_child, ts_node_string

cdef class Node:

    def child(self, int index):    
        cdef TSNode cnode = ts_node_child(self._c_node, index)
        node = Node()
        node._c_node = cnode
        return node
    
    def __str__(self):
        return <bytes>ts_node_string(self._c_node)

    @property
    def type(self):
        raise NotImplementedError
    
    @property
    def is_named(self):
        raise NotImplementedError

    @property
    def start_position(self):
        raise NotImplementedError

    @property
    def end_position(self):
        raise NotImplementedError
    
    @property
    def children(self):
        raise NotImplementedError

    @property
    def named_children(self):
        raise NotImplementedError

    @property
    def start_index(self):
        raise NotImplementedError

    @property
    def end_index(self):
        raise NotImplementedError

    @property
    def parent(self):
        raise NotImplementedError

    @property
    def first_child(self):
        raise NotImplementedError

    @property
    def last_child(self):
        raise NotImplementedError

    @property
    def first_named_child(self):
        raise NotImplementedError

    @property
    def last_named_child(self):
        raise NotImplementedError

    @property
    def next_sibling(self):
        raise NotImplementedError
    
    @property
    def next_named_sibling(self):
        raise NotImplementedError

    @property
    def previous_sibling(self):
        raise NotImplementedError

    @property
    def previous_named_siblng(self):
        raise NotImplementedError

    @property
    def is_missing(self):
        raise NotImplementedError

    @property
    def has_error(self):
        raise NotImplementedError

    @property
    def has_changes(self):
        raise NotImplementedError

    def child(self, index):
        raise NotImplementedError
    
    def first_child_for_index(self, index):
        raise NotImplementedError
    
    def first_named_child_for_index(self, index):
        raise NotImplementedError
    
    def descendant_for_index(self, start, end):
        raise NotImplementedError
    
    def named_descendant_for_index(self, start, end):
        raise NotImplementedError
    
    def named_descendant_for_position(self, start, end):
        raise NotImplementedError
    
    def descendant_for_position(self, start, end):
        raise NotImplementedError
