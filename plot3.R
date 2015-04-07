all<-read.csv("household_power_consumption.txt", na.strings="?", header=TRUE,sep = ";", colClasses=c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
all$Date2<-strptime(as.Date(all$Date,"%d/%m/%Y"),"%Y-%m-%d")
#filter for 2007Feb first 2 days
all<-all[all$Date2=="2007-02-01"|all$Date2=="2007-02-02",]
#use both date and time for posixlt, not just date
all$Date2<-strptime(paste(all$Date, all$Time),"%d/%m/%Y %H:%M:%S")
#dataTFS<-data[weekdays(data$Date) %in% c("Thursday", "Friday", "Saturday"),]
#save as 480X480 png
png("plot2.png",height = 480, width = 480, units="px")
with(all, plot(Date2, Global_reactive_power, type="n"))
plot(x=all$Date2, y=all$Global_active_power,type = "l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()