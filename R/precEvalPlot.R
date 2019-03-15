#' precEvalMs1Plot
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
precEvalMs1Plot <- function(input){

  negexp_trans <- function(){
    trans_new('negexp', function(x) exp(-x), function(x) -log(x))
  }


  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime,
                                      y = ~peaksCount,
                                      alpha = ~totIonCurrent)) +
    ggplot2::scale_alpha(range = c(0.1, 1)) +
    ggplot2::xlab("Precursor m/z") +
    ggplot2::ylab("Number of peaks in MS1 Scan") +
    ggplot2::labs(alpha = "MS2 Base Peak Intensity")
}


#' precEvalMs1Plot
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
precEvalMs2Plot <- function(input){

  negexp_trans <- function(){
    trans_new('negexp', function(x) exp(-x), function(x) -log(x))
  }


  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime,
                                      y = ~peaksCount,
                                      alpha = ~totIonCurrent)) +
    ggplot2::scale_alpha(range = c(0.1, 1)) +
    ggplot2::xlab("Precursor m/z") +
    ggplot2::ylab("Number of peaks in MS2 Scan") +
    ggplot2::labs(alpha = "MS2 Base Peak Intensity")
}
