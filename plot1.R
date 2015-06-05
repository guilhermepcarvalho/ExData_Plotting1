## Loading the DPlyr amd lubridate packages
library(dplyr)
library(lubridate)

## Load the dataset
hpc_dataset <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)

## Filtering Data
hpc_dataset <- filter(hpc_dataset, Date == "1/2/2007" | Date == "2/2/2007")

##Plotting
png(file = "plot1.png", width = 480, height = 480) ## Open PDF device and create a file
hist(hpc_dataset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off() ## Close the PDF device
