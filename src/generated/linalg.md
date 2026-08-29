# Module `linalg`

`linalg`: dense matrix operations (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `linalg::<name>` / `linalg::Matrix::<name>`.
Create a `rows` x `cols` matrix filled with zeros.
## `pub fn Matrix::zeros(rows: Integer, cols: Integer) -> Matrix<F64>`

Create a `rows` x `cols` matrix filled with ones.
## `pub fn Matrix::ones(rows: Integer, cols: Integer) -> Matrix<F64>`

Create the `n` x `n` identity matrix.
## `pub fn Matrix::identity(n: Integer) -> Matrix<F64>`

Create a square diagonal matrix with the given diagonal entries.
## `pub fn Matrix::diagonal(values: Array<F64>) -> Matrix<F64>`

Build a matrix from its rows (each inner array is one row).
## `pub fn Matrix::from_rows(data: Array<Array<F64>>) -> Matrix<F64>`

Build a matrix from its columns (each inner array is one column).
## `pub fn Matrix::from_cols(data: Array<Array<F64>>) -> Matrix<F64>`

Return the transpose of `M`.
## `pub fn transpose(M: Matrix<F64>) -> Matrix<F64>`

Return the inverse of square `M`; errors when `M` is singular.
## `pub fn inverse(M: Matrix<F64>) -> Matrix<F64>`

Compute the determinant of square `M`.
## `pub fn determinant(M: Matrix<F64>) -> F64`

Compute the trace (sum of diagonal entries) of `M`.
## `pub fn trace(M: Matrix<F64>) -> F64`

Compute the rank of `M`.
## `pub fn rank(M: Matrix<F64>) -> Integer`

Compute the `p`-norm of a matrix or a vector.
## `pub fn norm(M: Value, p: Integer) -> F64`

Compute the condition number of `M` (largest over smallest singular value).
## `pub fn cond(M: Matrix<F64>) -> F64`

Compute the dot product of two vectors.
## `pub fn dot(v1: Array<F64>, v2: Array<F64>) -> F64`

Compute the cross product of two 3-vectors.
## `pub fn cross(v1: Array<F64>, v2: Array<F64>) -> Array<F64>`

Factor `M` as `P A = L U`; returns the lower and upper triangular factors.
## `pub fn lu(M: Matrix<F64>) -> Tuple<Matrix<F64>, Matrix<F64>>`

Compute the QR factorization of `M`; returns `(Q, R)`.
## `pub fn qr(M: Matrix<F64>) -> Tuple<Matrix<F64>, Matrix<F64>>`

Compute the singular value decomposition `M = U S V`; returns `(U, singular values, V)`.
## `pub fn svd(M: Matrix<F64>) -> Tuple<Matrix<F64>, Array<F64>, Matrix<F64>>`

Compute eigenvalues and eigenvectors of `M`; returns `(eigenvalues, eigenvectors)`.
## `pub fn eigen(M: Matrix<F64>) -> Tuple<Array<F64>, Matrix<F64>>`

Compute the Cholesky factorization of a positive-definite `M`.
## `pub fn cholesky(M: Matrix<F64>) -> Matrix<F64>`

Solve `A x = b` for a matrix or vector right-hand side.
## `pub fn solve(A: Matrix<F64>, b: Value) -> Value`

Solve the least-squares problem `min_x ||A x - b||`.
## `pub fn lstsq(A: Matrix<F64>, b: Value) -> Value`

