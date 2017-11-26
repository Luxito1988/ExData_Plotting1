
#write libraries
library(plyr)
library(dplyr)
library(lubridate)

#assign a working directory
setwd("C:/Users/junio/Desktop/COURSERA/DATA SCIENCE/COURSE 4 - Exploratory Data Analysis/WEEK 1/PROJECT")

#read the data from "household_power_consumption.txt"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#data's transformation
data1 <- mutate(data, fechanueva = dmy(Date))
data2 <- filter(data1, fechanueva == "2007-02-01" | fechanueva == "2007-02-02")
data3 <- mutate(data2, horanueva = hms(Time))
data4 <- mutate(data3, Global_active_power2 = as.numeric(as.character(Global_active_power)))
data5 <- mutate(data4, fechahoranueva = paste(as.character(Date), as.character(Time), sep = " "))
data6 <- mutate(data5, fechahoranueva2 = dmy_hms(fechahoranueva))

#create plot and save result in file png 
png("plot2.png", width=480, height=480)
with(data6, plot(fechahoranueva2, Global_active_power2, type = "l" , lwd=1, xlab = "" , ylab = "Global Active Power (kilowatts)"))
dev.off()
