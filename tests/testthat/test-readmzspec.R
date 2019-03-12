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


  p <- mzPlotter::rtVsPrecMzPlot(mzHeader)

  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("gg", "ggplot"))
    expect_known_hash(as.character(p), "e45ea2de19")
  })


  p <- mzPlotter::precEvalPlot(mzHeader)

  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("gg", "ggplot"))
    expect_known_hash(as.character(p), "5b56117412")
  })



  p <- mzPlotter::figure1(mzPointer)

  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("plotly", "htmlwidget"))
  })





  p <- mzPlotter::figure2(mzPointer)

  test_that("multiplication works", {
    #need more test
    expect_identical(class(p), c("plotly", "htmlwidget"))
  })



  p <- mzPlotter::figure3(mzPointer)

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

