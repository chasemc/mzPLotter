
# A negative skewed distribution could mean
# many spectra are comprised mainly of base peak
# While a normal/positive skew may suggest a more distributed MS2 scan
#
# plot(density(mzXMLHeader$basePeakIntensity/mzXMLHeader$totIonCurrent),
#      xlab = "Percent of total ion current contributed by base peak",
#      ylab = "Density",
#      main = "Base peak intensity vs total ion intensity for all MS2 events" )
#


#
# z <- mzXMLHeader$basePeakIntensity/mzXMLHeader$totIonCurrent
# fit <- density(z)
# fit <- density(z)
#
# plot_ly(x = z) %>%
#   add_histogram() %>%
#   add_lines(x = fit$x, y = fit$y, fill = "tozeroy", yaxis = "y2") %>%
#   layout(yaxis2 = list(overlaying = "y", side = "right"))
#
#
#
#
# %>%
#   layout(
#     title = "Percent contribution of base peak intensity \nto total ion intensity for all MS2 events",
#
#     xaxis = list(title = "Base peak m/z (separate MS2 events)"),
#     yaxis = list(title = "Percent",
#                  range = c(0, 100))
#   )




#
#
# z <- mzXMLHeader[order(mzXMLHeader$precursorMZ), ]
#
# z <- cbind.data.frame(y = (z$basePeakIntensity/z$totIonCurrent) * 100,
#            x = z$basePeakMZ)
#
#
#
#
# plotly::plot_ly(data = z,
#                 x = ~x,
#                 y = ~y,
#                 type = "scatter",
#                 mode = "markers",
#                 text = ~paste("Percent :", round(y,2),
#                               "<br> m/z :", round(x,2)),
#                 textposition = "auto",
#                 hoverinfo = "text",
#                 color = I("#000000")) %>%
#   layout(
#     title = "Percent contribution of base peak intensity \nto total ion intensity for all MS2 events",
#
#     xaxis = list(title = "Base peak m/z (separate MS2 events)"),
#     yaxis = list(title = "Percent",
#                  range = c(0, 100))
#   )
