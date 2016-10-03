## Final Assignment
## Getting and Cleaning Data Module

##README file describes code in plain english

##Set directory to read in files
setwd("C:/Users/Sophy/Desktop/JJ Coursera/GitHubRepo")


##read in files from set directory

#Note: Read in once, then can comment out when rerunning :)
ActLab <- read.table("./UCI HAR Dataset/activity_labels.txt",header = F)
FeaturesData <- read.table("./UCI HAR Dataset/features.txt",header = F)

SubjectsTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = F)
XTest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = F)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = F)

SubjectsTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = F)
XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = F)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = F)


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
#brute force approach as not sure of a better way, plus more practise using for loop

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
names(filterMergedData)[names(filterMergedData) == "Activity ID"] <- "Activity Desciption"


#order table by Subject ID
sortFilterMergedData <- filterMergedData[order(filterMergedData$`Subject ID`),]


#write final table as text file
write.table(sortFilterMergedData,"./Step5Data.txt",row.names=F,col.names=T)
