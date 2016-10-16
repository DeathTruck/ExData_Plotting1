# This R code reads in data from UCI data archive on power consumption
# The code then subsets the data, slightly cleans it, and plots a 
# time series of 3 sub_meterings
# Code written by Nik Buenning 10/15/2016

# Set working directory (this will need to be changed to reproduce the results)
# change. This directory should contain the data file.
setwd("/Users/buenning/data_science/exploratory_data_analysis")

# needed libraries
library(lubridate)

# Read in data, and subset the data over the desired time interval
all_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
date_var <- as.Date(all_data$Date, format = "%d/%m/%Y")
new_data = subset(all_data, year(date_var) == 2007 & month(date_var) == 2 & day(date_var) <= 2)
data_names <- names(all_data)

# Make date and time variable
new_dates <- as.character(new_data$Date)
new_time <- as.character(new_data$Time)
date_times <- paste
comb_times <- strptime(paste(new_dates, new_time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

# Get sub_metering data
sub1 <- as.numeric(as.character(new_data$Sub_metering_1))
sub2 <- as.numeric(as.character(new_data$Sub_metering_2))
sub3 <- as.numeric(as.character(new_data$Sub_metering_3))

# Plotting Code, Output to a png file
png(filename="plot3.png", width = 480, height = 480)
plot(comb_times, sub1, type ="n", xlab="", 
     ylab="Energy sub metering")
lines(comb_times, sub1, col = "black")
lines(comb_times, sub2, col = "red")
lines(comb_times, sub3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend=data_names[7:9], lty=c(1, 1, 1))
dev.off()
