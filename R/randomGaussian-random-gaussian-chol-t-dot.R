#' Generate Random Variates from the Gaussian Distribution
#' (Cholesky Decomposition, Transposed)
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param Z Numeric matrix.
#'   `k` by `n` matrix of independent random variates
#'   from the standard univariate normal distribution
#'   \eqn{\boldsymbol{Z}}.
#' @param chol Object.
#'   Transpose of the result of [chol()].
#'
#' @return Numeric matrix.
#'
#' @family Random Gaussian Functions
#' @keywords randomGaussian random cholesky internal
#' @noRd
.RandomGaussianCholT <- function(Z,
                                 chol) {
  chol %*% Z
}
