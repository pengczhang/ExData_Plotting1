## Read txt file from local source, setting header as TRUE, ; as separator and all
## ? as NA
data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## reformat Date and Time as POSIXlt and store in d, then replace Date from data with
## reformatted data d

d<-as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date<-d

## subset just 2007-07-01 and 2007-07-02 and store in new dataframe sample
sample<-subset(data, Date>=as.POSIXlt('2007-02-01') & Date<as.POSIXlt('2007-02-03'))

## Open png device and create file in working dir.
png(filename="plot2.png")
## send plot to png device
plot(sample$Date, sample[[3]], type="l", xlab="", ylab="Global Active Power (kilowatts)")
## close png device
dev.off()
