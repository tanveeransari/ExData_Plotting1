all<-read.csv("household_power_consumption.txt", na.strings="?", header=TRUE,sep = ";", 
              colClasses=c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

all$Date2<-strptime(as.Date(all$Date,"%d/%m/%Y"),"%Y-%m-%d")
#filter for 2007Feb first 2 days
all<-all[all$Date2=="2007-02-01"|all$Date2=="2007-02-02",]
#use both date and time for posixlt, not just date
all$Date2<-strptime(paste(all$Date, all$Time),"%d/%m/%Y %H:%M:%S")

#save as 480X480 png
png("plot3.png",height = 480, width = 480, units="px")

# lay out the outline of the chart, y label and y axis limits
with(all, plot(Date2, Sub_metering_1, type="n",ylab="Energy sub metering", xlab="", ylim=c(0,38)))

# plot sub meters for each metering type
with(all, points(Date2, Sub_metering_1, type="l", col="black"))
with(all, points(Date2, Sub_metering_2, type="l", col="red"))
with(all, points(Date2, Sub_metering_3, type="l", col="blue"))

# plot legend at top right
legend("topright",pch=95, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#save the plot
dev.off()