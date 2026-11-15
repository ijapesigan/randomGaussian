## ---- test-randomGaussian-random-gaussian-svd-dot
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
        x <- randomGaussian:::.RandomGaussianSVD(
          Z = diag(x = k),
          svd = svd(x = sigma)
        )
        testthat::expect_equal(
          object = crossprod(x = x),
          expected = sigma
        )
      }
    )
  },
  text = "test-randomGaussian-random-gaussian-svd-dot"
)
