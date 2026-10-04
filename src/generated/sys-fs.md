# Module `sys::fs`

`sys::fs`: filesystem metadata and directory traversal (spec §18.6).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `sys::fs::<name>`. These functions read arbitrary paths with
the privileges of the host process; only run code you trust.

Whether `path` exists (a file, directory, or other entry).

## `pub fn exists(path: String) -> Bool`

Whether `path` is a regular file.

## `pub fn is_file(path: String) -> Bool`

Whether `path` is a directory.

## `pub fn is_dir(path: String) -> Bool`

The size of the file at `path` in bytes.

## `pub fn size(path: String) -> Result<Integer, String>`

The entry names in the directory `path`, sorted for determinism.

## `pub fn read_dir(path: String) -> Result<Array<String>, String>`

Filesystem metadata of `path` as a `Dict` with keys `"size"` (`Integer`), `"is_file"` (`Bool`),
`"is_dir"` (`Bool`), and `"modified"` (`F64` unix seconds, omitted when unavailable).

## `pub fn metadata(path: String) -> Result<Dict, String>`

