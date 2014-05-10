# read in data from TXT
data <- read.table(file="data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# create new column of Date/Time POSIXct format
data$datetime <- as.POSIXct(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S", tz="GMT")

# change character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# subset between dates 2007-02-01 and 2007-02-02
subData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# plot 2. Time History
# initialize PNG device
png(file="plot2.png")
# create plot
#par(xaxs=c("Thu","Fri","Sat"))
plot(subData$Global_active_power ~ subData$datetime,
     ylab="Global Active Power (kilowatts)", type="l", xlab="")

dev.off()