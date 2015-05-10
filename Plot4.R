#Read data from file and subset it to the two days of interest (1/2/2007 and 2/2/2007)
#data<-subset(read.table('household_power_consumption.txt',header=TRUE,sep=";",colClasses="character",na.strings="?"),Date == "1/2/2007" | Date =="2/2/2007")

#Alternate (much faster) method to read only the rows of data corresponding to 1/2/2007 and 2/2/2007
skip<-36+6*60+(31-16+31)*24*60 #determine the number of rows to skip from the start of file
nrows<-2*24*60 # number rows to read 
#Read the data using ? for NA strings character
data<-read.table('household_power_consumption.txt',header=TRUE,sep=";",colClasses="character",na.strings="?",nrows=nrows,skip=skip)
#Remove rows with ?
data<-data[complete.cases(data),]
# Add variables names - trick used is to read only one row from the file and use its colnames
colnames(data)<-colnames(read.table('household_power_consumption.txt',header=TRUE,sep=";",nrows=1))

data$date_time<-strptime(paste(data$Date,data$Time,sep=' '),format="%d/%m/%Y %H:%M:%S")

png('plot4.png')
par(mfcol=c(2,2))

with(data, plot(date_time,Global_active_power,type='l',ylab="Global Active Power",xlab=""))

with(data, plot(date_time,Sub_metering_1,type='l',ylab="Energy sub metering",xlab=""))
with(data, lines(date_time,Sub_metering_2,type='l',col="red"))
with(data, lines(date_time,Sub_metering_3,type='l',col='blue'))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty='n')

with(data, plot(date_time,Voltage,type='l',xlab="datetime",ylab='Voltage'))

with(data, plot(date_time,Global_reactive_power,type='l',xlab="datetime"))


dev.off()