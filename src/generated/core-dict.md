# Module `core::dict`

The `Dict` type and its method set (spec §11.6).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). The method set follows the stable
Python 3 `dict` methods, adapted to Prima naming. Read-only methods are native; mutating methods
write back through the receiver binding (spec §11.6); `copy` is layered (`@builtin(O2)`, spec
§18.4) with a `.pra` fallback of the same semantics.

An unordered key → value mapping with hashable keys (spec §11.6); mutating methods write back.

## `class Dict`

- method `pub len(self) -> Integer` — Returns the number of entries in `self`.
- method `pub get(self, key: Value) -> Option<Value>` — The value for `key`, or `None` when absent.
- method `pub contains(self, key: Value) -> Bool` — Returns `true` when `key` is present.
- method `pub keys(self) -> Array<Value>` — The keys of `self` in canonical order.
- method `pub values(self) -> Array<Value>` — The values of `self` in canonical key order.
- method `pub items(self) -> Array<Value>` — The `(key, value)` pairs of `self` in canonical order.
- method `pub copy(self) -> Dict` — A shallow copy of `self`.
- method `pub insert(self, key: Value, value: Value) -> Nil` — Insert or replace `key` with `value`.
- method `pub remove(self, key: Value) -> Option<Value>` — Remove `key`, returning its value, or `None` when absent.
- method `pub clear(self) -> Nil` — Remove every entry from `self`.
- method `pub update(self, other: Dict) -> Dict` — Merge `other` into `self` and return the merged dict.
- method `pub setdefault(self, key: Value, default: Value) -> Value` — The value for `key`, inserting `default` when absent (and returning it).
- method `pub popitem(self) -> Tuple<Value>` — Remove and return an arbitrary `(key, value)` pair; errors when empty.

