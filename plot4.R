temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
introws <- read.table(unz(temp, "household_power_consumption.txt"), header = FALSE, sep=";", skip =66637, nrows=2880, col.names = c("Date", "Time", "Global active power", "Global reactive power", "Voltage", "Global intensity", "Sub metering 1", "Sub metering 2", "Sub metering 3" ))
unlink(temp)

dates <- strptime(paste(introws$Date, introws$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(dates,introws$Global.active.power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

plot(dates,introws$Voltage, ylab="Voltage", xlab="datatime", type="l")

plot(dates,introws$Sub.metering.1, ylab="Energy sub metering", xlab="", type="l", col="black", lwd=0.5)
lines(dates,introws$Sub.metering.2,type="l", col="red", lwd=0.5)
lines(dates,introws$Sub.metering.3,type="l", col="blue", lwd=0.5)
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.95)

plot(dates,introws$Global.reactive.power, ylab="Global_reactive_power", xlab="datatime", type="l")



dev.off()