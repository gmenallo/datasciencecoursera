temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
introws <- read.table(unz(temp, "household_power_consumption.txt"), header = FALSE, sep=";", skip =66637, nrows=2880, col.names = c("Date", "Time", "Global active power", "Global reactive power", "Voltage", "Global intensity", "Sub metering 1", "Sub metering 2", "Sub metering 3" ))
unlink(temp)

png(filename="plot1.png", width=480, height=480)

hist(introws$Global.active.power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()