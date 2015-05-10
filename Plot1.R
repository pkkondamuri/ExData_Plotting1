data<-subset(read.table('household_power_consumption.txt',header=TRUE,sep=";",colClasses="character",na.strings="?"),Date == "1/2/2007" | Date =="2/2/2007")
data<-data[complete.cases(data),]
png('plot1.png')
with(data,hist(as.numeric(data$Global_active_power),main="Global Active Power",xlab=("Global Active Power (kilowatts)"),col='red'))
dev.off()

