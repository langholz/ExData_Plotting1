downloadAndExtractDataIfNotPresent <- function () {
    archiveName <- "./data/exdata-data-household_power_consumption.zip"
    dir.create("./data", showWarnings = F)
    if (!file.exists(archiveName)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, archiveName, method = "curl")
        unzip(archiveName, exdir = "./data")
    }
}

normalizeData <- function (data) {
    data$DateAndTime <- paste(data$Date, data$Time)
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data$DateAndTime <- strptime(data$DateAndTime, format = "%d/%m/%Y %H:%M:%S")
    data
}

readAllData <- function (path = "./data/household_power_consumption.txt") {
    classes <- c(rep("character", 2), rep("numeric", 7))
    data <- read.csv2(path, header = T, dec = ".", na.strings = "?", stringsAsFactors = F)
    data
}

readAllAndFilterData <- function (path = "./data/household_power_consumption.txt") {
    data <- readAllData(path)
    filteredData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
    remove(data)
    filteredData
}

readWhileFilteringdData <- function (path = "./data/household_power_consumption.txt") {
    classes <- c(rep("character", 2), rep("numeric", 7))
    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')"
    library(sqldf)
    data <- read.csv2.sql(path, sql = sql, header = T, dec = ".", na.strings = "?")
    closeAllConnections()
    data
}

readSubsetData <- function (path = "./data/household_power_consumption.txt") {
    data <- NULL
    subsetDataPath <- "./data/feb_1_and_2_2007.txt"
    if (file.exists(subsetDataPath)) {
        data <- read.csv2(subsetDataPath, stringsAsFactors = F)
    } else {
        fullDataPath <- 
        sqldfAvailable <- "sqldf" %in% installed.packages()[, 1]
        data <- if (sqldfAvailable) readWhileFilteringdData(path) else readAllAndFilterData(path)
        write.csv2(data, file = subsetDataPath, row.names = F)
    }

    data
}

readNormalizedSubsetData <- function (path = "./data/household_power_consumption.txt") {
    data <- readSubsetData(path)
    data <- normalizeData(data)
    data
}