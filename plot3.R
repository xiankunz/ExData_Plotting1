# plot3.R - Global Active Power

# Read data from the file
data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors =F)

mydates <- c("1/2/2007","2/2/2007")
# extract subset of data based on dates
subData <- data[data$Date %in% mydates,]

dateTime <- strptime(paste(subData$Date, subData$Time), 
                          "%d/%m/%Y %H:%M:%S")

# Open plot3.png
png("plot3.png", width = 480, height = 480)

# Build the plot
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
       col=c("black", "red", "blue"))
	   
# Close PNG file
dev.off()
