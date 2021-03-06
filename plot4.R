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

##Create plot4 and save it as a png file:
png(filename="plot4.png")
par(mfrow=c(2,2),mai = c(1, 1, 0.1, 0.1))
with(d,{
  plot(posixDate,Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.lab=0.6)
  plot(posixDate,Voltage,type="l",xlab="datetime",ylab="Voltage",cex.lab=0.6)
  with(d,{
    plot(posixDate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",cex.lab=0.6)
    lines(posixDate,Sub_metering_2,type="l",col="red")
    lines(posixDate,Sub_metering_3,type="l",col="blue")
    legend("topright", pch="_", cex=0.45, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pt.cex = 2)
  })
  plot(posixDate,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",cex.lab=0.6)
})
dev.off()