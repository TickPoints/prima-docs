# Module `time`

`time`: wall-clock time and durations (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `time::<name>` / `time::Duration::<name>`. Times and durations
are numbers (unix seconds; durations may be fractional).
The current wall-clock time as a unix timestamp (seconds).
## `pub fn now() -> Integer`

Sleep for `secs` seconds (may be fractional).
## `pub fn sleep(secs: F64)`

Convert a `Number` time to a whole-number unix timestamp.
## `pub fn unix_timestamp(t: Number) -> Integer`

Format a time `t` with a `strftime`-style format string.
## `pub fn format(t: Number, fmt: String) -> String`

Parse a time `s` with a `strftime`-style format string.
## `pub fn parse(s: String, fmt: String) -> Result<Number, String>`

Build a duration of `n` whole seconds.
## `pub fn Duration::from_secs(n: Integer) -> Number`

Build a duration of `n` milliseconds.
## `pub fn Duration::from_millis(n: Integer) -> Number`

