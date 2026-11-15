## ---- test-randomGaussian-location-t-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "adds the location to each row"),
      code = {
        x <- matrix(data = 0, nrow = 2, ncol = 3)
        testthat::expect_equal(
          object = randomGaussian:::.LocationT(X = x, location = c(1, 2)),
          expected = matrix(data = c(1, 2), nrow = 2, ncol = 3)
        )
      }
    )
  },
  text = "test-randomGaussian-location-t-dot"
)
