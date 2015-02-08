source("./readData.R")

writePlot <- function (plotName, plot) {
    downloadAndExtractDataIfNotPresent()
    data <- readNormalizedSubsetData()
    png(file = paste0(plotName, ".png"))
    plot(data)
    dev.off()
}
