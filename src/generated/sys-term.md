# Module `sys::term`

`sys::term`: terminal size and TTY detection (spec §18.6).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `sys::term::<name>`.

The terminal size as a `Dict` with keys `"rows"` and `"cols"` (`Integer`). Falls back to
`(24, 80)` when stdout is not a TTY or the size cannot be detected.

## `pub fn size() -> Dict`

Whether stdout is a terminal.

## `pub fn is_tty() -> Bool`

