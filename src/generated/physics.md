# Module `physics`

`physics`: CODATA 2022 constants, elementary physics formulas, and `Vector3` (spec §7.3 / §18.6).

Constants whose SI definition is exact keep their `Integer`/`Rational` form (spec §6.1); the
CODATA-measured values are `F64`. The formulas below are signature-only `@builtin`
declarations; each binds to a Rust-hosted implementation registered under `physics::<name>`
(spec §18.4/§18.6). `Vector3` is written directly in `.pra`.

Speed of light in vacuum `c`, m/s (SI-exact).

## `pub const speed_of_light: Integer`

Planck constant `h`, J·s (SI-exact).

## `pub const planck_const: Rational`

Reduced Planck constant `ħ = h / (2π)`, J·s (measured `F64`).

## `pub const reduced_planck: F64`

Boltzmann constant `k_B`, J/K (SI-exact).

## `pub const boltzmann_const: Rational`

Newtonian constant of gravitation `G`, m³/(kg·s²) (measured `F64`).

## `pub const gravitational_const: F64`

Elementary charge `e`, C (SI-exact).

## `pub const elementary_charge: Rational`

Vacuum electric permittivity `ε₀`, F/m (measured `F64`).

## `pub const vacuum_permittivity: F64`

Vacuum magnetic permeability `μ₀`, N/A² (measured `F64`).

## `pub const vacuum_permeability: F64`

Fine-structure constant `α`, dimensionless (measured `F64`).

## `pub const fine_structure: F64`

Avogadro constant `N_A`, 1/mol (SI-exact).

## `pub const avogadro_const: Integer`

Molar gas constant `R`, J/(mol·K) (SI-exact).

## `pub const gas_const: Rational`

Atomic mass constant `m_u`, kg (measured `F64`).

## `pub const atomic_mass_unit: F64`

Electron rest mass `m_e`, kg (measured `F64`).

## `pub const electron_mass: F64`

Proton rest mass `m_p`, kg (measured `F64`).

## `pub const proton_mass: F64`

Neutron rest mass `m_n`, kg (measured `F64`).

## `pub const neutron_mass: F64`

Rydberg constant `R_∞`, 1/m (measured `F64`).

## `pub const rydberg: F64`

Bohr radius `a₀`, m (measured `F64`).

## `pub const bohr_radius: F64`

Bohr magneton `μ_B`, J/T (measured `F64`).

## `pub const bohr_magneton: F64`

Standard acceleration of gravity `g`, m/s² (SI-exact value kept as `F64`).

## `pub const standard_gravity: F64`

Stefan–Boltzmann constant `σ`, W/(m²·K⁴) (measured `F64`).

## `pub const stefan_boltzmann: F64`

Standard atmosphere `atm`, Pa (SI-exact).

## `pub const standard_atmosphere: Integer`

Final speed after time `t` at constant acceleration `a` starting from `u`: `u + a·t`.

## `pub fn velocity(u: F64, a: F64, t: F64) -> F64`

Displacement after time `t` at constant acceleration `a` starting from `u`: `u·t + a·t²/2`.

## `pub fn displacement(u: F64, a: F64, t: F64) -> F64`

Horizontal range of a projectile launched at speed `v0` and angle `theta` (radians) under
gravity `g`: `v0²·sin(2θ)/g`.

## `pub fn projectile_range(v0: F64, theta: F64, g: F64) -> F64`

Maximum height of a projectile launched at speed `v0` and angle `theta` (radians) under
gravity `g`: `(v0·sin θ)²/(2g)`.

## `pub fn projectile_height(v0: F64, theta: F64, g: F64) -> F64`

Newton's second law: force from mass `m` and acceleration `a`: `m·a`.

## `pub fn force(m: F64, a: F64) -> F64`

Linear momentum from mass `m` and velocity `v`: `m·v`.

## `pub fn momentum(m: F64, v: F64) -> F64`

Kinetic energy from mass `m` and speed `v`: `½·m·v²`.

## `pub fn kinetic_energy(m: F64, v: F64) -> F64`

Gravitational potential energy from mass `m`, gravity `g`, and height `h`: `m·g·h`.

## `pub fn potential_energy(m: F64, g: F64, h: F64) -> F64`

Work done by a constant force `f` over displacement `d`: `f·d`.

## `pub fn work(f: F64, d: F64) -> F64`

Average power for work `work` done over time `t`: `work/t`.

## `pub fn power(work: F64, t: F64) -> F64`

SHM displacement at time `t`: `A·cos(ω·t)`.

## `pub fn shm_displacement(amplitude: F64, omega: F64, t: F64) -> F64`

SHM velocity at time `t`: `-A·ω·sin(ω·t)`.

## `pub fn shm_velocity(amplitude: F64, omega: F64, t: F64) -> F64`

Total mechanical energy of a harmonic oscillator: `½·m·ω²·A²`.

## `pub fn shm_energy(m: F64, omega: F64, amplitude: F64) -> F64`

Small-angle period of a simple pendulum of length `L` under gravity `g`: `2π·√(L/g)`.

## `pub fn simple_pendulum(length: F64, g: F64) -> F64`

Convert a Celsius temperature to kelvin: `c + 273.15`.

## `pub fn celsius_to_kelvin(c: F64) -> F64`

Convert a kelvin temperature to Celsius: `k - 273.15`.

## `pub fn kelvin_to_celsius(k: F64) -> F64`

Heat transferred to a body: `m·c·ΔT`.

## `pub fn heat(m: F64, c: F64, delta_t: F64) -> F64`

Ideal-gas pressure from amount `n` (mol), temperature `T` (K), and volume `V` (m³):
`n·k_B·T/V`, using the Boltzmann constant.

## `pub fn ideal_gas_pressure(n: F64, temperature: F64, volume: F64) -> F64`

Coulomb force between charges `q1` and `q2` separated by distance `r`:
`k_e·q1·q2/r²`, with `k_e = 1/(4π·ε₀)` derived from the CODATA `vacuum_permittivity`.

## `pub fn coulomb_force(q1: F64, q2: F64, r: F64) -> F64`

Ohm's law: voltage across resistance `r` carrying current `i`: `i·r`.

## `pub fn ohm_voltage(i: F64, r: F64) -> F64`

Ohm's law: current through resistance `r` under voltage `v`: `v/r`.

## `pub fn ohm_current(v: F64, r: F64) -> F64`

Ohm's law: resistance carrying current `i` under voltage `v`: `v/i`.

## `pub fn ohm_resistance(v: F64, i: F64) -> F64`

Electric power from voltage `v` and current `i`: `v·i`.

## `pub fn electrical_power(v: F64, i: F64) -> F64`

A 3-component vector over `F64` with the usual vector algebra.

## `pub class Vector3`

- field `pub x: F64` — The x component.
- field `pub y: F64` — The y component.
- field `pub z: F64` — The z component.
- method `pub new(x: F64, y: F64, z: F64) -> Self` — Construct a vector from its three components.
- method `pub add(self, o: Vector3) -> Vector3` — Component-wise sum `self + o`.
- method `pub sub(self, o: Vector3) -> Vector3` — Component-wise difference `self - o`.
- method `pub scale(self, s: F64) -> Vector3` — Scalar multiple `s·self`.
- method `pub dot(self, o: Vector3) -> F64` — Dot product `self · o`.
- method `pub cross(self, o: Vector3) -> Vector3` — Right-handed cross product `self × o`.
- method `pub length(self) -> F64` — Euclidean length `|self|`.
- method `pub normalize(self) -> Vector3` — Unit vector in the direction of `self`; the zero vector is returned unchanged.

