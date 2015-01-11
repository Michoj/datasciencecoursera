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
y1 <- powerdata[,7]  # Sub_metering_1
y2 <- powerdata[,8]  # Sub_metering_2
y3 <- powerdata[,9]  # Sub_metering_3
# To draw on screen, comment (#) lines png(.. and dev.off()
png(file = "plot3.png") # Open 'png' plot device
plot(x,y1, typ="n",ylab="Energy sub metering",xaxt="n", xlab="")
lines(x,y1,col = "Black")
lines(x,y2,col = "Red")
lines(x,y3,col = "Blue")
axis(1,at=c(0,1440,2880), labels=c("Thursday","Friday","Saturday"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("Black","Red","Blue"))
dev.off() # close graphics device
