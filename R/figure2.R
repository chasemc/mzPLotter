#' figure2
#'
#' @param mzPointer mzR object
#'
#' @return plotly plot
#' @export
#'
figure2 <- function(mzPointer) {


  mzXMLHeader <- mzPlotter::readMzSpec(mzPointer)
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$msLevel == 2, ]
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$polarity == 1, ]


  maxTic <- max(getTic(mzHeader = mzXMLHeader))
  maxBpc <- max(getBpc(mzHeader = mzXMLHeader))
  relInt <- mzPlotter::relativateTotalAndBase(maxTic = maxTic,
                                              maxBpc = maxBpc)
  mzXMLHeader$relInt <- relInt

  mzXMLHeader$retentionTime <- base::round(mzXMLHeader$retentionTime / 60,
                                           2)
  sd_2 <- crosstalk::SharedData$new(mzXMLHeader, key = ~acquisitionNum, group = "mzXMLHeader_subset")






  plotly::subplot(
    nrows = 2,
    #heights = c(0.2, 0.8),
    #widths = c(0.8, 0.2),
    shareX = F, shareY = F, titleX = T, titleY = T,

    plotly::highlight(plotly::ggplotly(ticBpcPlot(sd_2,
                                                  relInt,
                                                  maxTic,
                                                  maxBpc)), on = "plotly_selected",color = "red"),
    plotly::highlight(plotly::ggplotly(precEvalPlot(sd_2)), on = "plotly_selected", color = "red"),
    plotly::highlight(plotly::ggplotly(rtVsPrecMzPlot(sd_2)), on = "plotly_selected", color = "red")

  )

}
