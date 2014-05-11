# read data file
setwd("F:/SkyDrive/UMD/Coursera/R-Explore/ExData_Plotting1")
powerdata <- read.table(file="household_power_consumption.txt", skip = 66637, nrow = 2880,
                        sep=";", na.strings="?", colClasses=c("character","character",rep("numeric",7)),
                        col.names=c("Date", "Time","Global_active_power","Global_reactive_power",
                                    "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#generate histogram
hist(powerdata$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#publish as PNG
dev.copy(png, file = "plot1.png")
dev.off()
