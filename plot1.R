library(data.table)
powerConsumption <- fread("household_power_consumption.txt")


# subsetting data for date "2007-02-01"and "2007-02-02"
powData <- subset(powerConsumption,powerConsumption$Date=="1/2/2007"
                    | powerConsumption$Date=="2/2/2007")


# turn on png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")


# historgram of global active power
hist(as.numeric(powData$Global_active_power),
     col = "red",
     main = "Global Active Power",
     ylab = "Frequency",
     xlab = "Global Active Power (killowatts)")


dev.off()
