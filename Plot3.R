data<-subset(read.table('household_power_consumption.txt',header=TRUE,sep=";",colClasses="character",na.strings="?"),Date == "1/2/2007" | Date =="2/2/2007")
data<-data[complete.cases(data),]

data$date_time<-strptime(paste(data$Date,data$Time,sep=' '),format="%d/%m/%Y %H:%M:%S")

png('plot3.png')
with(data, plot(date_time,Sub_metering_1,type='l',ylab="Energy sub metering",xlab=""))
with(data, lines(date_time,Sub_metering_2,type='l',col="red"))
with(data, lines(date_time,Sub_metering_3,type='l',col='blue'))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()