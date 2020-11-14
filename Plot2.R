##Read file
HPCT<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
HPC<-subset(HPCT,Date=="1/2/2007"|Date=="2/2/2007") ##subset selected days
daysHours<-strptime(paste(HPC$Date,HPC$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S") ##Create date vector
GAP<-(as.numeric(HPC$Global_active_power)) ## Convert data to numerical data

## Plot 2
## Global Active Power (kilowatts) [Global_active_power] and days
png("plot2.png",width=480,height=480)##png device
plot(daysHours,GAP,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off() #close device