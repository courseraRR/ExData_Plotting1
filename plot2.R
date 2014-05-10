#' Script to plot Global Active Power as a function of time

#if necessary download and unzip the data file to current directory 
if(!file.exists("household_power_consumption.txt")){
  require(utils)
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                "household_power_consumption.zip", method="curl") # download
  unzip("household_power_consumption.zip" )
}

#set the path to the data file
data.file.name<-"./household_power_consumption.txt"
#read the file
df<-read.csv(data.file.name, sep=";", stringsAsFactors=FALSE, na.strings="?")
#subset to the desired dates
df<-subset(df, df$Date=="1/2/2007"| df$Date=="2/2/2007")
#add a date-time column
df$date.time<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
#turn on the graphics device
png("./plot2.png")
#do the plot
plot(x=df$date.time, y=df$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
#turn of the graphics device
dev.off()
