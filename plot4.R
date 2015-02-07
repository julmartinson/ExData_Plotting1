## Exploratory Data Analysis (Coursera Feb 2015)
## Project 1   Base plotting system

## Read data from household_power_consumption.txt in working directory
# Data required for analysis are for 2-day period in February, 2007.
# Preliminary file review shows that starts on line 66638 and there are 2880 rows
df<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
# assign names to the columns
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Plot 4 - 4 graphs on one plot
# convert date and time variable one datetime variable
# draw 4 plot and save result as png file in working directory
df$sdate<-paste(df$Date,df$Time,sep=" ")
df$ddate<-strptime(df$sdate,'%d/%m/%Y %H:%M:%S')
png(file="plot4.png")
# split plot space into 2 columns and 2 rows
par(mfrow=c(2,2))  
# graph 1
with(df,plot(df$ddate,df$Global_active_power,type="l",ylab="Global Active Power",xlab=""))
# graph 2
with(df,plot(df$ddate,df$Voltage,type="l",ylab="Voltage",xlab="datetime"))
# graph 3
with(df,plot(df$ddate,df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(df,lines(df$ddate,df$Sub_metering_2,type="l",col="red"))
with(df,lines(df$ddate,df$Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c(1:3),lty = "solid",bty = "n")
# graph 4
with(df,plot(df$ddate,df$Global_reactive_power,type="l",ylab="Global_rective_power",xlab="datetime"))
dev.off()
