# Module `io`

`io`: file and data-format helpers (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `io::<name>`. File functions return `Result` (spec §16.2);
`Value` is a wildcard type the checker treats as "any" JSON value.
Read the whole file at `path` as a UTF-8 string.
## `pub fn read_file(path: String) -> Result<String, String>`

Write `content` to `path`, replacing an existing file.
## `pub fn write_file(path: String, content: String) -> Result<Bool, String>`

Read `path` line by line into an array of strings (without trailing newlines).
## `pub fn read_lines(path: String) -> Result<Array<String>, String>`

Whether a file or directory exists at `path`.
## `pub fn exists(path: String) -> Bool`

Parse `s` as JSON into a `Value` (arrays/objects become arrays/dicts).
## `pub fn json_parse(s: String) -> Result<Value, String>`

Serialize `v` to a JSON string.
## `pub fn json_stringify(v: Value) -> Result<String, String>`

Read a JSON file at `path` into a `Value`.
## `pub fn read_json(path: String) -> Result<Value, String>`

Serialize `v` to JSON and write it to `path`.
## `pub fn write_json(path: String, v: Value) -> Result<Bool, String>`

Parse `s` as CSV into a table of string cells.
## `pub fn csv_parse(s: String) -> Result<Array<Array<String>>, String>`

Serialize a table of string cells to CSV text.
## `pub fn csv_stringify(rows: Array<Array<String>>) -> Result<String, String>`

Read a CSV file at `path` into a table of string cells.
## `pub fn read_csv(path: String) -> Result<Array<Array<String>>, String>`

Write a table of string cells to `path` as CSV.
## `pub fn write_csv(path: String, rows: Array<Array<String>>) -> Result<Bool, String>`

