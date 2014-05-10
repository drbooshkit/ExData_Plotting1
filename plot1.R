# create vector of column classes:
cols <- c("Date", "POSIXct", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# read in data from TXT
data <- read.table(file="data/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# change character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# subset between dates 2007-02-01 and 2007-02-02
subData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# plot 1. histogram
# initialize PNG device
png(file="plot1.png")
# create plot
hist(subData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()