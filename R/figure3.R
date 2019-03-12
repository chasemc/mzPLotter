
#' figure3
#'
#' @param mzPointer mzR object
#'
#' @return plotly plot
#' @export
#'
figure3 <- function(mzPointer){
  mzXMLHeader <- mzPlotter::readMzSpec(mzPointer)
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$msLevel == 2, ]
  z <- mzXMLHeader[order(mzXMLHeader$precursorMZ), ]

  z <- cbind.data.frame(y = (z$basePeakIntensity/z$totIonCurrent) * 100,
                        x = z$basePeakMZ)




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
