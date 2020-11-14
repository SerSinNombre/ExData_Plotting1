##Read file
HPCT<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
HPC<-subset(HPCT,Date=="1/2/2007"|Date=="2/2/2007") ##subset selected days
daysHours<-strptime(paste(HPC$Date,HPC$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S") ##Create date vector

SM1<-(as.numeric(HPC$Sub_metering_1)) ## Convert data to numerical data
SM2<-(as.numeric(HPC$Sub_metering_2)) ## Convert data to numerical data
SM3<-(as.numeric(HPC$Sub_metering_3)) ## Convert data to numerical data

## Plot 3
## Energy sub metering [Sub_metering_1,Sub_metering_2,Sub_metering_3] and days

png("plot3.png",width=480,height=480)##png device

plot(daysHours,SM1,type="l",lwd=1,xlab="",ylab="Energy sub metering")
lines(daysHours,SM2,type="l",lwd=1,xlab="",col="red")
lines(daysHours,SM3,type="l",lwd=1,xlab="",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=1,lwd=1)
dev.off() #close device