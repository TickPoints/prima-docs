# Prima Standard Library

Reference documentation for the **Prima** standard library, a symbol-first
scientific computing language ([source repository](https://github.com/TickPoints/prima-language)).

This site is **auto-generated from the toolchain itself**: the stdlib is a set
of embedded `.pra` signature modules (`linalg`, `stats`, `io`, `plot`, `sys`,
`time`, `num`) plus the builtin value classes (`String`, `Array`, `Dict`,
`Set`, `Number`, `Char`, `Tuple`, `Option`, `Result`), and `prima doc --stdlib`
renders each module's `///` comments into Markdown. The pages under
*Generated Reference* are rebuilt automatically whenever a new `prima` release
is published; the version stamp below records the release that produced them.

| Document | Description |
|---|---|
| [Language specification v2.3](https://github.com/TickPoints/prima-language/blob/main/docs/SPECIFICATIONS-zh_CN.md) | Full language spec (Chinese, authoritative) |
| [Implementation plan v2.3](https://github.com/TickPoints/prima-language/blob/main/docs/IMPLEMENTATION-zh_CN.md) | Toolchain implementation plan (Chinese, authoritative) |
| [Module index](./generated/modules.md) | All stdlib modules, one page per module |
| [Builtin classes](./generated/classes.md) | Builtin value class methods (`String`, `Array`, ...) |
