#' Prepare mzR header data for plotly
#'
#' @param mzPointer mzPointer
#' @param msLevel  msLevel
#' @param polarity polarity (in mzR: 0= negative, 1=positive, -1=unkown)
#'
#' @return
#' @export
#'
#' @examples
prepForPlotly <- function(mzPointer,
                        msLevel,
                        polarity){

  mzXMLHeader <- mzPlotter::readMzSpec(mzPointer)
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$msLevel == msLevel, ]
  mzXMLHeader <- mzXMLHeader[mzXMLHeader$polarity == polarity, ]


  maxTic <- max(getTic(mzHeader = mzXMLHeader))
  maxBpc <- max(getBpc(mzHeader = mzXMLHeader))
  relInt <- mzPlotter::relativateTotalAndBase(maxTic = maxTic,
                                              maxBpc = maxBpc)
  mzXMLHeader$relInt <- relInt

  mzXMLHeader$retentionTime <- base::round(mzXMLHeader$retentionTime / 60,
                                           2)
  sd_2 <- crosstalk::SharedData$new(mzXMLHeader, key = ~acquisitionNum, group = "mzXMLHeader_subset")

}
