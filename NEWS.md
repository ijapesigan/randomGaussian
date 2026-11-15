# randomGaussian 0.9.3

## Efficiency

- `.RandomGaussianSVD()` multiplies the small `k` by `k` matrices first (`Z %*% (u %*% (t(v) * sqrt(d)))`):
  2.5 times faster at 1e5 draws and k = 10; differences below 1e-13.

# randomGaussian 0.9.2

## Template

- The rProject template; private `jeksterslab-psu/randomGaussian`, public `ijapesigan/randomGaussian`.
- `DESCRIPTION`: MIT, `Depends: R (>= 3.0.0)`, `Imports: stats`, `VignetteBuilder: knitr`.
- The three C++ drafts of `src/` (`MVN-chol.cpp`, `MVN-eigen.cpp`, `MVN-SVD.cpp`) did not compile: each defined `SimMVN()`, there was no
  `useDynLib` or `RcppExports`, and the Cholesky draft called a function that does not exist.
  They moved to `.setup/notes/cpp-draft/` and are not part of the package; the R functions are unchanged.
- Complete roxygen for every function; the internal functions use `@noRd`.
- `RandomGaussian()` checks its arguments with `.CheckRandomGaussian()`; an unknown `decomposition` now stops with an
  error instead of failing on a missing object.
- Tests for every function.
- The old template files (`make-project.R`, `make-packages.R`, `latexsrc/`, `.github/workflows/*.yaml`, ...) are replaced by
  what `make project` writes; the tracked secret files are removed.
