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

##plot2:
plot(d$posixDate,d$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
