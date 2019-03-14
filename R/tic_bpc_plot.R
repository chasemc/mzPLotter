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

  plotly::plot_ly(data = input,
                  x = ~retentionTime,
                  y = ~totIonCurrent,
                  type = "scatter",
                  mode = "line",
                  hoverinfo = 'text',
                  text =  ~paste('TIC: ', totIonCurrent)) %>%
    add_trace(y = ~basePeakIntensity * (mtic / -mbpi),
              text =  ~paste('BPC: ', basePeakIntensity)) %>%
    plotly::layout(title = "Total Ion and Base Peak Chromatograms",
                   xaxis = list(
                     title = "Retention Time (minutes)"),
                   yaxis = list(
                     title = "Intensity"))
}
