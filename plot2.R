## Exploratory Data Analysis (Coursera Feb 2015)
## Project 1   Base plotting system

## Read data from household_power_consumption.txt in working directory
# Data required for analysis are for 2-day period in February, 2007 - Feb 01 and 02.
# Preliminary file review shows that data for Feb 02, 20018
# starts on line 66638 and there are 2880 rows
dt<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
# assign names to the columns
names(dt)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## Plot 2 - graph of Global_active_power over time
# convert date and time variables into one datetime variable
# draw plot and save as png file in working directory
dt$sdate<-paste(dt$Date,dt$Time,sep=" ")
dt$ddate<-strptime(dt$sdate,'%d/%m/%Y %H:%M:%S')
png(file="./plot2.png")
with(dt,plot(dt$ddate,dt$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()


