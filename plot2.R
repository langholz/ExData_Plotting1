source("./writePlot.R")

plot2 <- function (data) {
    plot(data$DateAndTime,
         data$Global_active_power,
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)")
}

writePlot("plot2", plot2)
