import attr

@attr.s
class Point(object):
    row = attr.ib()
    column = attr.ib()

@attr.s
class Range(object):
    start = attr.ib()
    end = attr.ib()

@attr.s
class Edit(object):
    start_index = attr.ib()
    old_end_index = attr.ib()
    new_end_index = attr.ib()
    start_position = attr.ib()
    old_end_position = attr.ib()
    new_end_position = attr.ib()
