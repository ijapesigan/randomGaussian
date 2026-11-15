#' Matrix of Standard Normal Random Variates (Transposed)
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param n Positive integer.
#'   Number of columns.
#' @param k Positive integer.
#'   Number of rows.
#'
#' @return Numeric matrix.
#'
#' @family Random Gaussian Functions
#' @keywords randomGaussian random z internal
#' @noRd
.RandomGaussianZT <- function(n,
                              k) {
  matrix(
    data = stats::rnorm(
      n = n * k
    ),
    nrow = k,
    ncol = n
  )
}
