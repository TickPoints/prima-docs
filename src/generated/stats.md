# Module `stats`

`stats`: descriptive statistics and probability distributions (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `stats::<name>`. Distribution constructors return a
descriptor `Dict`; `quantile` is overloaded on a data array or a distribution descriptor.

Arithmetic mean of `data`.

## `pub fn mean(data: Array<F64>) -> F64`

Median of `data`.

## `pub fn median(data: Array<F64>) -> F64`

Most frequent value of `data`.

## `pub fn mode(data: Array<F64>) -> F64`

Sample variance of `data`.

## `pub fn variance(data: Array<F64>) -> F64`

Sample standard deviation of `data`.

## `pub fn std(data: Array<F64>) -> F64`

The `q`-quantile (0 <= q <= 1) of `data`.

## `pub fn quantile(data: Array<F64>, q: F64) -> F64`

The `p`-th percentile (0 <= p <= 100) of `data`.

## `pub fn percentile(data: Array<F64>, p: F64) -> F64`

`max(data) - min(data)`.

## `pub fn range(data: Array<F64>) -> F64`

Minimum of `data`.

## `pub fn min(data: Array<F64>) -> F64`

Maximum of `data`.

## `pub fn max(data: Array<F64>) -> F64`

Covariance of paired samples `x` and `y`.

## `pub fn cov(x: Array<F64>, y: Array<F64>) -> F64`

Pearson correlation coefficient of paired samples `x` and `y`.

## `pub fn corr(x: Array<F64>, y: Array<F64>) -> F64`

Spearman rank correlation of paired samples `x` and `y`.

## `pub fn spearman(x: Array<F64>, y: Array<F64>) -> F64`

Construct a normal (Gaussian) distribution descriptor with mean `mu` and std `sigma`.

## `pub fn Normal(mu: F64, sigma: F64) -> Dict`

Construct a uniform distribution descriptor on `[a, b]`.

## `pub fn Uniform(a: F64, b: F64) -> Dict`

Construct an exponential distribution descriptor with rate `lambda`.

## `pub fn Exponential(lambda: F64) -> Dict`

Construct a binomial distribution descriptor with `n` trials and success probability `p`.

## `pub fn Binomial(n: Integer, p: F64) -> Dict`

Construct a Poisson distribution descriptor with rate `lambda`.

## `pub fn Poisson(lambda: F64) -> Dict`

Probability density of `x` under the distribution `dist`.

## `pub fn pdf(dist: Dict, x: F64) -> F64`

Cumulative distribution function of `x` under `dist`.

## `pub fn cdf(dist: Dict, x: F64) -> F64`

The `p`-quantile (0 <= p <= 1) of the distribution `dist`.

## `pub fn quantile(dist: Dict, p: F64) -> F64`

Draw `n` random samples from `dist`.

## `pub fn sample(dist: Dict, n: Integer) -> Array<F64>`

