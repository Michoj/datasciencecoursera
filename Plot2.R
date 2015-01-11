#workingDirectory <- "C:/Coursera/Data Science/4. Exploratory Data Analysis/Assign 1"
cat ("\014") # Clear Console
setwd(workingDirectory)
# read in data
# read in data (2007-02-01 and 2007-02-02) 2 * 60 * 24 = 2880
powerdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE,as.is = !default.stringsAsFactors(), skip = 66636, nrows = 2880)
powerdata[,1] <- as.Date(powerdata[,1],format = "%d/%m/%Y")
powerdata[,2] <- as.character(powerdata[,2])
# Prepare data to plot
x <- strptime(paste(as.character(powerdata[,1]),powerdata[,2]),format = "%Y-%m-%d %H:%M:%S")
x <- difftime(x, x[1], unit="mins")
y <- powerdata[,3]  # Global Active Power
# To draw on screen, uncomment 2 lines, plot(... and axis(...
# draw graph without x-axis lables
#plot(x,y, typ="l",ylab="Global Active Power (kilowatts)",xaxt="n", xlab="")
# modify x-axis lables
#axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
png(file = "plot2.png") # Open 'png' plot device
plot(x,y, typ="l",ylab="Global Active Power (kilowatts)",xaxt="n", xlab="")
axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
dev.off() # close graphics device
