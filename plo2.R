dt <- read.table('household_power_consumption.txt',sep = ";",header = TRUE)
finalData <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <- strptime(paste(finalData$Data, finalData$Time, sep = " "),
                    "%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
globalActivePower <- as.numeric(finalData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(finalData$SetTime, globalActivePower, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
