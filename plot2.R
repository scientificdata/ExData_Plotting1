# Read the data
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
rawdata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")
unlink(temp)
data = rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename="plot2.png")

plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", frame.plot=TRUE, cex.lab=0.5, xaxt = "n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

dev.off()