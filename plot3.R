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
png(filename="plot3.png")
## send plot to png device
plot(sample$Date, sample[[7]], type="l", xlab="", ylab="Energy sub metering", col="Black")
## add additional lines with lines, setting color
lines(sample$Date, sample[[8]], col="Red")
lines(sample$Date, sample[[9]], col="Blue")
## add legend to top right corner
legend("topright", lty=1, col=c("Black", "Red", "Blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
## close png device
dev.off()