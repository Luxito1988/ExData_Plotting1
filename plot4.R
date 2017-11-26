
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
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(3, 4, 2, 2), oma = c(4, 2, 2, 2), mgp=c(3, 1, 0))
with(data6, {
plot(fechahoranueva2, Global_active_power2, type = "l" , lwd=1, xlab = "" , ylab = "Global Active Power")
plot(fechahoranueva2, as.numeric(as.character(Voltage)), type = "l", lwd=1, xlab = "datetime", ylab = "Voltage")
axis(2, at = seq(234, 246, by = 4))
plot(fechahoranueva2, as.numeric(Sub_metering_1), type="l", lwd=1, xlab="", ylab="Energy Submetering")
lines(fechahoranueva2, as.numeric(Sub_metering_2), type="l", lwd=1, col="red")
lines(fechahoranueva2, as.numeric(Sub_metering_3), type="l", lwd=1, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), cex=.60)
plot(fechahoranueva2, as.numeric(as.character(Global_reactive_power)), type = "l", lwd=1, xlab = "datetime", ylab = "Global_reactive_power")
axis(2, at = seq(0, 0.5, by = 0.1))
})
dev.off()
