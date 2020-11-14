##Read file
HPCT<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
HPC<-subset(HPCT,Date=="1/2/2007"|Date=="2/2/2007") ##subset selected days
daysHours<-strptime(paste(HPC$Date,HPC$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S") ##Create date vector
GAP<-(as.numeric(HPC$Global_active_power)) ## Convert data to numerical data

##Plot 1
## Hist Global Active Power (kilowatts) [Global_active_power]
## Title: Global Active Power
png("plot1.png",width=480,height=480)##png device
hist(GAP,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off() #close device
