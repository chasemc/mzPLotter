#' Retention time vs precursorMZ
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
rtVsPrecMzPlot <-  function(input){
  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime / 60, # convert to minutes
                            y = ~precursorMZ,
                            alpha = ~basePeakIntensity)) +
    ggplot2::scale_alpha_continuous(range = c(0.1, 1),
                                    trans = "log10") +
    ggplot2::xlab("Retention Time (min)") +
    ggplot2::ylab("Precursor ~ italic(m/z)") +
    ggplot2::labs(alpha = "MS^2 ~ Base ~ Peak ~ Intensity")
}
