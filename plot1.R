#
# This file is part of exdata-015 course project implementation
# Individual household electric power consumption Data Set 
# is given as "household_power_consumption.txt" file.
# Overall goal is simply to examine how household energy usage varies
# over a 2-day period in February, 2007. 
# We need to recreate 4 plots by given example and save it 
# to a PNG file with a width of 480 pixels and a height of 480 pixels.
# This Plot1.R file contains code for reproduce Plot1.png
#

DAT<-fread("household_power_consumption.txt",na.strings = "?",colClasses=rep("character",times=9))
FILTEREDDATA<-subset(DAT, Date %in% c("1/2/2007","2/2/2007"))
FILTEREDDATA$Global_active_power<-as.numeric(FILTEREDDATA$Global_active_power)

png("plot1.png", width=480, height=480)

with(
  FILTEREDDATA,
  hist(
    Global_active_power,
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    col="red"
))

dev.off()