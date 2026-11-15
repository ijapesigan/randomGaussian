#' Add Location Parameter (Transposed)
#'
#' Adds the location vector to a `k` by `n` matrix,
#' one row per variable.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param X Numeric matrix.
#'   `k` by `n` matrix.
#' @param location Numeric vector of length `k`.
#'   Location parameter.
#'
#' @return Numeric matrix.
#'
#' @family Random Gaussian Functions
#' @keywords randomGaussian random location internal
#' @noRd
.LocationT <- function(X,
                       location) {
  X + location
}
