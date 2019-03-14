#' TIC and BPC plot
#'
#' @param input dataframe
#' @param mtic for scaling y axes
#' @param mbpi for scaling y axes
#' @param relInt relative intensity correction
#'
#' @return ggplot
#' @export
#'
ticBpcPlot <-  function(input,
                        relInt,
                        mtic,
                        mbpi){

  ggplot2::ggplot(input) +
    ggplot2::geom_line(ggplot2::aes_(x = ~retentionTime, # convert to minutes
                           y = ~totIonCurrent,
                           colour = "TIC")) +
    ggplot2::geom_line(ggplot2::aes_(x = ~retentionTime, # convert to minutes
                           y = ~round(basePeakIntensity * (mtic / mbpi), 2),
                           colour = "BPC")) +
    ggplot2::scale_y_continuous(name = "TIC (As Positive Spectrum)",
                                sec.axis = ggplot2::sec_axis(~.*-(relInt), name = "BPC (As Negative Spectrum)")) +
    ggplot2::scale_colour_manual(values = c("#1b9e77", "#7570b3")) +
    ggplot2::theme(legend.position = c(0.8, 0.9)) +
    ggplot2::labs(y = "TIC",
                  colour = "") +
    ggplot2::xlab("Retention Time (min)") +
    ggplot2::guides(colour = ggplot2::guide_legend(override.aes = list(size = ggplot2::rel(3)), reverse = T))
}
