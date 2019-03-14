#' Retention time vs precursorMZ
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
ms1PeaksVsTimePlot <-  function(input){
  ggplot2::ggplot(input) +
    ggplot2::geom_point(ggplot2::aes_(x = ~retentionTime / 60, # convert to minutes
                                      y = ~peaksCount)) +
    ggplot2::xlab("Retention Time (min)") +
    ggplot2::ylab("MS1 Peak Count")
}
