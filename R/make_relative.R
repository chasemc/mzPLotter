#' For y-axis scaling
#'
#' @param maxTic maximum in tic intensity vector
#' @param maxBpc maximum in bpc intensity vector
#'
#' @return numeric of length one
#' @export
relativateTotalAndBase <- function(maxTic,
                                   maxBpc) {

  maxTic / maxBpc
}

