source("./writePlot.R")

plot3 <- function (data) {
    plot(data$DateAndTime,
         c(rep(0, length(data$DateAndTime) - 1), max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)),
         type = "n",
         xlab = "",
         ylab = "Energy sub metering")
    lines(data$DateAndTime, data$Sub_metering_1, col = "black")
    lines(data$DateAndTime, data$Sub_metering_2, col = "red")
    lines(data$DateAndTime, data$Sub_metering_3, col = "blue")
    legend("topright",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1,
           col = c("black", "red", "blue"))
}

writePlot("plot3", plot3)
