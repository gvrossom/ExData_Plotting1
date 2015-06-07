mydf <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
mydf$Date <- as.Date(mydf$Date, "%d/%m/%Y")
mysubdf <- subset(mydf, "2007-02-01" <= Date & Date <= "2007-02-02")
mysubdf$Time <- as.POSIXct(paste(mysubdf$Date, as.character(mysubdf$Time)), format="%Y-%m-%d %H:%M:%S")
for (i in 3:8) { 
  mysubdf[,i] <- as.numeric(levels(mysubdf[,i]))[mysubdf[,i]]
}
png("Plot4.png")
par(mfrow= c(2,2))
plot(y = mysubdf$Global_active_power, x = mysubdf$Time, type = "l", ylab = "Global Active Power", xlab = "")
plot(y = mysubdf$Voltage, x = mysubdf$Time, type = "l", ylab = "Voltage", xlab = "datetime")
plot(y = mysubdf$Sub_metering_1, x = mysubdf$Time, type = "l",
     ylab= "Energy sub metering", xlab = "")
lines( x= mysubdf$Time, y = mysubdf$Sub_metering_2, col = "red")
lines( x= mysubdf$Time, y = mysubdf$Sub_metering_3, col = "blue")
legend("topright", pch = "-", col = c("black","blue","red"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(y = mysubdf$Global_reactive_power, x = mysubdf$Time, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()