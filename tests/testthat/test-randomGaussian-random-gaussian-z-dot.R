## ---- test-randomGaussian-random-gaussian-z-dot
lapply(
  X = 1:2,
  FUN = function(k,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, k, "dimensions and values"),
      code = {
        set.seed(seed = 1)
        z <- randomGaussian:::.RandomGaussianZ(n = 4, k = k)
        set.seed(seed = 1)
        y <- stats::rnorm(n = 4 * k)
        testthat::expect_equal(object = dim(x = z), expected = c(4, k))
        testthat::expect_equal(object = as.vector(x = z), expected = y)
      }
    )
  },
  text = "test-randomGaussian-random-gaussian-z-dot"
)
