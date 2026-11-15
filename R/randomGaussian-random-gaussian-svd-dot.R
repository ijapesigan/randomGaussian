#' Generate Random Variates from the Gaussian Distribution
#' (Singular Value Decomposition)
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param Z Numeric matrix.
#'   `n` by `k` matrix of independent random variates
#'   from the standard univariate normal distribution
#'   \eqn{\boldsymbol{Z}}.
#' @param svd Object.
#'   Result of [svd()].
#'
#' @return Numeric matrix.
#'
#' @family Random Gaussian Functions
#' @keywords randomGaussian random svd internal
#' @noRd
.RandomGaussianSVD <- function(Z,
                               svd) {
  Z %*% svd$u %*% (
    t(x = svd$v) * sqrt(
      x = pmax(
        svd$d,
        0
      )
    )
  )
}
