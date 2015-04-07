all<-read.csv("household_power_consumption.txt", na.strings="?", header=TRUE,sep = ";", colClasses=c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
all$Date<-strptime(as.Date(all$Date,"%d/%m/%Y"),"%Y-%m-%d")
#filter for 2007Feb first 2 days
data<-all[all$Date=="2007-02-01"|all$Date=="2007-02-02",]
#save as 480X480 png
png("plot1.png",height = 480, width = 480, units="px")
hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()