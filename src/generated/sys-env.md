# Module `sys::env`

`sys::env`: process environment access (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `sys::env::<name>`.

The current user's home directory, when known.

## `pub fn home_dir() -> Option<String>`

The value of the environment variable `name`, when set.

## `pub fn get(name: String) -> Option<String>`

The command-line arguments of the current process.

## `pub fn args() -> Array<String>`

The process's current working directory.

## `pub fn current_dir() -> String`

