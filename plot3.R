#' Script to plot Sub Metering as a function of time

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
png("./plot3.png")
#do the plot
with(df,{
  plot(x=date.time, y=Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
  lines(x=date.time, y=Sub_metering_2, col="red")
  lines(x=date.time, y=Sub_metering_3, col="blue")
  #do the legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty=1, 
         col=c("black","red","blue"), )
})
#turn of the graphics device
dev.off()
