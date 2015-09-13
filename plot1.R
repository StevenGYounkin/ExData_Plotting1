###Exploratory Data Analysis: Assignment 1

####Set Working Directory
setwd("H:\\ExData_Plotting1")

####Read Assignment1 dataset
library(data.table)
data <- fread("household_power_consumption.txt")

####Filter using dplyr to get target data for 2/1/2007 and 2/2/2007
library(dplyr)
All_Data <- tbl_df(data)
dates <- c("1/2/2007","2/2/2007")
Target_Data <- filter(All_Data, Date %in% dates)
Target_Data

####Mutate using dplyr to format all measurements as.numeric
Target_Data <- mutate(Target_Data, Global_active_power = as.numeric(Global_active_power))
Target_Data <- mutate(Target_Data, Global_reactive_power = as.numeric(Global_reactive_power))
Target_Data <- mutate(Target_Data, Voltage = as.numeric(Voltage))
Target_Data <- mutate(Target_Data, Global_intensity = as.numeric(Global_intensity))
Target_Data <- mutate(Target_Data, Sub_metering_1 = as.numeric(Sub_metering_1))
Target_Data <- mutate(Target_Data, Sub_metering_2 = as.numeric(Sub_metering_2))
Target_Data <- mutate(Target_Data, Sub_metering_3 = as.numeric(Sub_metering_3))

####Mutate using dplyr to concatenate Date and Time in PlotTime, then uses strptime to get PlotTime2 as time variable for plots
Target_Data <- mutate(Target_Data, PlotTime = paste(Date,Time))
PlotTime2 <- strptime(Target_Data$PlotTime,"%d/%m/%Y %H:%M:%S")
Target_Data
print(Target_Data$PlotTime[1:10])
print(PlotTime2[1:10])

####Create Plot 1, save as plot1.png
hist(Target_Data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "", col="red")
title("Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()



       





