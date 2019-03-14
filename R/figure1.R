#' figure 1
#'
#' @param mzPointer mzR object
#'
#' @return plotly plot
#' @export
#'
figure1 <- function(mzPointer,
                    pol){

  mzXMLHeader <- mzPlotter::readMzSpec(mzPointer)
  # filter for MS1
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$msLevel == 1, ]


  # filter for polarity
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$polarity == pol, ]

  maxTic <- max(getTic(mzHeader = mzXMLHeader))
  maxBpc <- max(getBpc(mzHeader = mzXMLHeader))
  relInt <- mzPlotter::relativateTotalAndBase(maxTic = maxTic,
                                              maxBpc = maxBpc)
  mzXMLHeader$relInt <- relInt


  mzXMLHeader$retentionTime <- base::round(mzXMLHeader$retentionTime / 60,
                                           2)
  sd_2 <- crosstalk::SharedData$new(mzXMLHeader,
                                    key = ~acquisitionNum,
                                    group = "mzXMLHeader_subset")

  plotly::subplot(
    nrows = 2,
    shareX = F,
    shareY = F,
    titleX = T,
    titleY = T,
    margin = 0.08,
    plotly::highlight(ticBpcPlot(sd_2,
                                 relInt,
                                 maxTic,
                                 maxBpc),
                      on = "plotly_selected",
                      color = "red"),
    plotly::highlight(plotly::ggplotly(rtVsPrecMzPlot(sd_2)),
                      on = "plotly_selected",
                      color = "red")
  )

}
