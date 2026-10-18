# Module `mem`

The `mem` module (spec §12.3/§12.4): explicit reference counting.

Import explicitly with `import mem;`. `mem::Arc` wraps a payload and keeps a count that is
raised only by `clone()`; `let b = a` shares the same class-instance handle and does not
change the count (spec §12.3). The count is `1 + clone calls` and never decreases: the host
layer has no destructor hooks.

An explicitly reference-counted handle (spec §12.3).

The count starts at 1 in `new`, `clone` raises it by one, `get` returns the payload, and
`strong_count` reports the current value. `let b = a` shares the handle without counting.

## `pub class Arc`

- field `value: Value` — The payload held by this handle.
- field `count: Integer` — The explicit reference count (monotonically non-decreasing).
- method `pub new(x: Value) -> Self` — Wrap `x` in an `Arc` with count 1.
- method `pub clone(self) -> Self` — Return the same payload and raise the explicit count by one.
- method `pub get(self) -> Value` — The payload held by this handle.
- method `pub strong_count(self) -> Integer` — The current explicit reference count (`1 + clone calls`).

