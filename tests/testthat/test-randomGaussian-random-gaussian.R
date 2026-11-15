## ---- test-randomGaussian-random-gaussian
lapply(
  X = seq_len(length.out = 3),
  FUN = function(k,
                 n,
                 tol,
                 text) {
    testthat::skip_on_cran()
    message(text)
    sigma <- stats::toeplitz(x = (k:1) / k)
    mu <- seq_len(length.out = k) / 2
    lapply(
      X = c("chol", "eigen", "svd"),
      FUN = function(decomposition,
                     k,
                     n,
                     tol,
                     sigma,
                     mu,
                     text) {
        set.seed(seed = 42)
        x <- RandomGaussian(
          n = n,
          Sigma = sigma,
          mu = mu,
          decomposition = decomposition
        )
        set.seed(seed = 42)
        x0 <- RandomGaussian(
          n = n,
          Sigma = sigma,
          decomposition = decomposition
        )
        testthat::test_that(
          desc = paste(text, k, decomposition, "dimensions"),
          code = {
            testthat::expect_true(object = is.matrix(x = x))
            testthat::expect_equal(object = dim(x = x), expected = c(n, k))
            testthat::expect_equal(object = dim(x = x0), expected = c(n, k))
          }
        )
        testthat::test_that(
          desc = paste(text, k, decomposition, "moments"),
          code = {
            testthat::expect_true(
              object = all(abs(x = colMeans(x = x) - mu) <= tol)
            )
            testthat::expect_true(
              object = all(abs(x = colMeans(x = x0)) <= tol)
            )
            testthat::expect_true(
              object = all(abs(x = stats::cov(x = x) - sigma) <= tol)
            )
          }
        )
        testthat::test_that(
          desc = paste(text, k, decomposition, "mu shifts the draws"),
          code = {
            testthat::expect_equal(
              object = x,
              expected = x0 + matrix(
                data = mu,
                nrow = n,
                ncol = k,
                byrow = TRUE
              ),
              tolerance = 1e-8
            )
          }
        )
      },
      k = k,
      n = n,
      tol = tol,
      sigma = sigma,
      mu = mu,
      text = text
    )
  },
  n = 10000L,
  tol = 0.05,
  text = "test-randomGaussian-random-gaussian"
)

lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "k = 1 follows stats::rnorm"),
      code = {
        set.seed(seed = 1)
        x <- RandomGaussian(n = 5, Sigma = matrix(data = 4), mu = 3)
        set.seed(seed = 1)
        y <- stats::rnorm(n = 5, mean = 3, sd = 2)
        testthat::expect_equal(object = as.vector(x = x), expected = y)
        testthat::expect_equal(object = dim(x = x), expected = c(5, 1))
        set.seed(seed = 1)
        x <- RandomGaussian(n = 5, Sigma = matrix(data = 4))
        set.seed(seed = 1)
        y <- stats::rnorm(n = 5, mean = 0, sd = 2)
        testthat::expect_equal(object = as.vector(x = x), expected = y)
      }
    )
    testthat::test_that(
      desc = paste(text, "k = 2 with the Cholesky decomposition"),
      code = {
        sigma <- matrix(data = c(2, 0.5, 0.5, 1), nrow = 2)
        set.seed(seed = 7)
        x <- RandomGaussian(n = 4, Sigma = sigma, mu = c(1, -1))
        set.seed(seed = 7)
        z <- matrix(data = stats::rnorm(n = 8), nrow = 4, ncol = 2)
        expected <- z %*% chol(x = sigma) + matrix(
          data = c(1, -1),
          nrow = 4,
          ncol = 2,
          byrow = TRUE
        )
        testthat::expect_equal(object = x, expected = expected)
      }
    )
    testthat::test_that(
      desc = paste(text, "the same seed gives the same draws"),
      code = {
        sigma <- stats::toeplitz(x = c(1, 0.3))
        set.seed(seed = 3)
        x <- RandomGaussian(n = 6, Sigma = sigma)
        set.seed(seed = 3)
        y <- RandomGaussian(n = 6, Sigma = sigma)
        testthat::expect_identical(object = x, expected = y)
      }
    )
    testthat::test_that(
      desc = paste(text, "positive semi-definite Sigma"),
      code = {
        sigma <- matrix(data = 1, nrow = 2, ncol = 2)
        set.seed(seed = 5)
        x <- RandomGaussian(n = 50, Sigma = sigma, decomposition = "eigen")
        testthat::expect_equal(
          object = x[, 1],
          expected = x[, 2],
          tolerance = 1e-8
        )
        set.seed(seed = 5)
        x <- RandomGaussian(n = 50, Sigma = sigma, decomposition = "svd")
        testthat::expect_equal(
          object = x[, 1],
          expected = x[, 2],
          tolerance = 1e-8
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "errors"),
      code = {
        sigma <- diag(x = 2)
        testthat::expect_error(
          object = RandomGaussian(n = 5, Sigma = sigma, decomposition = "lu")
        )
        testthat::expect_error(object = RandomGaussian(n = 0, Sigma = sigma))
        testthat::expect_error(
          object = RandomGaussian(n = 5, Sigma = c(1, 2))
        )
        testthat::expect_error(
          object = RandomGaussian(n = 5, Sigma = sigma, mu = 1)
        )
      }
    )
  },
  text = "test-randomGaussian-random-gaussian"
)
