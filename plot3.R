dt <- read.table('household_power_consumption.txt',sep = ";",header = TRUE)
finalData <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <- strptime(paste(finalData$Data, finalData$Time, sep = " "),
                    "%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
globalActivePower <- as.numeric(finalData$Global_active_power)

png("plot3.png", width=480, height=480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()
