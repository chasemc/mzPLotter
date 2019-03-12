

#' Percent contribution of base peak intensity to total ion intensity for all MS2 events
#'
#' @param mzXMLHeader dataframe returned by mzR::header()
#'
#' @return plotly plot
#' @export
#'
baseVtotal_plot <- function(mzXMLHeader){

  z <- order(mzXMLHeader$precursorMZ)

  z <- cbind.data.frame(y = ((mzXMLHeader$basePeakIntensity/mzXMLHeader$totIonCurrent) * 100)[z],
                        x = mzXMLHeader$basePeakMZ[z])


  plotly::plot_ly(data = z,
                  x = ~x,
                  y = ~y,
                  type = "scatter",
                  mode = "markers",
                  text = ~paste("Percent :", round(y,2),
                                "<br> m/z :", round(x,2)),
                  textposition = "auto",
                  hoverinfo = "text",
                  color = I("#000000")) %>%
    plotly::layout(
      title = "Percent contribution of base peak intensity \nto total ion intensity for all MS2 events",

      xaxis = list(title = "Base peak m/z (separate MS2 events)"),
      yaxis = list(title = "Percent",
                   range = c(0, 100))
    )
}
