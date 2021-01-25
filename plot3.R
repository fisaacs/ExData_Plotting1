##plot3.R - Fielding Isaacs
##Simultaneously Plots Sub-Metering Data

plot3 <- function() {
  
  setwd("data")
  rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
  setwd("..")
  mergedTime <- strptime(with(rawData,paste(Date,Time)),format = "%d/%m/%Y %H:%M:%S")
  mergedData <- cbind(mergedTime,rawData[,3:9])
  plottingData <- subset(mergedData,mergedTime >= "2007-02-01" & mergedTime < "2007-02-03")
  plottingData
  
  ##PNG device setup.  Commented out for plot design
  png(filename = "plot3.png", 
      width = 480, height = 480)
  plot(plottingData$mergedTime,plottingData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(plottingData$mergedTime,plottingData$Sub_metering_2,col="red")
  lines(plottingData$mergedTime,plottingData$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering 2","Sub_metering 3"),lty=1)
  
  dev.off()
  
}

plot3()