# Module `sys::term`

`sys::term`: terminal size and TTY detection (spec §18.6).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `sys::term::<name>`.

The terminal size as a `Dict` with keys `"rows"` and `"cols"` (`Integer`). Falls back to
`(24, 80)` when stdout is not a TTY or the size cannot be detected.

## `pub fn size() -> Dict`

Whether stdout is a terminal.

## `pub fn is_tty() -> Bool`

Enable or disable raw mode. Repeated calls with the same value have no effect.
Explicitly disable raw mode to restore the terminal; it is not restored automatically.
Returns an error if the terminal mode cannot be changed.

## `pub fn raw_mode(enable: Bool) -> Result<Nil, String>`

Whether raw mode was enabled successfully and has not yet been disabled.

## `pub fn is_raw() -> Bool`

