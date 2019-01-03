cdef class TreeCursor:

    @property
    def nodeType(self):
        raise NotImplementedError

    @property
    def nodeIsNamed(self):
        raise NotImplementedError
    
    @property
    def start_position(self):
        raise NotImplementedError
    
    @property
    def end_position(self):
        raise NotImplementedError
    
    @property
    def start_index(self):
        raise NotImplementedError
    
    @property
    def end_index(self):
        raise NotImplementedError

    def go_to_parent(self):
        raise NotImplementedError

    def go_to_first_child(self):
        raise NotImplementedError
    
    def go_to_first_child_for_index(self, index):
        raise NotImplementedError
    
    def go_to_next_sibling(self):
        raise NotImplementedError
