##plot4.R - Fielding Isaacs
##Generates quad-plot of Global Active Power, Voltage over time,
##Energy sub metering, and Global Reactive Power

plot4 <- function() {
  
  setwd("data")
  rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
  setwd("..")
  mergedTime <- strptime(with(rawData,paste(Date,Time)),format = "%d/%m/%Y %H:%M:%S")
  mergedData <- cbind(mergedTime,rawData[,3:9])
  plottingData <- subset(mergedData,mergedTime >= "2007-02-01" & mergedTime < "2007-02-03")
  plottingData
  
  ##PNG device setup.  Commented out for plot design
  png(filename = "plot4.png", 
      width = 480, height = 480)
  
  #multi-row setup
  par(mfrow = c(2,2))

  #4.A - Global Active Power
  plot(plottingData$mergedTime,plottingData$Global_active_power,
       type="l",xlab="",ylab="Global Active Power")
  
  #4.B - Voltage over time
  plot(plottingData$mergedTime,plottingData$Voltage,
             type="l",xlab="datetime",ylab="Voltage")
  
  #4.C - Energy sub metering
  plot(plottingData$mergedTime,plottingData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(plottingData$mergedTime,plottingData$Sub_metering_2,col="red")
  lines(plottingData$mergedTime,plottingData$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering 2","Sub_metering 3"),lty=1)
  
  #4.D - Global Reactive Power
  plot(plottingData$mergedTime,plottingData$Global_reactive_power,
             type="l",xlab="datetime",ylab="Voltage")
  
  dev.off()
  
}

plot4()