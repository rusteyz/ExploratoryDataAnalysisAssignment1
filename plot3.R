## plot3.R

  setwd("~/datasciencecoursera/ExploratoryDataAnalysis")

  ## Read data
  data = read.table("household_power_consumption.txt", na.string='?',sep=';',header=TRUE)
  data$Date=strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  data=subset(data, (data$Date>=strptime("2007-02-01","%Y-%m-%d")&(data$Date<strptime("2007-02-03","%Y-%m-%d"))))
 
  with(data, plot(data$Date,data$Sub_metering_1,type="n", xlab="",ylab="Energy Sub metering"))
  with(data, lines(data$Date,data$Sub_metering_1,type="l")) ## line plot
  with(data, lines(data$Date,data$Sub_metering_2,type="l",col="red")) ## line plot
  with(data, lines(data$Date,data$Sub_metering_3,type="l",col="blue")) ## line plot
  
  legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.copy(png, file = "plot3.png", height=480,width=480) ## Copy my plot to a PNG file
  dev.off() ## Don't forget to close the PNG device!
  
