power_data <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         stringsAsFactors = FALSE,
                         na.strings = "?",
                         colClasses = c(rep("character", 2), rep("numeric", 7)))

two_days <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

two_days$Date <- as.Date(two_days$Date, "%d/%m/%Y")

hist(two_days$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
