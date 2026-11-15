#' Generate Random Variates from the Gaussian Distribution
#'
#' Draws `n` random vectors from
#' \eqn{\mathcal{N}_{k} \left( \mu, \Sigma \right)}
#' using the Cholesky, eigen, or singular value decomposition
#' of the covariance matrix.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param n Positive integer.
#'   Sample size \eqn{n}.
#' @param Sigma Numeric matrix.
#'   Covariance matrix \eqn{\Sigma}
#'   (`k` by `k`).
#' @param mu Numeric vector.
#'   Mean vector \eqn{\mu}
#'   of length `k`.
#'   If `NULL`, the mean is zero.
#' @param decomposition Character string.
#'   Matrix decomposition to use in data generation.
#'   Options are `"chol"` (default), `"eigen"`, and `"svd"`.
#'   Ignored when `k = 1`.
#'
#' @return Numeric matrix.
#'   `n` by `k` matrix of random variates.
#'
#' @examples
#' # parameters ----------------------------------------
#' n <- 10000
#' k <- 3
#' Sigma <- toeplitz((k:1) / k)
#' mu <- rep(x = 100, times = k)
#' Sigma
#' mu
#'
#' # data ----------------------------------------------
#' x <- RandomGaussian(n = n, Sigma = Sigma, mu = mu)
#' head(x)
#' cov(x)
#' colMeans(x)
#'
#' @family Random Gaussian Functions
#' @keywords randomGaussian random
#' @export
RandomGaussian <- function(n,
                           Sigma,
                           mu = NULL,
                           decomposition = "chol") {
  .CheckRandomGaussian(
    n = n,
    Sigma = Sigma,
    mu = mu,
    decomposition = decomposition
  )
  k <- dim(x = Sigma)[1]
  if (k == 1) {
    if (is.null(x = mu)) {
      mu <- 0
    }
    out <- matrix(
      data = stats::rnorm(
        n = n,
        mean = mu,
        sd = sqrt(x = Sigma)
      ),
      ncol = 1
    )
  } else {
    Z <- .RandomGaussianZ(
      n = n,
      k = k
    )
    if (decomposition == "chol") {
      X <- .RandomGaussianChol(
        Z = Z,
        chol = chol(x = Sigma)
      )
    }
    if (decomposition == "eigen") {
      X <- .RandomGaussianEigen(
        Z = Z,
        eigen = eigen(
          x = Sigma,
          symmetric = TRUE
        )
      )
    }
    if (decomposition == "svd") {
      X <- .RandomGaussianSVD(
        Z = Z,
        svd = svd(
          x = Sigma
        )
      )
    }
    if (!is.null(x = mu)) {
      X <- .Location(
        X = X,
        location = mu,
        n = n,
        k = k
      )
    }
    out <- X
  }
  out
}
