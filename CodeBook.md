## Code Book for Project 1 of Exploratory Data Analysis
### Overview of code
There are four R codes the repo: plot1.R, plot2.R, plot3.R, and plot4.R. All 4 scripts
read in data from the UCI machine learning data center. The data is cleaned up and then 
each script plots a different variable. plot1.R plots "global active power" as a histogram; plot2.R
creates a time series of this variable, plot3.R
plots the three sub_metering variables; plot4.R plots the same variables as plot2.R and plot3.R and also
Voltage and Global reactive power (on four panels).

## Local/Script variables
all_data: All of the data, which is read in.
date_var: A variable that specifies the date
new_data: filterd version of all_data that contains only 2 days in February of 2007
data_names: the names of the variables in the data frame.
new_dates: character variable of dates
new_time: character variable of times
comb_times: new_dates and new_time combined/pasted
gap: character variable of Global active power
gap2: numeric variable of gap, with ? switched to NAs
volt: character variable of Voltage
volt2: numeric variable of volt with ? switched to NAs
grp: character variable of Global reactive power
grp2: numeric variable of grp, with ? switched to NAs
sub1: numeric variable of sub_metering_1
sub2: numeric variable of sub_metering_2
sub3: numeric variable of sub_metering_3

## Running the code
At the top of each script setwd needs to be set to the working directory where the data file is located.
