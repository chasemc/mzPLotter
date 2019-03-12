
#' Creates an mzR object
#'
#' @param path path of mzML or mzXML
#'
#' @return mzR object
#' @export
#'
getMzPointer <- function(path){
  mzR::openMSfile(file = path)
}


#' Get mzR header data from selected mzXML file
#'
#' @param mzPointer mzR object
#'
#' @return dataframe
#' @export
#'
readMzSpec <- function(mzPointer){
  mzR::header(mzPointer)
}
