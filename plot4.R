source("./writePlot.R")

plot4.1 <- function (data) {
    plot(data$DateAndTime,
         data$Global_active_power,
         type = "l",
         xlab = "",
         ylab = "Global Active Power")
}

plot4.2 <- function (data) {
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
           bty = "n",
           col = c("black", "red", "blue"))
}

plot4.3 <- function (data) {
    plot(data$DateAndTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
}

plot4.4 <- function (data) {
    plot(data$DateAndTime,
         data$Global_reactive_power,
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power")
}

plot4 <- function (data) {
    par(mfcol = c(2, 2))
    plot4.1(data)
    plot4.2(data)
    plot4.3(data)
    plot4.4(data)
    par(mfcol = c(1, 1))
}

writePlot("plot4", plot4)
