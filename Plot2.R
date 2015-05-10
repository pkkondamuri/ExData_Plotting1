data<-subset(read.table('household_power_consumption.txt',header=TRUE,sep=";",colClasses="character",na.strings="?"),Date == "1/2/2007" | Date =="2/2/2007")
data<-data[complete.cases(data),]

data$date_time<-strptime(paste(data$Date,data$Time,sep=' '),format="%d/%m/%Y %H:%M:%S")

png('plot2.png')
with(data, plot(date_time,Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()