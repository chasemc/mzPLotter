

#' Get the total ion chromatogram  intensities for a given polarity and MS level
#'
#' @param mzHeader mzR header (data.frame)
#'
#' @return numeric vector of intensities
#' @export
#'
getTic <- function(mzHeader){
  mzHeader$totIonCurrent
}

#' Get the Base Peak Chromatogram intensities for a given polarity and MS level
#'
#' @param mzHeader mzR header (data.frame)
#'
#' @return numeric vector of intensities
#' @export
#'
getBpc <- function(mzHeader){
  mzHeader$basePeakIntensity
}

