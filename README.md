# README file
# Getting and cleaning data 
# Final assignment


## This document describes the code in the script titled "run_analysis"
####Comments are made throughtout the script to aid readability as well####


**Lines**

7: set direcgtory where raw data was extracted to

13-22: reads in data files and headers necessary to complete analsis

Note: the Inertial Signals data is not required

26-27: turns the data headings provided in the label files into a usable form

30-43: assigns appropriate heading to all data files

50-52: starts building the merged data. The Subject Train and Test data are row-bound together, as are the Activity and Feature Measurements data

54: completed building the merged data. The data tables built in the above step are column-bound together, to complete the data tables

Note: the data table matches the structure outlined in the picture in the repo titled "Merged Data Structure"

59-60: index list is created determining which feature measurements contain a mean or standard deviation result. This encompases all headings with phras "mean" or "std" in it

64: combine index lists of all columns required into one vector

67: extract from full data table only relevant columns based on indexed vector

73-87: re-assign Activity ID numbers to be worded descriptions

91: rename heading of activities column to reference description not ID

Note: Steps 1-4 are now complete

99: build data consisting of non-subject and non-activity columns

102: take row means of feature measurements

105: rebuild data table to consist of Subject ID, Activity descriptions and newly calculated means

108: rename the variable in the final column to be descriptive

Note: sense checks were performed on output data for reasonablenss
