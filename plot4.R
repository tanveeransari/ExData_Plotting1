all<-read.csv("household_power_consumption.txt", na.strings="?", header=TRUE,sep = ";", 
              colClasses=c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
all$Date2<-strptime(as.Date(all$Date,"%d/%m/%Y"),"%Y-%m-%d")
#filter for 2007Feb first 2 days
all<-all[all$Date2=="2007-02-01"|all$Date2=="2007-02-02",]
#use both date and time for posixlt, not just date
all$Date2<-strptime(paste(all$Date, all$Time),"%d/%m/%Y %H:%M:%S")

#save as 480X480 png
png("plot4.png",height = 480, width = 480, units="px")

par(mfrow=c(2,2))

with(all,{
  # plot 1 - global active power
  plot(Date2, Global_active_power,type = "l", ylab="Global Active Power",xlab="")
  
  # plot 2 - Voltage
  plot(Date2, Voltage,type = "l", ylab="Voltage",xlab="")
  
  # plot 3 - energy sub metering
  plot(Date2, Sub_metering_1, type="n",ylab="Energy sub metering", xlab="", ylim=c(0,38))
  points(Date2, Sub_metering_1, type="l", col="black")
  points(Date2, Sub_metering_2, type="l", col="red")
  points(Date2, Sub_metering_3, type="l", col="blue")
  legend("topright",pch=95, col = c("black","red","blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #plot 4 - Global_reactive_power
  plot(Date2, Global_reactive_power,type = "l", ylab="Global_reactive_power",xlab="datetime")
})







#save the plot
dev.off()