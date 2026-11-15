## ---- test-randomGaussian-random-gaussian-eigen-dot
lapply(
  X = 1:3,
  FUN = function(k,
                 text) {
    testthat::skip_on_cran()
    message(text)
    sigma <- stats::toeplitz(x = (k:1) / k)
    testthat::test_that(
      desc = paste(text, k, "identity input reproduces Sigma"),
      code = {
        x <- randomGaussian:::.RandomGaussianEigen(
          Z = diag(x = k),
          eigen = eigen(x = sigma, symmetric = TRUE)
        )
        testthat::expect_equal(
          object = crossprod(x = x),
          expected = sigma
        )
      }
    )
  },
  text = "test-randomGaussian-random-gaussian-eigen-dot"
)
