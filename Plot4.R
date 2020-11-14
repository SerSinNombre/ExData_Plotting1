##Read file
HPCT<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
HPC<-subset(HPCT,Date=="1/2/2007"|Date=="2/2/2007") ##subset selected days
daysHours<-strptime(paste(HPC$Date,HPC$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S") ##Create date vector

GAP<-(as.numeric(HPC$Global_active_power)) ## Convert data to numerical data

SM1<-(as.numeric(HPC$Sub_metering_1)) ## Convert data to numerical data
SM2<-(as.numeric(HPC$Sub_metering_2)) ## Convert data to numerical data
SM3<-(as.numeric(HPC$Sub_metering_3)) ## Convert data to numerical data

## Plot 4
## c2,r2
## Global Active Power [Global_active_power] and days
## Voltage [Voltage] and days (xlabel:datetime)
## Energy sub metering [Sub_metering_1,Sub_metering_2,Sub_metering_3] and days
## Global reactive power [Global_reactive_power] and days (xlabel:date)

Voltage<-(as.numeric(HPC$Voltage)) ## Convert data to numerical data
GRP<-(as.numeric(HPC$Global_reactive_power)) ## Convert data to numerical data

png("plot4.png",width=480,height=480)##png device
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
##C1R1
plot(daysHours,GAP,type="l",xlab="",ylab="Global Active Power")
##C2R1
plot(daysHours,Voltage,type="l",xlab="datetime",ylab="Voltage")
##C1R2
plot(daysHours,SM1,type="l",lwd=1,xlab="",ylab="Energy sub metering")
lines(daysHours,SM2,type="l",lwd=1,xlab="",col="red")
lines(daysHours,SM3,type="l",lwd=1,xlab="",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=1,lwd=1,bty="n")
##C2R2
plot(daysHours,GRP,type="l",xlab="datetime",ylab="Global reactive power")

dev.off() #close device

