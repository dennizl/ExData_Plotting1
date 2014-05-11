# read data file
setwd("F:/SkyDrive/UMD/Coursera/R-Explore/ExData_Plotting1")
powerdata <- read.table(file="household_power_consumption.txt", skip = 66637, nrow = 2880,
                        sep=";", na.strings="?", colClasses=c("character","character",rep("numeric",7)),
                        col.names=c("Date", "Time","Global_active_power","Global_reactive_power",
                                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#convert date field
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time, sep=" ")
powerdata$DateTime <- strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")

#plot the graph
plot(powerdata$DateTime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#publish as PNG
dev.copy(png, file = "plot2.png")
dev.off()
