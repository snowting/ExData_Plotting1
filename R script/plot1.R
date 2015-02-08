library(data.table)


start2006=strptime("16/12/2006 17:24:00","%d/%m/%Y %H:%M:%S")
startRead=strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
endRead=strptime("02/02/2007 23:59:00","%d/%m/%Y %H:%M:%S")
skip=difftime(startRead, start2006, units="mins")
interval=difftime(endRead, startRead, units="mins")

header<-read.table("./household_power_consumption.txt", sep=";", nrows=1)
power<-read.table("./household_power_consumption.txt", na.strings="?", header=TRUE, sep=";", skip=skip, nrows=interval+1)
names(power)<-unlist(header)
png(
    "plot1.png",
    width     = 480,
    height    = 480,
    units     = "px"
)
## plot 1
par(mar=c(3,5,2,2))
hist(power$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", ylab="Frequency",
     main="Global Active Power")
dev.off()