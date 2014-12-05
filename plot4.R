power_data <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         stringsAsFactors = FALSE,
                         na.strings = "?",
                         colClasses = c(rep("character", 2), rep("numeric", 7)))

two_days <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

library(dplyr)
two_days <- mutate(two_days, datetime = paste(Date, Time))
two_days$datetime <- strptime(two_days$datetime, "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2, 2), mar = c(5, 4, 1, 1))

with(two_days, plot(datetime, Global_active_power,
      ylab = "Global Active Power", xlab = "", type = "l"))

plot(two_days$datetime, two_days$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(two_days$datetime, two_days$Sub_metering_1, col = "black")
lines(two_days$datetime, two_days$Sub_metering_2, col = "red")
lines(two_days$datetime, two_days$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = c(1, 1), cex = .7, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "))

with(two_days, plot(datetime, Voltage, type = "l"))

with(two_days, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()
