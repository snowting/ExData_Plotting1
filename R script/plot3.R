library(data.table)


start2006=strptime("16/12/2006 17:24:00","%d/%m/%Y %H:%M:%S")
startRead=strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
endRead=strptime("02/02/2007 23:59:00","%d/%m/%Y %H:%M:%S")
skip=difftime(startRead, start2006, units="mins")
interval=difftime(endRead, startRead, units="mins")

header<-read.table("./household_power_consumption.txt", sep=";", nrows=1)
power<-read.table("./household_power_consumption.txt", na.strings="?", header=TRUE, sep=";", skip=skip, nrows=interval+1)
names(power)<-unlist(header)

## plot 3
power$dateTime<-strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S") 
png(
    "plot3.png",
    width     = 480,
    height    = 480,
    units     = "px"
)
with(power,plot(dateTime, Sub_metering_1, xlab="", ylab="Energy sub metering",type="l", col="black"))
lines(power$dateTime,power$Sub_metering_2, col="red")
lines(power$dateTime, power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(3,3,3),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()