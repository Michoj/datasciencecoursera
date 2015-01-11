#workingDirectory <- "C:/Coursera/Data Science/4. Exploratory Data Analysis/Assign 1"
cat ("\014") # Clear Console
setwd(workingDirectory)
# read in data
# read in data (2007-02-01 and 2007-02-02) 2 * 60 * 24 = 2880
powerdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE,as.is = !default.stringsAsFactors(), skip = 66636, nrows = 2880)
# prepare data (col 1 as 'date', col 2 as 'character')
powerdata[,1] <- as.Date(powerdata[,1],format = "%d/%m/%Y")
powerdata[,2] <- as.character(powerdata[,2])

# plot to file (*.png)
png(file = "plot4.png") # Open 'png' plot device

# Prepare plot area (4 plots)
par(mfcol=c(2,2))

##################################################################################
# Prepare data to plot Plot1
x <- strptime(paste(as.character(powerdata[,1]),powerdata[,2]),format = "%Y-%m-%d %H:%M:%S")
x <- difftime(x, x[1], unit="mins")
y <- powerdata[,3]  # Global Active Power
# draw graph without x-axis lables
plot(x,y, typ="l",ylab="Global Active Power",xaxt="n", xlab="")
# modify x-axis lables
axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
# End Plot 1 (Top Left)
##################################################################################
# Plot 2 (Bottom Left)
y1 <- powerdata[,7]  # Sub_metering_1
y2 <- powerdata[,8]  # Sub_metering_2
y3 <- powerdata[,9]  # Sub_metering_3
# To draw on screen, comment (#) lines png(.. and dev.off()
# Plot frame (no line, no x-axes)
plot(x,y1, typ="n",ylab="Energy sub metering",xaxt="n", xlab="")
" plot lines"
lines(x,y1,col = "Black")
lines(x,y2,col = "Red")
lines(x,y3,col = "Blue")
# modify x-axis lables
axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("Black","Red","Blue"))
# End Plot 2 (Bottom Left)
##################################################################################
# Plot 3 (Top Right)
y <- powerdata[,5]  # Voltage
# draw graph without x-axis lables
plot(x,y, typ="l",ylab="Voltage",xaxt="n", xlab="datetime")
# modify x-axis lables
axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
# End Plot 3 (Top Right)
##################################################################################
# Plot 4 (Bottom Right)
y <- powerdata[,4]  # Global_reactive_power
# draw graph without x-axis lables
plot(x,y, typ="l",ylab="Global_reactive_power",xaxt="n", xlab="datetime")
# modify x-axis lables
axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
##################################################################################
dev.off()