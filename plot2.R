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
png(file = "plot2.png", width = 480, height = 480) ## Open PDF device and create a file
plot(hpc_dataset$datetime, hpc_dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() ## Close the PDF device


