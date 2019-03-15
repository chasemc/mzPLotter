context("test-readmzspec")


filepath <- "ftp://massive.ucsd.edu/MSV000082622/peak/Streptomyces_DSM4950/DSM4950_BuOH_ziptip_data_dependent.mzXML"

a <- NULL
a <- try(readLines(filepath))

if (class(a) == "character") {
  b <- tempfile()
  writeLines(a, b)
  mzPointer <- mzPlotter::getMzPointer(b)


  test_that("multiplication works", {
    expect_equal(as.character(class(mzPointer)), "mzRpwiz")
    expect_equal(typeof(mzPointer), "S4")

  })

  mzHeader <- mzPlotter::readMzSpec(mzPointer)

  ro <- which(lapply(mzHeader, class) == "numeric")

  mzHeader[, ro] <- round(mzHeader[, ro], 1)


  test_that("multiplication works", {
    expect_identical(nrow(mzHeader), 683L)
    expect_identical(class(mzHeader), "data.frame")
  })


  # test plots --------------------------------------------------------------



  p <- mzPlotter::ms2EvalPlot(mzHeader)

  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("gg", "ggplot"))
    expect_known_hash(as.character(p), "ef0e30e65c")
  })

suppressWarnings(
  p <- mzPlotter::rtVsPrecMzPlot(mzHeader)
)
  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("gg", "ggplot"))
    expect_known_hash(as.character(p), "f3af38bae1")
  })

  suppressWarnings(
  p <- mzPlotter::figure1(mzPointer, pol = 1)
)
  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("plotly", "htmlwidget"))
  })




  suppressWarnings(
  p <- mzPlotter::figure2(mzPointer, pol = 1)
)
  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("plotly", "htmlwidget"))
  })


  p <- mzPlotter::baseVtotal_plot(mzHeader)

  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("plotly", "htmlwidget"))
  })


}

