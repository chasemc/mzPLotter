#' figure 1
#'
#' @param mzPointer mzR object
#'
#' @return plotly plot
#' @export
#'
figure1 <- function(mzPointer){

  mzXMLHeader <- mzPlotter::readMzSpec(mzPointer)
  # filter for MS1
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$msLevel == 1, ]
  # filter for polarity
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$polarity == 1, ]

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
    shareX = F, shareY = F, titleX = T, titleY = T,

    plotly::highlight(plotly::ggplotly(ticBpcPlot(sd_2,
                                                  relInt,
                                                  maxTic,
                                                  maxBpc)), on = "plotly_selected",color = "red"),
    plotly::highlight(plotly::ggplotly(rtVsBaseMzPlot(sd_2)), on = "plotly_selected", color = "red"),
    plotly::highlight(plotly::ggplotly(ms1PeaksVsTimePlot(sd_2)), on = "plotly_selected", color = "red")

  ) %>%
    plotly::layout(title = "",
           xaxis = list(domain=list(x=c(0,0.5),y=c(0,0.5))),
           scene = list(domain=list(x=c(0.5,1),y=c(0,0.5))),
           xaxis2 = list(domain=list(x=c(0.5,1),y=c(0.5,1))),
           showlegend=FALSE,showlegend2=FALSE)

}

