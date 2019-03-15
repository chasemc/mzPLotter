#' Retention time vs precursorMZ
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
rtVsPrecMzPlot <-  function(input){
  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime, # convert to minutes
                            y = ~basePeakMZ,
                            alpha = ~scaledTotIonCurrent,
                            label1 = ~retentionTime,
                            label2 = ~basePeakMZ)) +
    ggplot2::scale_alpha_continuous(range = c(0.1, 1)) +
    ggplot2::xlab("Retention Time (min)") +
    ggplot2::ylab("Base Peak (m/z)") +
    ggplot2::labs(alpha = "MS2 Base Peak Intensity")
}
