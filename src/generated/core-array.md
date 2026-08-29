# Module `core::array`

The `Array` type and its method set (spec §11.3).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). The method set follows the stable
Python 3 `list` methods, adapted to Prima naming. Read-only methods are native; mutating methods
write back through the receiver binding (spec §11.3); `copy` is layered (`@builtin(O2)`, spec
§18.4) with a `.pra` fallback of the same semantics.
A heterogeneous, growable array (spec §11.3): value-semantic copies; mutating methods write back.
## `class Array`

- method `pub len(self) -> Integer` — Returns the number of elements in `self`.
- method `pub is_empty(self) -> Bool` — Returns `true` when `self` has no elements.
- method `pub get(self, index: Integer) -> Option<Value>` — The element at `index` (negative counts from the end), or `None` when out of range.
- method `pub contains(self, value: Value) -> Bool` — Returns `true` when `self` contains `value` (element equality).
- method `pub index(self, value: Value) -> Integer` — The index of the first occurrence of `value`, or an error when absent.
- method `pub count(self, value: Value) -> Integer` — The number of occurrences of `value` in `self`.
- method `pub first(self) -> Option<Value>` — The first element, or `None` when empty.
- method `pub last(self) -> Option<Value>` — The last element, or `None` when empty.
- method `pub copy(self) -> Array<Value>` — A shallow copy of `self`.
- method `pub push(self, value: Value) -> Nil` — Append `value` to the end of `self`.
- method `pub pop(self) -> Option<Value>` — Remove and return the last element, or `None` when empty.
- method `pub append(self, value: Value) -> Nil` — Append `value` to the end of `self` (alias of `push`).
- method `pub extend(self, other: Array<Value>) -> Nil` — Append every element of `other` to the end of `self`.
- method `pub insert(self, index: Integer, value: Value) -> Nil` — Insert `value` at `index`, shifting later elements right.
- method `pub remove(self, index: Integer) -> Nil` — Remove the element at `index` (negative counts from the end); errors when out of range.
- method `pub clear(self) -> Nil` — Remove every element from `self`.
- method `pub sort(self) -> Nil` — Sort `self` in place (spec §11.3).
- method `pub reverse(self) -> Nil` — Reverse `self` in place (spec §11.3).

