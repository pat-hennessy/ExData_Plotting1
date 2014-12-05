power_data <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         stringsAsFactors = FALSE,
                         na.strings = "?",
                         colClasses = c(rep("character", 2), rep("numeric", 7)))

two_days <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

library(dplyr)
two_days <- mutate(two_days, DateTime = paste(Date, Time))
two_days$DateTime <- strptime(two_days$DateTime, "%d/%m/%Y %H:%M:%S")

with(two_days, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(two_days, lines(DateTime, Sub_metering_1, col = "black"))
with(two_days, lines(DateTime, Sub_metering_2, col = "red"))
with(two_days, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty = c(1, 1), cex = .7, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "))

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()
