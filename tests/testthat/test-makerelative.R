context("test-makerelative")

mzHeader <- cbind.data.frame(msLevel = c(1,2,1,2,1,2,3,4,5,6),
                             polarity = c(1,2,1,1,1,2,2,1,2,2),
                             totIonCurrent = 1:10,
                             basePeakIntensity = 101:110,
                             retentionTime = 1:10,
                             peaksCount = 1:10,
                             precursorMZ = 1:10,
                             stringsAsFactors = FALSE)



z1 <- mzPlotter::getTic(mzHeader = mzHeader)
z2 <- mzPlotter::getBpc(mzHeader = mzHeader)
a <- mzPlotter::relativateTotalAndBase(maxTic = max(z1),
                                       maxBpc = max(z2))


test_that("multiplication works", {
  expect_identical(round(a, 4), round(0.0909, 4))
})




p <- mzPlotter::ticBpcPlot(mzHeader,
                           a,
                           max(z1),
                           max(z2))

test_that("multiplication works", {
  #need more test
  expect_identical(class(p), c("gg", "ggplot"))
  expect_known_hash(as.character(p), "2f971e94c2f")

})

