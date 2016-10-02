library(data.table)

# read file
powerConsumption <- fread("household_power_consumption.txt")


# subsetting data for date "2007-02-01"and "2007-02-02"
powData <- subset(powerConsumption,powerConsumption$Date=="1/2/2007"
                    | powerConsumption$Date=="2/2/2007")

# Convert Date format
powData$Date <- as.Date(powData$Date,"%d/%m/%Y")

# Create a new DateTime column
dateTime <- paste0(powData$Date," ",powData$Time)
powData$DateTime <- as.POSIXct(dateTime)

# turn on png
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")


# plot
plot(as.numeric(powData$Global_active_power) ~ powData$DateTime
     , type="l"
     , xlab= " "
     , ylab = "Global Active Power (killowatts)")

dev.off()
