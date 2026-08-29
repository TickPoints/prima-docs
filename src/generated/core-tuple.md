# Module `core::tuple`

The `Tuple` type and its method set (spec §4.4/§18.1).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4).
An immutable, fixed-length sequence of values (spec §4.4).
## `class Tuple`

- method `pub len(self) -> Integer` — The number of elements in `self`.
- method `pub get(self, index: Integer) -> Option<Value>` — The element at `index` (negative counts from the end), or `None`.
- method `pub count(self, value: Value) -> Integer` — The number of occurrences of `value` in `self`.
- method `pub index(self, value: Value) -> Integer` — The index of the first occurrence of `value`, or an error when absent.
- method `pub first(self) -> Option<Value>` — The first element, or `None` when empty.
- method `pub last(self) -> Option<Value>` — The last element, or `None` when empty.

