##First, download and read the electricity data set

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="electric.zip")
library(data.table)
ele <- fread("electric.txt",header=F,nrows=4000,skip=66636)
colNames <- fread("electric.txt",nrows=1,header=F)
colnames(ele) <- as.character(colNames)
d <- as.data.frame(ele)
d<-d[d$Date=="1/2/2007"|d$Date=="2/2/2007",]
d$datetime <- paste(d$Date, d$Time)
d$posixDate <- strptime(d$datetime, "%d/%m/%Y %H:%M:%S")

##Create plot3 and save it as a png file:
png(filename="plot3.png")
plot(d$posixDate,d$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(d$posixDate,d$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(d$posixDate,d$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright", pch="_", ,pt.cex=3, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()