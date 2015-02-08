source("./writePlot.R")

plot1 <- function (data) {
    hist(data$Global_active_power,
         col = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
}

writePlot("plot1", plot1)
