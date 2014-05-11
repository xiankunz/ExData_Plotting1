# plot2.R - Global Active Power

# Read data from the file
data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors =F)

mydates <- c("1/2/2007","2/2/2007")
# extract subset of data based on dates
subData <- data[data$Date %in% mydates,]

dateTime <- strptime(paste(subData$Date, subData$Time), 
                          "%d/%m/%Y %H:%M:%S")

# Open plot2.png
png("plot2.png", width = 480, height = 480)

# Build the plot
plot(dateTime, subData$Global_active_power, type="l",
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
	 	 
# Close PNG file
dev.off()
