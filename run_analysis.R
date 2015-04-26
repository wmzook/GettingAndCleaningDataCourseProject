##
## 0. Download and extract data:
##
if (!file.exists("UCIHARdataset.zip")) {
    loc <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(loc, "UCIHARdataset.zip", method="curl")
}
datadir <- "UCI HAR Dataset/"
if (!file.exists(datadir)) unzip("UCIHARdataset.zip")
##
## 2. Extract only the measurements on the mean and standard deviation
##    for each measurement.  It's a good idea to avoid reading the unwanted
##    columns into memory in the first place using the colClasses argument
##    of read.table().
## 
features <- read.table(paste(datadir, "features.txt", sep=""), stringsAsFactors=FALSE)
names(features) <- c("colnum", "feature")
toKeep <- grepl("mean\\(\\)|std\\(\\)", features$feature)
colClasses <- c("NULL","numeric")[1 + toKeep]
##
## 1. Merging required columns of training and test data sets
##
HAR <- NULL
for (datatype in c("train","test")) {
    ttdir <- paste(datadir, datatype, "/", sep="")
    subjfile <- paste(ttdir, "subject_", datatype, ".txt", sep="")
    Xfile <- paste(ttdir, "X_", datatype, ".txt", sep="")
    yfile <- paste(ttdir, "y_", datatype, ".txt", sep="")
    HAR <- rbind(HAR,
                 cbind(subject=scan(subjfile),
                       activity=scan(yfile),
                       read.table(Xfile, colClasses=colClasses)))
}
##
## 3. Use descriptive activity names to name the activities in the data set:
##
activities <- read.table(paste(datadir, "activity_labels.txt", sep=""), stringsAsFactors=FALSE)
names(activities) <- c("code", "activity")
activities$activity <- tolower(activities$activity)
activities$activity <- sub("walking_", "", activities$activity)
HAR$activity <- as.factor(activities$activity[match(HAR$activity, activities$code)])
##
## 4. Appropriately label the data set with descriptive variable names:
## 
cleanFeatures <- features$feature[toKeep]
cleanFeatures <- sub("(.*)\\-mean\\(\\)\\-?(.*)", "\\1\\2Mean", cleanFeatures)
cleanFeatures <- sub("(.*)\\-std\\(\\)\\-?(.*)", "\\1\\2StdDev", cleanFeatures)
names(HAR)[-(1:2)] <- cleanFeatures
##
## 5. From the data set in step 4, create a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
##
HARmeans <- aggregate(. ~ subject + activity, HAR, mean)
## Ordering rows by activity within subject:
HARmeans <- HARmeans[order(HARmeans$subject, HARmeans$activity),]
rownames(HARmeans) <- 1:dim(HARmeans)[1]
## Save resulting dataframe as a plain text file:
write.table(HARmeans, "HARmeans.txt", row.names=FALSE)
