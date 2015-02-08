## Exploratory Data Analysis (Coursera Feb 2015)
## Project 1   Base plotting system

## Read data from household_power_consumption.txt in working directory
# Data required for analysis are for 2-day period in February, 2007 - Feb 01 and 02.
# Preliminary file review shows that data for Feb 02, 20018
# starts on line 66638 and there are 2880 rows
dt<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
# assign names to the columns
names(dt)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Plot 1 - histogram of Global_active_power
# draw plot and save as png file in working directory
png(file="./plot1.png",width=480,height=480)
hist(as.numeric(dt$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",ylim=c(0,1200))
dev.off()

