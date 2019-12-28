library(readr)
library(tidyr)
library(lubridate)
df <- read_delim("household_power_consumption.txt",delim=";",na ="?", col_names = TRUE)
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df2 <- subset(df, DateTime >=dmy("1-2-2007") & DateTime < dmy("03-2-2007") )
#Plot 4
png(file="plot4.png")
par(mfrow=c(2,2))
plot(x=df2$DateTime, y=df2$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="",type="l")

plot(x=df2$DateTime, y=df2$Voltage, ylab = "Voltage", xlab="datetime",type="l")

plot(x=df2$DateTime, y=df2$Sub_metering_1,col="black", ylab = "Energy sub metering", xlab = "",type="l")
lines(x=df2$DateTime, y=df2$Sub_metering_2,col="red")
lines(x=df2$DateTime, y=df2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black',"red","blue"),lty=1,lwd=1)

plot(x=df2$DateTime, y=df2$Global_reactive_power, type="l")

dev.off()