# plot1.R - Global Active Power (histogram)

# Read data from the file
data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors =F)

mydates <- c("1/2/2007","2/2/2007")
# extract subset of data based on dates
subData <- data[data$Date %in% mydates,]


# Open png file
png("plot1.png", width = 480, height = 480)

# Add histogram 
hist(as.numeric(subData$Global_active_power), col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
	 
# Close png file
dev.off()

