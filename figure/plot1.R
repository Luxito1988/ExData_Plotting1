
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

#create histogram and save result in file png
png("plot1.png", width=480, height=480)
hist(data4$Global_active_power2, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()