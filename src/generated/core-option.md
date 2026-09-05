# Module `core::option`

The `Option` type and its method set (spec §16.3/§18.1).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). All methods are native (the
collapse family, spec §9.3): `unwrap`/`unwrap_or`/`expect` discard the error per spec §16.3.

An optional value: `Some(v)` or `None` (spec §4.4).

## `class Option`

- method `pub is_some(self) -> Bool` — `true` when `self` carries a value.
- method `pub is_none(self) -> Bool` — `true` when `self` is `None`.
- method `pub unwrap(self) -> Value` — The inner value, panicking on `None`.
- method `pub unwrap_or(self, default: Value) -> Value` — The inner value, or `default` on `None`.
- method `pub expect(self, message: String) -> Value` — The inner value, panicking with `message` on `None`.

