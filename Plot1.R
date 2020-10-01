#  No libraries needed.

#  Loading data from the txt files.
txtFile <- "./data/household_power_consumption.txt"
infoSet <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Selecting the information from the txt file downloaded.
subSetInfo <- data[infoSet$Date %in% c("1/2/2007","2/2/2007") ,]
head(subSetInfo)

# Global Active Power. #str(subSetData)
# Plot 1.  Histogram
globalActivePower <- as.numeric(subSetInfo$Global_active_power)
dev.copy(png, file="plot1.png", height=480, width=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#  Close file.
dev.off()





