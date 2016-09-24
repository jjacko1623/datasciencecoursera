## Final Assignment
## Getting and Cleaning Data Module

#setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Getting and Cleaning Data/GitHubRepo/datasciencecoursera")
setwd("C:/Users/Sophy/Desktop/JJ Coursera/GitHubRepo")
##read in files from set directory


######################################################
##Change title of script to run_analysis when done
######################################################

#Read in once, then can comment out when rerunning :)
#ActLab <- read.table("./UCI HAR Dataset/activity_labels.txt",header = F)

#SubjectsTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = F)
#XTest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = F)
#yTest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = F)

#SubjectsTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = F)
#XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = F)
#yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = F)

#BodyAccXTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header = F)
#BodyAccYTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header = F)
#BodyAccZTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header = F)
#BodyGyroXTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header = F)
#BodyGyroYTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header = F)
#BodyGyroZTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header = F)
#TotAccXTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header = F)
#TotAccYTest <- read.table("./UCI HAR Dataset/acttest/Inertial Signals/total_acc_y_test.txt",header = F)
#TotAccZTest <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header = F)

#BodyAccXTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header = F)
#BodyAccYTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header = F)
#BodyAccZTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header = F)
#BodyGyroXTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header = F)
#BodyGyroYTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header = F)
#BodyGyroZTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header = F)
#TotAccXTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header = F)
#TotAccYTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header = F)
#TotAccZTrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header = F)

#FeaturesData <- read.table("./UCI HAR Dataset/features.txt",header = F)

#Trim erroneous column from data read in
ActivityDescriptions <- ActLab[,2]
FeaturesDescriptions <- FeaturesData[,2]

#Assign column names to XTest and XTrain, which are the measurement features
names(XTest) <- FeaturesDescriptions
names(XTrain) <- FeaturesDescriptions

#Assign column name to yTest and yTrain, which are the activities
names(yTest) <- "Activity ID"
names(yTrain) <- "Activity ID"

#Assign column name to SubjectTest and SubjectTrain, which are the subjects
names(SubjectsTest) <- "Subject ID"
names(SubjectsTrain) <- "Subject ID"

#Assign column names to XTest and XTrain
names(XTest) <- FeaturesDescriptions
names(XTrain) <- FeaturesDescriptions


## cbind & rbind as shown in picture
## rbind subjects, activites and feautre measurements individually
## cbind subjects, activites and feautre measurements together

#### cbind activites, subjects and feature measurements
#### rbind headings, train data and test data

rSubject <- rbind(SubjectsTrain,SubjectsTest)
rActivity <- rbind(yTrain,yTest)
rFeature <- rbind(XTrain,XTest)

mergedData <- cbind(rSubject,rActivity,rFeature)


#Step 2
#get column names that have term "mean" & "sd" in them
meancolindex <- grep("mean",FeaturesDescriptions)
stdcolindex <- grep("std",FeaturesDescriptions)

#combine column indecies to extract mean & std columns
#offset by 2 to allow for subjects and activities columns
filtercolindex <- c(1,2,sort(c(meancolindex,stdcolindex))+2)

#extract mean & std columns from merged data
filterMergedData <- mergedData[filtercolindex]


#change activity numbers to descriptions given in ActivityDescriptions
#brute force approach as not sure of a better way, plus practise for loop

for (i in 1:nrow(filterMergedData)) {
  if (filterMergedData[i,2]==1) {
    filterMergedData[i,2] <- "Walking" #ActivityDescriptions[1]
  } else if (filterMergedData[i,2]==2) {
    filterMergedData[i,2] <- "Walking_Upstairs" #ActivityDescriptions[2]
  } else if (filterMergedData[i,2]==3) {
    filterMergedData[i,2] <- "Walking_Downstairs" #ActivityDescriptions[3]
  } else if (filterMergedData[i,2]==4) {
    filterMergedData[i,2] <- "Sitting" #ActivityDescriptions[4]
  } else if (filterMergedData[i,2]==5) {
    filterMergedData[i,2] <- "Standing" #ActivityDescriptions[5]
  } else {
    filterMergedData[i,2] <- "Laying" #ActivityDescriptions[6]
  }
}

##Steps 1-3 are now complete
#given col 2 is no longer activity ID let's change the variable name
names(filterMergedData)[names(filterMergedData) == "Activity ID"] <- "Activity Desciptions"

##Steps 1-4 are now complete
##make new table for Step 5

##assume this means taking row means of feautre measurements data for each row i.e subject and activity

#strip out first two columns to take average, then bind
stripData <- filterMergedData[3:ncol(filterMergedData)]

#create vector of means of columns in stripped data, need to transpose it to a col vec
meansData <- rowMeans(stripData)
#setnames(meansData,"Mean Data")
#names(meansData)[names(meansData) == "meansData"] <- "Mean Data"
#names(meansData) <- "Mean Data"

#bind meansData to subject and activities
meansDataTable <- cbind(rSubject,filterMergedData[2],meansData)

#tidy names in last column
names(meansDataTable)[names(meansDataTable) == "meansData"] <- "Mean of Feature Measurements"
