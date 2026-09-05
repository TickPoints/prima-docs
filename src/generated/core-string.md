# Module `core::string`

The `String` type and its method set (spec §18.1).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). The method set follows the stable
Python 3 `str` methods, adapted to Prima naming; hot methods are layered (`@builtin(ON)`, spec
§18.4) with a Rust fast path, and low-frequency readable methods are written directly in `.pra`.

Associated functions: `String::new()` (empty string) and `String::from(x)` (any value rendered
with f-string semantics); `from` is a keyword so it is not declared as a member here.

Naming/semantics notes: `split("")` returns the array of single characters (Python `list(s)`);
`casefold` is a simplified lowercase (Python `casefold` also folds e.g. `ß` → `ss`);
`is_digit` uses Unicode `Numeric` (Python `isdigit` excludes fractions).

A UTF-8 string value (value-semantic copies; methods return new strings).

## `class String`

- method `pub new() -> Self` — An empty string.
- method `pub len(self) -> Integer` — Returns the number of Unicode scalar values in `self`.
- method `pub is_empty(self) -> Bool` — Returns `true` when `self` is the empty string.
- method `pub push(self, s: String) -> String` — Append `s` to the end of `self`, returning the new string.
- method `pub insert(self, index: Integer, s: String) -> Result<String, String>` — Insert `s` at `index` (in Unicode scalar values); errors when out of range.
- method `pub char_at(self, index: Integer) -> Option<Char>` — The Unicode scalar value at `index`, or `None` when out of range.
- method `pub substring(self, start: Integer, end: Integer) -> String` — The substring in `[start, end)` measured in Unicode scalar values.
- method `pub contains(self, pat: String) -> Bool` — Returns `true` when `self` contains `pat` as a substring.
- method `pub to_upper(self) -> String` — An uppercase copy of `self`.
- method `pub to_lower(self) -> String` — A lowercase copy of `self`.
- method `pub repeat(self, n: Integer) -> String` — `self` repeated `n` times.
- method `pub trim(self) -> String` — Strip ASCII whitespace from both ends of `self`.
- method `pub lstrip(self, pat: String) -> String` — Strip any leading/trailing character present in `pat` from `self`.
- method `pub rstrip(self, pat: String) -> String` — Strip any trailing character present in `pat` from `self`.
- method `pub is_upper(self) -> Bool` — `true` when every cased character is uppercase and at least one is cased.
- method `pub is_lower(self) -> Bool` — `true` when every cased character is lowercase and at least one is cased.
- method `pub is_alpha(self) -> Bool` — `true` when non-empty and every character is alphabetic.
- method `pub is_digit(self) -> Bool` — `true` when non-empty and every character is a digit (Unicode `Numeric`).
- method `pub is_alnum(self) -> Bool` — `true` when non-empty and every character is alphanumeric.
- method `pub is_space(self) -> Bool` — `true` when non-empty and every character is whitespace.
- method `pub is_ascii(self) -> Bool` — `true` when every character is ASCII (the empty string is ASCII).
- method `pub capitalize(self) -> String` — First character uppercased, the rest lowercased.
- method `pub title(self) -> String` — Title-cased copy: the first cased character of each word is upper, the rest lower.
- method `pub swapcase(self) -> String` — Copy with each uppercase character lowercased and vice versa.
- method `pub casefold(self) -> String` — Lowercased copy (a simplified `casefold`; see module doc).
- method `pub split(self, sep: String) -> Array<String>` — Split `self` on `sep`, returning an array of substrings; `split("")` yields the characters.
- method `pub replace(self, old: String, new: String) -> String` — Replace every occurrence of `old` in `self` with `new` (non-overlapping).
- method `pub strip(self, pat: String) -> String` — Strip any leading/trailing character present in `pat` (a character set) from `self`.
- method `pub find(self, pat: String) -> Option<Integer>` — The char index of the first occurrence of `pat`, or `None`; `find("")` is `Some(0)`.
- method `pub join(self, parts: Array<String>) -> String` — Join the array of strings `parts` using `self` as the separator.
- method `pub starts_with(self, pat: String) -> Bool` — Returns `true` when `self` starts with `pat`.
- method `pub ends_with(self, pat: String) -> Bool` — Returns `true` when `self` ends with `pat`.
- method `pub count(self, pat: String) -> Integer` — The number of non-overlapping occurrences of `pat` in `self`; `count("")` is `len + 1`.
- method `pub rfind(self, pat: String) -> Option<Integer>` — The char index of the last occurrence of `pat`, or `None`; `rfind("")` is `len`.
- method `pub removeprefix(self, prefix: String) -> String` — `self` without the `prefix`, or unchanged when it does not start with `prefix`.
- method `pub removesuffix(self, suffix: String) -> String` — `self` without the `suffix`, or unchanged when it does not end with `suffix`.
- method `pub ljust(self, width: Integer, fill: String) -> String` — Left-pad with `fill` (repeated) to at least `width` characters.
- method `pub rjust(self, width: Integer, fill: String) -> String` — Right-pad with `fill` (repeated) to at least `width` characters.
- method `pub center(self, width: Integer, fill: String) -> String` — Center `self` in `width` columns, padding with `fill` (extra goes right).
- method `pub zfill(self, width: Integer) -> String` — Zero-pad on the left (after any leading `+`/`-`) to at least `width` characters.
- method `pub splitlines(self) -> Array<String>` — Split on line boundaries (`\n`, with a trailing `\r` stripped), keeping no trailing empty line.
- method `pub expandtabs(self, tabsize: Integer) -> String` — Expand tab characters to the next multiple of `tabsize` columns.
- method `pub partition(self, sep: String) -> Tuple<String, String, String>` — Split at the first occurrence of `sep` into `(head, sep, tail)`; `("", "", "")` when absent.
- method `pub rpartition(self, sep: String) -> Tuple<String, String, String>` — Split at the last occurrence of `sep` into `(head, sep, tail)`; `("", "", "")` when absent.

