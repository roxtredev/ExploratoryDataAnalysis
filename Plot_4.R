#  No extra libraries needed.

# Loading data from the txt file.
txtFile <- "./data/household_power_consumption.txt"
infoSet <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Querying data from the infoSet.
subSetInfo <- dataSet[infoSet$Date %in% c("1/2/2007","2/2/2007") ,]
head(subSetInfo)

# Formating fields.
datetime <- strptime(paste(subSetInfo$Date, subSetInfo$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetInfo$Global_active_power)
globalReactivePower <- as.numeric(subSetInfo$Global_reactive_power)
voltage <- as.numeric(subSetInfo$Voltage)
sub_Met1 <- as.numeric(subSetInfo$Sub_metering_1)
sub_Met2 <- as.numeric(subSetInfo$Sub_metering_2)
sub_Met3 <- as.numeric(subSetInfo$Sub_metering_3)

#  Creating png file to plot the graphic.
dev.copy(png, file="plot4.png", height=480, width=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_Met1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Met2, type="l", col="red")
lines(datetime, sub_Met3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()