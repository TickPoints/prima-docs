# Module `core::result`

The `Result` type and its method set (spec §16.1/§16.3/§18.1).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). All methods are native (the
collapse family, spec §9.3): `unwrap`/`unwrap_or`/`expect` discard the error per spec §16.3.

A success (`Ok(v)`) or failure (`Err(msg)`) value (spec §4.4/§16.1).

## `class Result`

- method `pub is_ok(self) -> Bool` — `true` when `self` is `Ok`.
- method `pub is_err(self) -> Bool` — `true` when `self` is `Err`.
- method `pub unwrap(self) -> Value` — The `Ok` value, panicking on `Err`.
- method `pub unwrap_or(self, default: Value) -> Value` — The `Ok` value, or `default` on `Err`.
- method `pub expect(self, message: String) -> Value` — The `Ok` value, panicking with `message` on `Err`.
- method `pub value_or(self, default: Value) -> Value` — The `Ok` value, or `default` on `Err` (a non-panicking `unwrap_or`).

