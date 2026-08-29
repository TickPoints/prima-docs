# Module `core::set`

The `Set` type and its method set (spec §11.6).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). The method set follows the stable
Python 3 `set` methods, adapted to Prima naming. Read-only methods are native; mutating methods
write back through the receiver binding (spec §11.6); `symmetric_difference` is layered
(`@builtin(O2)`, spec §18.4) with a `.pra` fallback of the same semantics.
A deduplicated collection of hashable elements (spec §11.6); mutating methods write back.
## `class Set`

- method `pub len(self) -> Integer` — Returns the number of elements in `self`.
- method `pub contains(self, value: Value) -> Bool` — Returns `true` when `value` is an element.
- method `pub union(self, other: Set) -> Set` — The union of `self` and `other`.
- method `pub intersection(self, other: Set) -> Set` — The intersection of `self` and `other`.
- method `pub difference(self, other: Set) -> Set` — The elements of `self` not in `other`.
- method `pub symmetric_difference(self, other: Set) -> Set` — The symmetric difference of `self` and `other`.
- method `pub issubset(self, other: Set) -> Bool` — `true` when every element of `self` is in `other`.
- method `pub issuperset(self, other: Set) -> Bool` — `true` when every element of `other` is in `self`.
- method `pub isdisjoint(self, other: Set) -> Bool` — `true` when `self` and `other` share no elements.
- method `pub copy(self) -> Set` — A shallow copy of `self`.
- method `pub add(self, value: Value) -> Nil` — Insert `value`.
- method `pub remove(self, value: Value) -> Nil` — Remove `value`; errors when absent (R0013).
- method `pub discard(self, value: Value) -> Nil` — Remove `value` if present (silent when absent).
- method `pub pop(self) -> Option<Value>` — Remove and return an arbitrary element, or `None` when empty.
- method `pub clear(self) -> Nil` — Remove every element from `self`.
- method `pub update(self, other: Value) -> Nil` — Add every element of the given set or array to `self`.

