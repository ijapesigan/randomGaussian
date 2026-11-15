## ---- test-benchmark-randomGaussian-random-gaussian
# Run by hand: bench is not part of the unit tests.
stopifnot(requireNamespace(package = "bench", quietly = TRUE))
lapply(
  X = c(3, 10, 20),
  FUN = function(k) {
    n <- 1000
    sigma <- stats::toeplitz(x = (k:1) / k)
    mu <- rep(x = 100, times = k)
    print(
      x = bench::mark(
        chol = randomGaussian::RandomGaussian(
          n = n,
          Sigma = sigma,
          mu = mu,
          decomposition = "chol"
        ),
        eigen = randomGaussian::RandomGaussian(
          n = n,
          Sigma = sigma,
          mu = mu,
          decomposition = "eigen"
        ),
        svd = randomGaussian::RandomGaussian(
          n = n,
          Sigma = sigma,
          mu = mu,
          decomposition = "svd"
        ),
        iterations = 10,
        check = FALSE
      )
    )
  }
)
