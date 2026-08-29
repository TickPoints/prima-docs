# Module `num`

`num`: number-theory and radix helpers (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `num::<name>`.
Greatest common divisor of `a` and `b`.
## `pub fn gcd(a: Integer, b: Integer) -> Integer`

Least common multiple of `a` and `b`.
## `pub fn lcm(a: Integer, b: Integer) -> Integer`

Whether `n` is a prime number.
## `pub fn is_prime(n: Integer) -> Bool`

The smallest prime strictly greater than `n`.
## `pub fn next_prime(n: Integer) -> Integer`

A uniform random integer in `[a, b]` inclusive.
## `pub fn random_integer(a: Integer, b: Integer) -> Integer`

Render `n` in the given `radix` (2..=36) as a string.
## `pub fn to_base(n: Integer, radix: Integer) -> String`

Parse `s` as an integer in the given `radix` (2..=36).
## `pub fn from_base(s: String, radix: Integer) -> Result<Integer, String>`

The `n`-th Fibonacci number (spec §18.4): a layered `@builtin(O1)`. A Rust fast path is used when
`opt_level >= O1`; otherwise this `.pra` body (a simple linear recurrence) is the fallback.
## `pub fn fibonacci(n: Integer) -> Integer`

