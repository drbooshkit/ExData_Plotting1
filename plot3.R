# read in data from TXT
data <- read.table(file="data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# create new column of Date/Time POSIXct format
data$datetime <- as.POSIXct(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S", tz="GMT")

# change character to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# subset between dates 2007-02-01 and 2007-02-02
subData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# plot 3. Time History of 3x sub-meters
# initialize PNG device
png(file="plot3.png")

# create plot and add lines for 2 and 3:
plot(subData$Sub_metering_1 ~ subData$datetime,
     ylab="Energy sub metering", type="l", xlab="")
lines(subData$Sub_metering_2 ~ subData$datetime, col="red")
lines(subData$Sub_metering_3 ~ subData$datetime, col="blue")
legend("topright", lty=1, col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()