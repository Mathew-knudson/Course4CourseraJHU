library(readr)
library(tidyr)
library(lubridate)
df <- read_delim("household_power_consumption.txt",delim=";",na ="?", col_names = TRUE)
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)
df <- subset(df, Date=="2007-02-01" | Date=="2007-02-02" )

#Plot 1
png("Plot")