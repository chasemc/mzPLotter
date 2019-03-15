#' TIC and BPC plot
#'
#' @param input dataframe
#'
#' @return ggplot
#' @export
#'
ticBpcPlot <-  function(input){

  ggplot2::ggplot(input) +
    ggplot2::geom_line(ggplot2::aes_(x = ~retentionTime, # convert to minutes
                                     y = ~totIonCurrent,
                                     colour = "Total Ion Chromatogram",
                                     label1 = ~totIonCurrent)) +
    ggplot2::geom_line(ggplot2::aes_(x = ~retentionTime, # convert to minutes
                                     y = ~basePeakIntensity,
                                     colour = "Base Peak Chromatogram",
                                     label2 = ~basePeakIntensity)) +
    ggplot2::scale_colour_manual(values = c("#1b9e77", "#7570b3")) +
   # ggplot2::theme(legend.position = c(0.8, 0.9)) +
    ggplot2::labs(y = "Scaled Intensity",
                  colour = "") +
    ggplot2::xlab("Retention Time (min)") +
    ggplot2::guides(colour = ggplot2::guide_legend(override.aes = list(size = ggplot2::rel(3)),
                                                   reverse = T))

}
