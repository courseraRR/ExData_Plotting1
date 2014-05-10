#Script to do 4 plots: Global Active Power, Voltage, Energy Submetering, and Voltage
#as a function of time

#set the path to the data file
data.file.name<-"./household_power_consumption.txt"
#read the file
df<-read.csv(data.file.name, sep=";", stringsAsFactors=FALSE, na.strings="?")
#subset to the desired dates
df<-subset(df, df$Date=="1/2/2007"| df$Date=="2/2/2007")
#add a date-time column
df$date.time<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
#turn on the graphics device
png("./plot4.png")
#set the layout
par(mfrow=c(2,2))
with(df,{
  #do global active power
  plot(x=date.time, y=Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
  #do Voltabe
  plot(x=date.time, y=Voltage, type='l', ylab="Voltage", xlab="datetime")
  #do Energy submetering
  plot(x=date.time, y=Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
  lines(x=date.time, y=Sub_metering_2, col="red")
  lines(x=date.time, y=Sub_metering_3, col="blue")
  #do global reactive powe
  plot(x=date.time, y=Global_reactive_power, type='l',  ylab="Global Reactive Power (kilowatts)", xlab="datetime")  
}    
)
#turn of the graphics device
dev.off()
