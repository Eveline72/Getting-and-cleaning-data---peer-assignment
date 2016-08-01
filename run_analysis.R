## Calling the libraries we need to use running this script

library(plyr)
library(reshape2)

## Downloading and unzipping the data
## Checking whether this already has been done, to avoid repeating this

zipfile <- "movementdata.zip"
if (!file.exists(zipfile)){
  download.file(url = paste("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                            sep = ""), 
                destfile = zipfile, mode = 'wb')
}
if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipfile) 
}

## Importing the training and test data

xtrain   <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain   <- read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

xtest    <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest    <- read.table("./UCI HAR Dataset/test/y_test.txt")
subtest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Importing the features and activities data

feat <- read.table("./UCI HAR Dataset/features.txt")
act  <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merging the datasets and giving X the right column names

X <- rbind(xtrain,xtest)
Y <- rbind(ytrain,ytest)
S <- rbind(subtrain,subtest)
colnames(X) <- feat[,2]

## Extract only the measurements on the mean and standard deviation for each measurement. 
## We have to extract them from the features first, then combine feat_in with X to keep the desired measurements. 
## To do this, I changed X into a data frame, Xdf

feat_in     <- grep("std|mean", feat$V2)
Xdf         <- data.frame(X)
Xnw         <- Xdf[,feat_in]

## Use descriptive activity names to name the activities in the data set
## This simply means combining Y and act together, but to do this, we need to transform Y into a factor, Yf

Yf <- as.factor(Y[,1])
Yf <- mapvalues(Yf, from = as.character(act$V1), to = as.character(act$V2))

## Appropriately label the data set with descriptive variable names
## I already did part of this in the first step, when giving X the right column names
## In this step, we will combine the three pieces of data (Xnw, Yf and S) together

## First, I will add Yf to Xnw. This new column needs a logical variable name: activity

Xnw <- cbind(Yf,Xnw)
colnames(Xnw)[1] <- "activity"

##  Then, I add the subject numbers to Xnw, and give it a logical variable name: subject
Xnw <- cbind(S,Xnw)
colnames(Xnw)[1] <- "subject"

## Now we have one dataframe, Xnw, with all kinds of measurements for different subjects and six activities
## Last thing we need to do is:to create an independent tidy data set with the average of each variable for each activity and each subject.
## We can do this using the melt-function and then cast back calculating means per subject-activity

Xmelt <- melt(Xnw, id.vars = c("subject","activity"))
Xtidy <- dcast(Xmelt, subject + activity ~ ... ,mean)

## Write Xtidy to a txt file so we can send it to Coursera

write.table(Xtidy, "xtidy.txt", sep="\t") 










