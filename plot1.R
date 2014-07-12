# Read the data
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
rawdata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")
unlink(temp)
data = rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename="plot1.png")

# First plot
hist(as.numeric(data$Global_active_power), xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

dev.off()