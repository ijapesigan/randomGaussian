# randomGaussian: Sampling from the Gaussian Distribution

## Description

Random variates from the multivariate Gaussian distribution in R (R Core
Team, 2026) using the Cholesky, eigen, or singular value decomposition
of the covariance matrix.

## Installation

You can install the development version of `randomGaussian` from
[GitHub](https://github.com/ijapesigan/randomGaussian) with:

\
`if`` ``(``!`[`require`](https://rdrr.io/r/base/library.html)`(`[`"pak"`](https://pak.r-lib.org/)`)``)`` `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"pak"``)`\
`pak``::`[`pkg_install`](https://pak.r-lib.org/reference/pkg_install.html)`(``"ijapesigan/randomGaussian"``)`

## Example

\
[`library`](https://rdrr.io/r/base/library.html)`(``package ``=`` ``"randomGaussian"``)`

A covariance matrix and a mean vector of three variables.

\
`k`` ``<-`` ``3`\
`sigma`` ``<-`` ``stats``::`[`toeplitz`](https://rdrr.io/r/stats/toeplitz.html)`(``x ``=`` ``(``k``:``1``)`` ``/`` ``k``)`\
`mu`` ``<-`` `[`c`](https://rdrr.io/r/base/c.html)`(``1``, ``2``, ``3``)`\
`sigma`\
`#>           [,1]      [,2]      [,3]`\
`#> [1,] 1.0000000 0.6666667 0.3333333`\
`#> [2,] 0.6666667 1.0000000 0.6666667`\
`#> [3,] 0.3333333 0.6666667 1.0000000`

[`RandomGaussian()`](https://ijapesigan.github.io/randomGaussian/reference/RandomGaussian.md)
draws `n` rows using the Cholesky decomposition by default. The
`decomposition` argument also accepts `"eigen"` and `"svd"`, which work
for positive semi-definite covariance matrices.

\
[`set.seed`](https://rdrr.io/r/base/Random.html)`(``seed ``=`` ``42``)`\
`x`` ``<-`` `[`RandomGaussian`](https://ijapesigan.github.io/randomGaussian/reference/RandomGaussian.md)`(``n ``=`` ``10000``, Sigma ``=`` ``sigma``, mu ``=`` ``mu``)`\
`utils``::`[`head`](https://rdrr.io/r/utils/head.html)`(``x ``=`` ``x``)`\
`#>           [,1]      [,2]     [,3]`\
`#> [1,] 2.3709584 3.7809025 3.716398`\
`#> [2,] 0.4353018 1.4817420 2.540706`\
`#> [3,] 1.3631284 2.0263380 3.009659`\
`#> [4,] 1.6328626 2.1246263 3.366735`\
`#> [5,] 1.4042683 2.7981504 4.116276`\
`#> [6,] 0.8938755 0.7198005 1.939610`\
[`colMeans`](https://rdrr.io/r/base/colSums.html)`(``x ``=`` ``x``)`\
`#> [1] 0.9886906 1.9930702 3.0026276`\
`stats``::`[`cov`](https://rdrr.io/r/stats/cor.html)`(``x ``=`` ``x``)`\
`#>           [,1]      [,2]      [,3]`\
`#> [1,] 1.0123073 0.6693686 0.3340191`\
`#> [2,] 0.6693686 1.0067563 0.6779911`\
`#> [3,] 0.3340191 0.6779911 1.0289201`

\
`x_eigen`` ``<-`` `[`RandomGaussian`](https://ijapesigan.github.io/randomGaussian/reference/RandomGaussian.md)`(`\
`  n ``=`` ``10000``,`\
`  Sigma ``=`` ``sigma``,`\
`  mu ``=`` ``mu``,`\
`  decomposition ``=`` ``"eigen"`\
`)`\
[`colMeans`](https://rdrr.io/r/base/colSums.html)`(``x ``=`` ``x_eigen``)`\
`#> [1] 0.9922045 1.9994364 3.0030740`\
`stats``::`[`cov`](https://rdrr.io/r/stats/cor.html)`(``x ``=`` ``x_eigen``)`\
`#>           [,1]      [,2]      [,3]`\
`#> [1,] 0.9989755 0.6778610 0.3513876`\
`#> [2,] 0.6778610 1.0116622 0.6825126`\
`#> [3,] 0.3513876 0.6825126 1.0100200`

## Documentation

See [GitHub Pages](https://ijapesigan.github.io/randomGaussian) for
package documentation.

## References

R Core Team. (2026). *R: A language and environment for statistical
computing*. R Foundation for Statistical Computing.
<https://www.R-project.org/>
