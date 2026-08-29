# Module `core::char`

The `Char` type and its method set (spec §18.1).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). `is_digit` is layered
(`@builtin(O2)`, spec §18.4): its `.pra` fallback is `self.code() >= 48 && self.code() <= 57`,
matching the native ASCII-digit predicate.
A single Unicode scalar value (spec §4.6).
## `class Char`

- method `pub len(self) -> Integer` — `1` (a char is one scalar value).
- method `pub is_digit(self) -> Bool` — `true` when `self` is an ASCII decimal digit (`0`–`9`).
- method `pub is_alpha(self) -> Bool` — `true` when `self` is an alphabetic character.
- method `pub is_alnum(self) -> Bool` — `true` when `self` is alphanumeric.
- method `pub is_upper(self) -> Bool` — `true` when `self` is an uppercase character.
- method `pub is_lower(self) -> Bool` — `true` when `self` is a lowercase character.
- method `pub is_space(self) -> Bool` — `true` when `self` is whitespace.
- method `pub is_ascii(self) -> Bool` — `true` when `self` is an ASCII character.
- method `pub to_upper(self) -> Char` — The uppercase form of `self` (first code point of a multi-char expansion).
- method `pub to_lower(self) -> Char` — The lowercase form of `self` (first code point of a multi-char expansion).
- method `pub to_string(self) -> String` — `self` as a one-character string.
- method `pub code(self) -> Integer` — The Unicode scalar value of `self` (`ord`).

