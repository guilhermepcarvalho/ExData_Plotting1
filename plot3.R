Sys.setlocale("LC_TIME", "English")

## Loading the DPlyr amd lubridate packages
library(dplyr)
library(lubridate)

## Load the dataset
hpc_dataset <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)

## Filtering Data
hpc_dataset <- filter(hpc_dataset, Date == "1/2/2007" | Date == "2/2/2007")

## Converting Date and Time columns
hpc_dataset$datetime <- strptime(paste(hpc_dataset$Date, hpc_dataset$Time), format = "%d/%m/%Y %H:%M:%S")
hpc_dataset <- mutate(hpc_dataset, Date = dmy(hpc_dataset$Date))
hpc_dataset$Time <- strptime(hpc_dataset$Time, format = "%H:%M:%S")

##Plotting
png(file = "plot3.png", width = 480, height = 480) ## Open PDF device and create a file
plot(hpc_dataset$datetime, hpc_dataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc_dataset$datetime, hpc_dataset$Sub_metering_2, xlab = "", col = "red")
lines(hpc_dataset$datetime, hpc_dataset$Sub_metering_3, xlab = "", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"), lwd=2,
       col=c("black", "red", "blue"))
dev.off() ## Close the PDF device


