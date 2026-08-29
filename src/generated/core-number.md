# Module `core::number`

The `Number` type and its method set (spec §9/§18.1).

Method list and usage are maintained here; the `///` comments are the single source of truth
and feed `prima doc` and diagnostic notes (spec §4.1/§16.4). The conversions and rounding forms
are the collapse family (spec §9.2–9.6) also available as free functions (`to_f64(x)`); the
predicates/accessors (`is_integer`/`abs`/`numerator`/...) are numeric methods (spec §18.1).
Numeric methods are native: they are the compute hotspots and mostly not expressible in `.pra`.
A number in the exact tower `Integer < Rational < Real < Complex` or a fixed-width collapse.
## `class Number`

- method `pub to_f32(self) -> F32` — Collapse to a 32-bit float (spec §9.2).
- method `pub to_f64(self) -> F64` — Collapse to a 64-bit float (spec §9.2).
- method `pub to_bigint(self) -> Integer` — Collapse to an arbitrary-precision integer (spec §9.2).
- method `pub to_rational(self) -> Rational` — Collapse to an arbitrary-precision rational (spec §9.2).
- method `pub to_bigfloat(self) -> F64` — Collapse to a 64-bit float (spec §9.2, legacy).
- method `pub to_complex(self) -> Complex` — Promote to a complex number (spec §9.2).
- method `pub to_i8(self) -> I8` — Collapse to `I8`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_i16(self) -> I16` — Collapse to `I16`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_i32(self) -> I32` — Collapse to `I32`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_i64(self) -> I64` — Collapse to `I64`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_i128(self) -> I128` — Collapse to `I128`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_u8(self) -> U8` — Collapse to `U8`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_u16(self) -> U16` — Collapse to `U16`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_u32(self) -> U32` — Collapse to `U32`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_u64(self) -> U64` — Collapse to `U64`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_u128(self) -> U128` — Collapse to `U128`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_isize(self) -> Isize` — Collapse to `Isize`, erroring on overflow or non-integral values (spec §9.2).
- method `pub to_usize(self) -> Usize` — Collapse to `Usize`, erroring on overflow or non-integral values (spec §9.2).
- method `pub try_f64(self) -> Result<F64, String>` — Collapse to `F64`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_f32(self) -> Result<F32, String>` — Collapse to `F32`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_i8(self) -> Result<I8, String>` — Collapse to `I8`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_i16(self) -> Result<I16, String>` — Collapse to `I16`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_i32(self) -> Result<I32, String>` — Collapse to `I32`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_i64(self) -> Result<I64, String>` — Collapse to `I64`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_i128(self) -> Result<I128, String>` — Collapse to `I128`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_u8(self) -> Result<U8, String>` — Collapse to `U8`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_u16(self) -> Result<U16, String>` — Collapse to `U16`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_u32(self) -> Result<U32, String>` — Collapse to `U32`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_u64(self) -> Result<U64, String>` — Collapse to `U64`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_u128(self) -> Result<U128, String>` — Collapse to `U128`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_isize(self) -> Result<Isize, String>` — Collapse to `Isize`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_usize(self) -> Result<Usize, String>` — Collapse to `Usize`, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_bigint(self) -> Result<Integer, String>` — Collapse to an integer, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_rational(self) -> Result<Rational, String>` — Collapse to a rational, returning a `Result` instead of erroring (spec §9.3).
- method `pub try_complex(self) -> Result<Complex, String>` — Collapse to a complex number, returning a `Result` instead of erroring (spec §9.3).
- method `pub checked_i8(self) -> Result<I8, String>` — `I8` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_i16(self) -> Result<I16, String>` — `I16` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_i32(self) -> Result<I32, String>` — `I32` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_i64(self) -> Result<I64, String>` — `I64` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_i128(self) -> Result<I128, String>` — `I128` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_u8(self) -> Result<U8, String>` — `U8` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_u16(self) -> Result<U16, String>` — `U16` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_u32(self) -> Result<U32, String>` — `U32` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_u64(self) -> Result<U64, String>` — `U64` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_u128(self) -> Result<U128, String>` — `U128` collapse that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_add(self, other: Integer) -> Result<Integer, String>` — Integer addition that reports overflow, returning a `Result` (spec §9.4).
- method `pub checked_mul(self, other: Integer) -> Result<Integer, String>` — Integer multiplication that reports overflow, returning a `Result` (spec §9.4).
- method `pub clamped_i8(self) -> I8` — Clamp to `I8`, forcing the value into range (spec §9.5).
- method `pub clamped_i16(self) -> I16` — Clamp to `I16`, forcing the value into range (spec §9.5).
- method `pub clamped_i32(self) -> I32` — Clamp to `I32`, forcing the value into range (spec §9.5).
- method `pub clamped_i64(self) -> I64` — Clamp to `I64`, forcing the value into range (spec §9.5).
- method `pub clamped_i128(self) -> I128` — Clamp to `I128`, forcing the value into range (spec §9.5).
- method `pub clamped_u8(self) -> U8` — Clamp to `U8`, forcing the value into range (spec §9.5).
- method `pub clamped_u16(self) -> U16` — Clamp to `U16`, forcing the value into range (spec §9.5).
- method `pub clamped_u32(self) -> U32` — Clamp to `U32`, forcing the value into range (spec §9.5).
- method `pub clamped_u64(self) -> U64` — Clamp to `U64`, forcing the value into range (spec §9.5).
- method `pub clamped_u128(self) -> U128` — Clamp to `U128`, forcing the value into range (spec §9.5).
- method `pub clamped_f32(self) -> F32` — Clamp to `F32`, forcing the value into range (spec §9.5).
- method `pub clamped_f64(self) -> F64` — Clamp to `F64`, forcing the value into range (spec §9.5).
- method `pub rounded(self, digits: Integer) -> F64` — Round to `digits` decimal places (spec §9.6).
- method `pub truncated(self) -> Integer` — Truncate toward zero to an integer (spec §9.6).
- method `pub abs(self) -> Number` — The absolute value; for complex numbers the magnitude.
- method `pub sign(self) -> Integer` — `-1`/`0`/`1` for negative/zero/positive (real numbers only).
- method `pub floor(self) -> Number` — The largest integer `<= self`.
- method `pub ceil(self) -> Number` — The smallest integer `>= self`.
- method `pub round(self) -> Number` — The nearest integer (half away from zero).
- method `pub sqrt(self) -> Number` — The square root (exact where possible, otherwise a float); complex errors.
- method `pub numerator(self) -> Integer` — The numerator of `self` as a rational.
- method `pub denominator(self) -> Integer` — The denominator of `self` as a rational.
- method `pub real(self) -> Number` — The real part of `self`.
- method `pub imag(self) -> Number` — The imaginary part of `self`.
- method `pub bit_length(self) -> Integer` — The number of bits in the two's-complement representation of an integer.
- method `pub is_integer(self) -> Bool` — `true` when `self` is an integer value.
- method `pub is_rational(self) -> Bool` — `true` when `self` is an exact integer or rational.
- method `pub is_real(self) -> Bool` — `true` when `self` is not complex.
- method `pub is_complex(self) -> Bool` — `true` when `self` is complex.
- method `pub is_positive(self) -> Bool` — `true` when `self` is greater than zero (real numbers only).
- method `pub is_negative(self) -> Bool` — `true` when `self` is less than zero (real numbers only).
- method `pub is_zero(self) -> Bool` — `true` when `self` is zero.
- method `pub is_even(self) -> Bool` — `true` when `self` is an even integer.
- method `pub is_odd(self) -> Bool` — `true` when `self` is an odd integer.
- method `pub is_finite(self) -> Bool` — `true` when `self` is finite (not `±Inf`/`NaN`).
- method `pub is_nan(self) -> Bool` — `true` when `self` is `NaN`.

