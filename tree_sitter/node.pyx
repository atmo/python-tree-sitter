from binding cimport (TSNode, TSPoint, ts_node_child, ts_node_named_child,
    ts_node_string, ts_node_type, ts_node_is_named, ts_node_start_point,
    ts_node_end_point, ts_node_is_missing, ts_node_child_count,
    ts_node_named_child_count, ts_node_start_byte, ts_node_end_byte,
    ts_node_next_sibling, ts_node_next_named_sibling, ts_node_prev_sibling,
    ts_node_prev_named_sibling, ts_node_has_error, ts_node_has_changes,
    ts_node_parent)
from libc.stdint cimport uint32_t

from types import Point

cdef object transfer_point(TSPoint point):
    return Point(point.row, point.column / 2)


cdef class Node:

    def child(self, int index):    
        cdef TSNode cnode = ts_node_child(self._c_node, index)
        node = Node()
        node._c_node = cnode
        return node
    
    def __str__(self):
        return "Node[type=%s, start_position=%s, end_position=%s]" % (
            self.type, self.start_position, self.end_position)

    def to_string(self):
        return <bytes>ts_node_string(self._c_node)

    @property
    def type(self):
        return <bytes>ts_node_type(self._c_node)

    @property
    def is_named(self):
        return ts_node_is_named(self._c_node)

    @property
    def start_position(self):
        return transfer_point(ts_node_start_point(self._c_node))

    @property
    def end_position(self):
        return transfer_point(ts_node_end_point(self._c_node))

    @property
    def children(self):
        cdef uint32_t child_count = ts_node_child_count(self._c_node)
        children = []
        for i in range(child_count):
            children.append(ts_node_child(self._c_node, i))
        return children

    @property
    def named_children(self):
        cdef uint32_t named_child_count = ts_node_named_child_count(self._c_node)
        named_children = []
        for i in range(named_child_count):
            named_children.append(ts_node_named_child(self._c_node, i))
        return named_children

    @property
    def start_index(self):
        return ts_node_start_byte(self._c_node) / 2

    @property
    def end_index(self):
        return ts_node_end_byte(self._c_node) / 2

    @property
    def parent(self):
        node = Node()
        node._c_node = ts_node_parent(self._c_node)
        return node

    @property
    def first_child(self):
        return self.child(0)

    @property
    def last_child(self):
        cdef uint32_t child_count = ts_node_child_count(self._c_node)
        return self.child(child_count - 1)

    @property
    def first_named_child(self):
        node = Node()
        node._c_node = ts_node_named_child(self._c_node, 0)
        return node

    @property
    def last_named_child(self):
        cdef uint32_t named_child_count = ts_node_named_child_count(self._c_node)
        node = Node()
        node._c_node = ts_node_named_child(self._c_node, named_child_count - 1)
        return node

    @property
    def next_sibling(self):
        node = Node()
        node._c_node = ts_node_next_sibling(self._c_node)
        return node
    
    @property
    def next_named_sibling(self):
        node = Node()
        node._c_node = ts_node_next_named_sibling(self._c_node)
        return node

    @property
    def previous_sibling(self):
        node = Node()
        node._c_node = ts_node_prev_sibling(self._c_node)
        return node

    @property
    def previous_named_siblng(self):
        node = Node()
        node._c_node = ts_node_prev_named_sibling(self._c_node)
        return node

    @property
    def is_missing(self):
        return ts_node_is_missing(self._c_node)

    @property
    def has_error(self):
        return ts_node_has_error(self._c_node)

    @property
    def has_changes(self):
        return ts_node_has_changes(self._c_node)

    def child(self, index):
        node = Node()
        node._c_node = ts_node_child(self._c_node, index)
        return node
    
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
