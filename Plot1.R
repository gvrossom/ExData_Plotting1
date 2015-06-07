mydf <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
mydf$Date <- as.Date(mydf$Date, "%d/%m/%Y")
mysubdf <- subset(mydf, "2007-02-01" <= Date & Date <= "2007-02-02")
mysubdf$Time <- as.POSIXct(paste(mysubdf$Date, as.character(mysubdf$Time)), format="%Y-%m-%d %H:%M:%S")
for (i in 3:4) { 
  mysubdf[,i] <- as.numeric(levels(mysubdf[,i]))[mysubdf[,i]]
}
png(filename = "Plot1.png")
hist(mysubdf$Global_active_power, 
     main= "Global Active Power",
     col= "red",
     xlab = "Global Active Power (kilowatts)")
dev.off()
