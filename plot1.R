
#' Script to plot Global Active Power frequence dist

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
#for convenience, assign global active power to a variable called gap
gap<-df$Global_active_power
#turn on the graphics device
png("./plot1.png")
#do the plot
hist(gap, breaks=seq(floor(min(gap)), ceiling(max(gap)), by=.5), col="red", main="Global Active Power", xlab="Global Active Power (kilowattts)")
#turn of the graphics device
dev.off()
