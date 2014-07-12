# Read the data
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
rawdata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")
unlink(temp)
data = rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename="plot3.png")

plot(data$Sub_metering_1, type="l", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2, type="l", col="red", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_3, type="l", col="blue", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", xlab="", ylab="Energy sub metering")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), cex=.75)

dev.off()