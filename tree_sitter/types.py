import attr

@attr.s
class Position:
    row = attr.ib()
    column = attr.ib()


@dataclass
class Range:
    start = attr.ib()
    end = attr.ib()

@dataclass
class Edit:
    start_index = attr.ib()
    old_end_index = attr.ib()
    new_end_index = attr.ib()
    start_position = attr.ib()
    old_end_position = attr.ib()
    new_end_position = attr.ib()
