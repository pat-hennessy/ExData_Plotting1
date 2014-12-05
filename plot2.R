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

with(two_days, plot(DateTime, Global_active_power,
             ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
