# README file
# Getting and cleaning data 
# Final assignment


## This document describes the code in the script titled "run_analysis"
####Comments are made throughtout the script to aid readability as well####


**Lines**

7: set directory where raw data was extracted to

13-22: reads in data files and headers necessary to complete analysis

Note: the Inertial Signals data is not required

26-27: turns the data headings provided in the label files into a usable form

30-43: assigns appropriate headings to all data files

50-52: starts building the merged data. The Subject Train and Test data are row-bound together, as are the Activity and Feature Measurements data

54: completed building the merged data. The data tables built in the above step are column-bound together, to complete the data table

Note: the data table matches the structure outlined in the picture in the repo titled "Merged Data Structure"

59-60: index list is created determining which feature measurements contain a mean or standard deviation result. This encompases all headings with phrase "mean" or "std" in it

64: combine index lists of all columns required into one vector

67: extract from full data table only relevant columns (i.e. those that were mean or std based) based on indexed vector

73-87: re-assign Activity ID numbers to be worded descriptions

91: rename heading of activities column to reference description not ID

95: sort the table previously made by Subject ID, for tidyness

99: write the data table created to a text file in the folder set by the working directory

*Notes:* 

Final data is not ordered by Subject ID, but this is not a requirement of tidy data

Sense checks were performed on output data for reasonablenss e.g. no NA values are in the data set

The data table includes column headings such as "meanFreq..." as per my interpretation of the question