# This R code reads in data from UCI data archive on power consumption
# The code then subsets the data, slightly cleans it, and plots a 
# time series of global active power
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

# Make date and time variable
new_dates <- as.character(new_data$Date)
new_time <- as.character(new_data$Time)
comb_times <- strptime(paste(new_dates, new_time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

# Get Global Active Power and replace ?s with NAs
gap <- as.character(new_data$Global_active_power)
gap2 <- as.numeric(gsub("\\?", "NA", gap))

# Plotting Code, Output to a png file
png(filename="plot2.png", width = 480, height = 480)
plot(comb_times, gap2, type ="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
