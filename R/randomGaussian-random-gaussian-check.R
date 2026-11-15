#' Check the Arguments of `RandomGaussian()`
#'
#' Stops if `n` is not a positive integer,
#' `Sigma` is not a square numeric matrix,
#' `mu` is not `NULL` or a numeric vector of length `k`,
#' or `decomposition` is not `"chol"`, `"eigen"`, or `"svd"`.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param n Positive integer.
#'   Sample size \eqn{n}.
#' @param Sigma Numeric matrix.
#'   Covariance matrix \eqn{\Sigma}.
#' @param mu Numeric vector.
#'   Mean vector \eqn{\mu}.
#' @param decomposition Character string.
#'   Matrix decomposition to use in data generation.
#'
#' @return Returns `NULL` invisibly.
#'
#' @family Random Gaussian Functions
#' @keywords randomGaussian random internal
#' @noRd
.CheckRandomGaussian <- function(n,
                                 Sigma,
                                 mu,
                                 decomposition) {
  if (
    !is.numeric(x = n) || length(x = n) != 1 || is.na(x = n) ||
      n < 1 || n %% 1 != 0
  ) {
    stop("`n` must be a positive integer.")
  }
  if (
    !is.matrix(x = Sigma) || !is.numeric(x = Sigma) ||
      nrow(x = Sigma) != ncol(x = Sigma)
  ) {
    stop("`Sigma` must be a square numeric matrix.")
  }
  if (
    !is.null(x = mu) &&
      (!is.numeric(x = mu) || length(x = mu) != nrow(x = Sigma))
  ) {
    stop("`mu` must be NULL or a numeric vector of length `k`.")
  }
  if (
    !is.character(x = decomposition) || length(x = decomposition) != 1 ||
      !(decomposition %in% c("chol", "eigen", "svd"))
  ) {
    stop("`decomposition` must be \"chol\", \"eigen\", or \"svd\".")
  }
  invisible(x = NULL)
}
