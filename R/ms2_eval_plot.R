#' ms2Eval
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
ms2EvalPlot <- function(input){
  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime, # convert to minutes
                                     y = ~peaksCount, alpha = ~basePeakIntensity,
                                     size = ~precursorMZ)) +
    ggplot2::scale_alpha(range = c(0.1, 1),
                         trans = "log10") +
    ggplot2::scale_size_continuous(range = c(.5, 3.5)) +
    ggplot2::xlab("Retention Time (min)") +
    ggplot2::ylab(bquote(Number ~ of ~ Peaks ~ "in" ~ MS^2 ~ Scan)) +
    ggplot2::labs(alpha = bquote(MS^2 ~ Base ~ Peak ~ Intensity),
                  size = bquote(Precursor ~italic(m/z)))
}
