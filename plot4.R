## plot4.R
  
  setwd("~/datasciencecoursera/ExploratoryDataAnalysis")

  ## Read data
  data = read.table("household_power_consumption.txt", na.string='?',sep=';',header=TRUE)
  data$Date=strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  data=subset(data, (data$Date>=strptime("2007-02-01","%Y-%m-%d")&(data$Date<strptime("2007-02-03","%Y-%m-%d"))))
  
  par(mfrow = c(2, 2))  ## Four graphs
  par(mar=c(5,5,2,2))
  
  with(data,{
    
    plot(data$Date,data$Global_active_power,type="l", xlab="",ylab="Global Active Power (Kilowatts)") ## line plot 1
    
    plot(data$Date,data$Voltage,type="l", xlab="datetime",ylab="Voltage") ## Graph 2
    

    
    plot(data$Date,data$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering") ## Graph 3
    lines(data$Date,data$Sub_metering_1,type="l") ## line plot
    lines(data$Date,data$Sub_metering_2,type="l",col="red") ## line plot
    lines(data$Date,data$Sub_metering_3,type="l",col="blue") ## line plot
    legend("topright", lty=1, text.font=.1,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(data$Date,data$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power") ## Graph 4
  }
  )
  
  
  dev.copy(png, file = "plot4.png", height=480,width=480) ## Copy my plot to a PNG file
  dev.off() ## Don't forget to close the PNG device!
  
}
