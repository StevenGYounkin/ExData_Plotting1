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
Target_Data <- mutate(Target_Data, PlotDate = paste(Date,Time))
Target_Data 
###Create Plot 3, save as plot3.png
plot(PlotTime2,Target_Data$Sub_metering_1,xlab = "",ylab = "Energy sub metering", "l", col="black", mar=c(2,2,2,2))
points(PlotTime2,Target_Data$Sub_metering_2, "l", col="red")
points(PlotTime2,Target_Data$Sub_metering_3, "l", col="blue")
legend("topright", legend = c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "), lty = c(1,1,1), col=c("black","red","blue"), cex = 1, xjust=0)
dev.copy(png, file="plot3.png")
dev.off()