# read in data from TXT
data <- read.table(file="data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# create new column of Date/Time POSIXct format
data$datetime <- as.POSIXct(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S", tz="GMT")

# change character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

# subset between dates 2007-02-01 and 2007-02-02
subData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# plot 4. Panel of all plots in single output PNG
# initialize PNG device
png(file="plot4.png")

# set up plot grid:
par(mfrow=c(2,2))

# plot 1:
plot(subData$Global_active_power ~ subData$datetime,
     ylab="Global Active Power", type="l", xlab="")

# plot 2:
plot(subData$Voltage ~ subData$datetime,
     ylab="Voltage", type="l", xlab="datetime")

# plot 3:
plot(subData$Sub_metering_1 ~ subData$datetime,
     ylab="Energy sub metering", type="l", xlab="")
lines(subData$Sub_metering_2 ~ subData$datetime, col="red")
lines(subData$Sub_metering_3 ~ subData$datetime, col="blue")
legend("topright", bty="n", lty=1, col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot 4
plot(subData$Global_reactive_power ~ subData$datetime,type="l",xlab="datetime")

dev.off()