# Generate Random Variates from the Gaussian Distribution

Draws `n` random vectors from \\(\mathcal{N}\_{k} \left( \mu, \Sigma
\right)\\) using the Cholesky, eigen, or singular value decomposition of
the covariance matrix.

## Usage

``` r
RandomGaussian(n, Sigma, mu = NULL, decomposition = "chol")
```

## Arguments

- n:

  Positive integer. Sample size \\(n\\).

- Sigma:

  Numeric matrix. Covariance matrix \\(\Sigma\\) (`k` by `k`).

- mu:

  Numeric vector. Mean vector \\(\mu\\) of length `k`. If `NULL`, the
  mean is zero.

- decomposition:

  Character string. Matrix decomposition to use in data generation.
  Options are `"chol"` (default), `"eigen"`, and `"svd"`. Ignored when
  `k = 1`.

## Value

Numeric matrix. `n` by `k` matrix of random variates.

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
# parameters ----------------------------------------
n <- 10000
k <- 3
Sigma <- toeplitz((k:1) / k)
mu <- rep(x = 100, times = k)
Sigma
#>           [,1]      [,2]      [,3]
#> [1,] 1.0000000 0.6666667 0.3333333
#> [2,] 0.6666667 1.0000000 0.6666667
#> [3,] 0.3333333 0.6666667 1.0000000
mu
#> [1] 100 100 100

# data ----------------------------------------------
x <- RandomGaussian(n = n, Sigma = Sigma, mu = mu)
head(x)
#>           [,1]      [,2]      [,3]
#> [1,]  98.59996  99.48613 100.84796
#> [2,] 100.25532 100.37486 101.07138
#> [3,]  97.56274  96.85895  99.74152
#> [4,]  99.99443 100.08424 100.78637
#> [5,] 100.62155  99.73627  99.79826
#> [6,] 101.14841 102.04905 101.96687
cov(x)
#>           [,1]      [,2]      [,3]
#> [1,] 0.9774699 0.6580771 0.3443872
#> [2,] 0.6580771 1.0024997 0.6818567
#> [3,] 0.3443872 0.6818567 1.0154775
colMeans(x)
#> [1] 100.00114  99.98747  99.98428
```
