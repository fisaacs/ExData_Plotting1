##plot2.R - Fielding Isaacs
##Plots Date vs Global Active Power from EPC data set

plot2 <- function() {

  setwd("data")
  rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
  setwd("..")
  mergedTime <- strptime(with(rawData,paste(Date,Time)),format = "%d/%m/%Y %H:%M:%S")
  mergedData <- cbind(mergedTime,rawData[,3:9])
  plottingData <- subset(mergedData,mergedTime >= "2007-02-01" & mergedTime < "2007-02-03")
  plottingData
  
  ##PNG device setup.  Commented out for plot design
  png(filename = "plot2.png", 
      width = 480, height = 480)
  plot(plottingData$mergedTime,plottingData$Global_active_power,
       type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  dev.off()
  
}

plot2()