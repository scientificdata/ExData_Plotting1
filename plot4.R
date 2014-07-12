# Read the data
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
rawdata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")
unlink(temp)
data = rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename="plot4.png")

par(mfrow=c(2,2))

# 4.1
par(mar=c(4,4,2,2))
plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power", frame.plot=TRUE, cex.lab=0.5, xaxt = "n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
# 4.2
par(mar=c(4,4,2,2))
plot(data$Voltage, type="l", xlab="datetime", ylab="Voltage (kilowatts)", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", yaxt="n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(234,238,242,246), labels=c("234","238","242","246"), cex.axis = 0.5, cex.lab=0.1)
# 4.3
par(mar=c(4,4,2,2))
plot(data$Sub_metering_1, type="l", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2, type="l", col="red", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_3, type="l", col="blue", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", xlab="", ylab="Energy sub metering")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend(1300, 40, c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , bty="n", lty=1, col=c('black', 'red', 'blue'), cex=.5)
#4.4
par(mar=c(4,4,2,2))
plot(data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", frame.plot=TRUE, cex.lab=0.5, xaxt = "n", cex.axis = 0.5)
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

dev.off()