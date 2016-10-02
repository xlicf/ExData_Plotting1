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
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")


# plot
par(mfrow = c (2,2))

## subplot 1
plot(as.numeric(powData$Global_active_power) ~ powData$DateTime
     , type="l"
     , xlab= " "
     , ylab = "Global Active Power (killowatts)")


## subplot 2
plot(as.numeric(powData$Voltage) ~ powData$DateTime
     , type="l"
     , xlab= "datetime"
     , ylab = "Voltage")

## subplot 3

plot(as.numeric(powData$Sub_metering_1) ~ powData$DateTime
     , type="l"
     , xlab= " "
     , ylab = "Energy sub metering")

lines(as.numeric(powData$Sub_metering_2) ~ powData$DateTime
      , col = "red")

lines(as.numeric(powData$Sub_metering_3) ~ powData$DateTime
      , col = "blue")

legend("topright"
       , col=c("black", "red", "blue")
       , bty = "n"
       ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## subplot 4
plot(as.numeric(powData$Global_reactive_power) ~ powData$DateTime
     , type="l"
     , xlab= "Global_reactive_power"
     , ylab = "Voltage")



dev.off()
