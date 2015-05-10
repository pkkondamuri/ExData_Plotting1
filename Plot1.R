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

png('plot1.png')
with(data,hist(as.numeric(data$Global_active_power),main="Global Active Power",xlab=("Global Active Power (kilowatts)"),col='red'))
dev.off()
