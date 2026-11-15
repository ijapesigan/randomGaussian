## ---- test-randomGaussian-random-gaussian-check
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    sigma <- diag(x = 2)
    testthat::test_that(
      desc = paste(text, "valid input"),
      code = {
        testthat::expect_null(
          object = randomGaussian:::.CheckRandomGaussian(
            n = 5,
            Sigma = sigma,
            mu = NULL,
            decomposition = "chol"
          )
        )
        testthat::expect_null(
          object = randomGaussian:::.CheckRandomGaussian(
            n = 5L,
            Sigma = sigma,
            mu = c(0, 1),
            decomposition = "svd"
          )
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "errors"),
      code = {
        testthat::expect_error(
          object = randomGaussian:::.CheckRandomGaussian(
            n = 1.5,
            Sigma = sigma,
            mu = NULL,
            decomposition = "chol"
          ),
          regexp = "`n`"
        )
        testthat::expect_error(
          object = randomGaussian:::.CheckRandomGaussian(
            n = c(1, 2),
            Sigma = sigma,
            mu = NULL,
            decomposition = "chol"
          ),
          regexp = "`n`"
        )
        testthat::expect_error(
          object = randomGaussian:::.CheckRandomGaussian(
            n = 5,
            Sigma = matrix(data = 1:6, nrow = 2),
            mu = NULL,
            decomposition = "chol"
          ),
          regexp = "`Sigma`"
        )
        testthat::expect_error(
          object = randomGaussian:::.CheckRandomGaussian(
            n = 5,
            Sigma = sigma,
            mu = c(0, 1, 2),
            decomposition = "chol"
          ),
          regexp = "`mu`"
        )
        testthat::expect_error(
          object = randomGaussian:::.CheckRandomGaussian(
            n = 5,
            Sigma = sigma,
            mu = NULL,
            decomposition = "qr"
          ),
          regexp = "`decomposition`"
        )
      }
    )
  },
  text = "test-randomGaussian-random-gaussian-check"
)
