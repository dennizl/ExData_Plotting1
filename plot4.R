# read data file
powerdata <- read.table(file="household_power_consumption.txt", skip = 66637, nrow = 2880,
                        sep=";", na.strings="?", colClasses=c("character","character",rep("numeric",7)),
                        col.names=c("Date", "Time","Global_active_power","Global_reactive_power",
                                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#convert date field
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time, sep=" ")
powerdata$DateTime <- strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")

#set 2x2 plots
par(mfrow = c(2,2), cex=0.6, mar=c(4,4,4,4))

#plot graph1
plot(powerdata$DateTime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot graph2
plot(powerdata$DateTime, powerdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot graph3
plot(powerdata$DateTime, powerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerdata$DateTime, powerdata$Sub_metering_2, col="red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1     ","Sub_metering_2     ","Sub_metering_3     "), bty="n")

#plot graph4
plot(powerdata$DateTime, powerdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#publish as PNG
dev.copy(png, file = "plot4.png")
dev.off()
