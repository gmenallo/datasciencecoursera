temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
introws <- read.table(unz(temp, "household_power_consumption.txt"), header = FALSE, sep=";", skip =66637, nrows=2880, col.names = c("Date", "Time", "Global active power", "Global reactive power", "Voltage", "Global intensity", "Sub metering 1", "Sub metering 2", "Sub metering 3" ))
unlink(temp)

dates <- strptime(paste(introws$Date, introws$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)

plot(dates,introws$Global.active.power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

dev.off()
