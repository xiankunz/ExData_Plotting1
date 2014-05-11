# plot4.R - Global Active Power

# Read data from the file
data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors =F)

mydates <- c("1/2/2007","2/2/2007")
# extract subset of data based on dates
subData <- data[data$Date %in% mydates,]

dateTime <- strptime(paste(subData$Date, subData$Time), 
                          "%d/%m/%Y %H:%M:%S")

# Open plot4.png
png("plot4.png", width = 480, height = 480)

# set the layout
par(mfrow = c(2, 2)) 

# Build the first plot (plot2.png)
plot(dateTime, subData$Global_active_power, type="l",
     pch=NA, 
     xlab="", 
     ylab="Global Active Power")	  
	 
# Build the second voltage plot
plot(dateTime, subData$Voltage, type="l", ylab="Voltage", xlab="datetime")

# Build the third plot (plot3.png)
plot(dateTime, 
     subData$Sub_metering_1, 
	 type="l",
     pch=NA, 
     xlab="", 	 
     ylab="Energy sub metering")
lines(dateTime, subData$Sub_metering_2, col="red")
lines(dateTime, subData$Sub_metering_3, col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col=c("black", "red", "blue"), bty = 'n')	   
	   
	   
# Build the fourth plot
plot(dateTime, subData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", pch=NA)
	 
# Close PNG file
dev.off()

