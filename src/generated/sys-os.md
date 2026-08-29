# Module `sys::os`

`sys::os`: operating-system identification and control (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `sys::os::<name>`.
The name of the operating system (e.g. `"linux"`, `"windows"`).
## `pub fn name() -> String`

The CPU architecture (e.g. `"x86_64"`, `"aarch64"`).
## `pub fn arch() -> String`

Terminate the process with the given exit `code`.
## `pub fn exit(code: Integer)`

