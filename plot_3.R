#  No libraries needed.

# Loading data from the txt file.
txtFile <- "./data/household_power_consumption.txt"
infoSet <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Querying the data based on the dates given from the instructions.
subSetInfo <- dataSet[infoSet$Date %in% c("1/2/2007","2/2/2007") ,]
head(subSetInfo)


#str(subSetInfo). sub set of Information.
datetime <- strptime(paste(subSetInfo$Date, subSetInfo$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetInfo$Global_active_power)
sub_Met1 <- as.numeric(subSetInfo$Sub_metering_1)
sub_Met2 <- as.numeric(subSetInfo$Sub_metering_2)
sub_Met3 <- as.numeric(subSetInfo$Sub_metering_3)

#png("plot3.png", width=480, height=480)
dev.copy(png, file="plot3.png", height=480, width=480)
plot(datetime, sub_Met1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Met2, type="l", col="red")
lines(datetime, sub_Met3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()