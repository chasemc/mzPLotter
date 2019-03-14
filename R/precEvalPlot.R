#' precEvalPlot
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
precEvalPlot <- function(input){
  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime,
                                      y = ~peaksCount,
                                      alpha = ~basePeakIntensity)) +
    ggplot2::scale_alpha(range = c(0.1, 1),
                         trans = "log10") +
    ggplot2::xlab("Precursor m/z") +
    ggplot2::ylab("Number of peaks in MS1 Scan") +
    ggplot2::labs(alpha = "MS2 Base Peak Intensity")
}
