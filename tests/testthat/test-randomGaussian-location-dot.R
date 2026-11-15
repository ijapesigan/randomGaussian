## ---- test-randomGaussian-location-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "adds the location to each column"),
      code = {
        x <- matrix(data = 0, nrow = 3, ncol = 2)
        testthat::expect_equal(
          object = randomGaussian:::.Location(
            X = x,
            location = c(1, 2),
            n = 3,
            k = 2
          ),
          expected = matrix(data = c(1, 1, 1, 2, 2, 2), nrow = 3, ncol = 2)
        )
        testthat::expect_equal(
          object = randomGaussian:::.Location(
            X = matrix(data = 1:2, nrow = 2, ncol = 1),
            location = 10,
            n = 2,
            k = 1
          ),
          expected = matrix(data = c(11, 12), nrow = 2, ncol = 1)
        )
      }
    )
  },
  text = "test-randomGaussian-location-dot"
)
