#' Title
#'
#' @param readPath path to mzML/mzXML
#' @param writePath path and file name of whereto write html output
#'
#' @return report
#' @export
#'
createReport <- function(readPath,
                         writePath){
  rmd <- system.file('gnps_report.Rmd',
                     package = 'mzPlotter')
  rmarkdown::render(rmd,
                    params = list(path = readPath),
                    output_file = writePath)
}
