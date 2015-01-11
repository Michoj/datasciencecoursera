#workingDirectory <- "C:/Coursera/Data Science/4. Exploratory Data Analysis/Assign 1"
cat ("\014") # Clear Console
setwd(workingDirectory)
# read in data
# read in data (2007-02-01 and 2007-02-02) 2 * 60 * 24 = 2880
powerdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE,as.is = !default.stringsAsFactors(), skip = 66636, nrows = 2880)
# To plot on screen, run line below (remove # at start of line)
#hist(powerdata2$Global_active_power, xlab="Global Active Power (kilowatts", main="Global Active Power", col="red")
# plot to file (*.png)
png(file = "plot1.png") # Open 'png' plot device
hist(powerdata2$Global_active_power, xlab="Global Active Power (kilowatts", main="Global Active Power", col="red")
dev.off()
