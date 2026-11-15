## ---- test-randomGaussian-random-gaussian-chol-t-dot
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
        x <- randomGaussian:::.RandomGaussianCholT(
          Z = diag(x = k),
          chol = t(x = chol(x = sigma))
        )
        testthat::expect_equal(
          object = tcrossprod(x = x),
          expected = sigma
        )
      }
    )
  },
  text = "test-randomGaussian-random-gaussian-chol-t-dot"
)
