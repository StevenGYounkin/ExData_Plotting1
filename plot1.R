###Read Assignment 1 dataset
library(data.table)
data <- fread("household_power_consumption.txt")
###Filter to get target data
library(dplyr)
All_Data <- tbl_df(data)
All_Data
###Format all measurements as.numeric
dates <- c("1/2/2007","2/2/2007")
Target_Data <- filter(All_Data, Date %in% dates)
Target_Data
Target_Data <- mutate(Target_Data, Global_active_power = as.numeric(Global_active_power))
Target_Data <- mutate(Target_Data, Global_reactive_power = as.numeric(Global_reactive_power))
Target_Data <- mutate(Target_Data, Voltage = as.numeric(Voltage))
Target_Data <- mutate(Target_Data, Global_intensity = as.numeric(Global_intensity))
Target_Data <- mutate(Target_Data, Sub_metering_1 = as.numeric(Sub_metering_1))
Target_Data <- mutate(Target_Data, Sub_metering_2 = as.numeric(Sub_metering_2))
Target_Data <- mutate(Target_Data, Sub_metering_3 = as.numeric(Sub_metering_3))
Target_Data 
###Create Plot 1
hist(Target_Data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "", col="red")
title("Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()