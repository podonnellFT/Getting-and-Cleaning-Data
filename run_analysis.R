
# zip file downloaded and 2 data sets extracted to local folder.
# set working directory to here:

setwd("C:/R/Data Cleaning/getdata-projectfiles-UCI HAR Dataset")

# read test data along with labels

test <- read.table("UCI HAR Dataset/test/X_test.txt")
test[,562] = read.table("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
test[,563] = read.table("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# read training data along with labels

train <- read.table("UCI HAR Dataset/train/X_train.txt")
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# make sure dimensions are amenable to combining (columns)

dimTest <- dim(test)[2]
dimTrain <- dim(train)[2]
dimTest == dimTrain

# combine data sets

comData <- rbind(test,train)

# resulting number of rows should be total of two base files

dim(comData)[1] == dim(test)[1] + dim(train)[1]

# get activity labels

actLbls = read.table("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# read features and rename the necessary ones to make them more sensical
# this substitutes -mean with Mean and -std with Std

features = read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# next get the data from the specified columns - ones with Mean and Std in the headings

colsNeeded <- grep(".*Mean.*|.*Std.*", features[,2])

# create a copy data set with just the columns we want.

features1 <- features[colsNeeded,]
comData1 <- comData[,colsNeeded]

# also then add the last two columns so that we have relevant data flags

colsNeeded <- c(colsNeeded, 562, 563)

# so now we have the column names in features1 so need to add that to the actual data set as well as the two end columns for activity and person identifier

colnames(comData1) <- c(features1$V2, "Activity", "Subject")

# now, just need to loop through the data set and substitute the activity code with the label from actLbls
# could potentially do this later at the summary step to save space

# tried doing this using melt and dcast but didnt really work out for me.

# start at first ones and increment

activityCode = 1
for (ActivityLabel in actLbls$V2) {
  comData1$Activity <- gsub(activityCode, ActivityLabel, comData1$Activity)
  activityCode <- activityCode + 1
}

# summary data sets requires aggrregation by activity and subject so create these as factors

comData1$Activity <- as.factor(comData1$Activity)
comData1$Subject <- as.factor(comData1$Subject)

# now aggregate by those facrtors using mean

tidyData = aggregate(comData1, by=list(Activity = comData1$Activity, Subject=comData1$Subject), mean)
# write to a text file

write.table(tidyData, "tidy.txt", sep="\t")
