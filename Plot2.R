#  No libraries needed

# Loading data from txt file. 
txtFile <- "./data/household_power_consumption.txt"
dataInfo <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Querying the information based on the dates.
subSetInfo <- data[dataInfo$Date %in% c("1/2/2007","2/2/2007") ,]
head(subSetInfo)

#Creating Plot 2
datetime <- strptime(paste(subSetInfo$Date, subSetInfo$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetInfo$Global_active_power)

#  Creating the file where the graphic is shown.
#  png("plot2.png", width=480, height=480)
dev.copy(png, file="plot2.png", height=480, width=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#  Close file to save the graphic.
dev.off()