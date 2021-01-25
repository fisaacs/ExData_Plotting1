##plot1.R - Fielding Isaacs
##Plots Global Active Power from EPC data set

source('dataIn.R')
#plottingData <- readEPC() #pulls 1FEB07-2FEB07 Data

plot1 <- function() {
  setwd("data")
  rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
  setwd("..")
  mergedTime <- strptime(with(rawData,paste(Date,Time)),format = "%d/%m/%Y %H:%M:%S")
  mergedData <- cbind(mergedTime,rawData[,3:9])
  plottingData <- subset(mergedData,mergedTime >= "2007-02-01" & mergedTime < "2007-02-03")
  plottingData

  ##PNG device setup.  Commented out for plot design
  png(filename = "plot1.png", 
      width = 480, height = 480)
  hist(as.numeric(plottingData$Global_active_power),col = "red",
       xlab="Global Active Power (kilowatts",
       main = "Global Active Power")
  dev.off()

}

plot1()