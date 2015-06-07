#
# This file is part of exdata-015 course project implementation
# Individual household electric power consumption Data Set 
# is given as "household_power_consumption.txt" file.
# Overall goal is simply to examine how household energy usage varies
# over a 2-day period in February, 2007. 
# We need to recreate 4 plots by given example and save it 
# to a PNG file with a width of 480 pixels and a height of 480 pixels.
# This Plot4.R file contains code for reproduce Plot4.png
#

DAT<-fread("household_power_consumption.txt",na.strings = "?",colClasses=rep("character",times=9))
FILTEREDDATA<-subset(DAT, Date %in% c("1/2/2007","2/2/2007"))
FILTEREDDATA$Global_active_power<-as.numeric(FILTEREDDATA$Global_active_power)
FILTEREDDATA$Sub_metering_1<-as.numeric(FILTEREDDATA$Sub_metering_1)
FILTEREDDATA$Sub_metering_2<-as.numeric(FILTEREDDATA$Sub_metering_2)
FILTEREDDATA$Sub_metering_3<-as.numeric(FILTEREDDATA$Sub_metering_3)
FILTEREDDATA$Voltage<-as.numeric(FILTEREDDATA$Voltage)
FILTEREDDATA$Global_reactive_power<-as.numeric(FILTEREDDATA$Global_reactive_power)

#FILTEREDDATA$Time <- strptime(paste(FILTEREDDATA$Date, FILTEREDDATA$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
# This is requred on non english locales in order to get English weekdays short names on x label
Sys.setlocale("LC_TIME", "English")

par(mfrow=c(2,2))

with(
  FILTEREDDATA,{
    timestamps<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")

    plot(timestamps, Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power")
    
    plot(timestamps, Voltage, type="l",
         xlab="datetime", ylab="Voltage")

    plot(timestamps, Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(timestamps, Sub_metering_2, col="red")
    lines(timestamps, Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1,
           bty="n")
    
    plot(timestamps, Global_reactive_power, type="n",
         xlab="datetime", ylab="Global_reactive_power")
    lines(timestamps, Global_reactive_power)
    
  }
)

dev.off()