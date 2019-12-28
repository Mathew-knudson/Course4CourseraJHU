library(readr)
library(tidyr)
library(lubridate)
df <- read_delim("household_power_consumption.txt",delim=";",na ="?", col_names = TRUE)
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df2 <- subset(df, DateTime >=dmy("1-2-2007") & DateTime <=dmy("03-2-2007") )

#Plot 2

png(file="plot2.png")
plot(x=df2$DateTime, y=df2$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
