# Module `sys::path`

`sys::path`: filesystem path helpers (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `sys::path::<name>`. Paths are platform-native strings.

Join two path components with the platform separator.

## `pub fn join(a: String, b: String) -> String`

The final component of `p`, or `None` when it has none.

## `pub fn file_name(p: String) -> Option<String>`

The extension of `p` (without the dot), or `None`.

## `pub fn extension(p: String) -> Option<String>`

The parent directory of `p`, or `None` when there is none.

## `pub fn parent(p: String) -> Option<String>`

Whether `p` is an absolute path.

## `pub fn is_absolute(p: String) -> Bool`

Resolve `p` to a canonical absolute path.

## `pub fn canonicalize(p: String) -> Result<String, String>`

