## This script access, organize and clean a given set of data
## with the final objective to deliver a tidy dataset, as
## describe in the "Getting and Cleannig Data Course Project" info.

## Accessing and merging the data archives:
## All the data archives was previously unzip in the directory:
## D:/Coursera/UCIDataset

features <- read.table("D://Coursera/Samsung/features.txt")
labels <- features$V2
train_sub <- read.table("D:/Coursera/Samsung/train/subject_train.txt")
colnames(train_sub) <- "subject"
train_y <- read.table("D:/Coursera/Samsung/train/y_train.txt")
colnames(train_y) <- "activity"
train_x <- read.table("D:/Coursera/Samsung/train/X_train.txt")
colnames(train_x) <- labels
condition <- matrix(data = "training", nrow = length(train_sub), ncol = 1)
train <- cbind(train_sub, train_y, condition, train_x)
test_sub <- read.table("D:/Coursera/Samsung/test/subject_test.txt")
colnames(test_sub) <- "subject"
test_y <- read.table("D:/Coursera/Samsung/test/y_test.txt")
colnames(test_y) <- "activity"
test_x <- read.table("D:/Coursera/Samsung/test/X_test.txt")
colnames(test_x) <- labels
condition <- matrix(data = "test", nrow = length(test_sub), ncol = 1)
test <- cbind(test_sub, test_y, condition, test_x)
merged_data <- rbind(train, test)

## A merged data set was created, where a column called "condition" identifies
## if the original register belong to the training data or test data

## ------------------------------

## Extrating only the mean and standard deviation variables
## for each observation.

sset <- c(1, 2, 3)
sset <- c(sset, grep("mean()", names(merged_data), fixed = TRUE))
sset <- c(sset, grep("std()", names(merged_data), fixed = TRUE))
extract <- subset(merged_data, select = sset)
extract <- arrange(extract, subject, activity)

## ------------------------------

## Adding the activities descriptions

extract$activity <- sub(1, "walking", extract$activity)
extract$activity <- sub(2, "walking upstairs", extract$activity)
extract$activity <- sub(3, "walking downstairs", extract$activity)
extract$activity <- sub(4, "sitting", extract$activity)
extract$activity <- sub(5, "standing", extract$activity)
extract$activity <- sub(6, "laying", extract$activity)

## ------------------------------

## Renaming labels with descriptive variable names

names(extract) <- sub("^t", "time_domain", names(extract))
names(extract) <- sub("^f", "frequency_domain", names(extract))
names(extract) <- sub("Body", "_body", names(extract))
names(extract) <- sub("Gravity", "_gravity", names(extract))
names(extract) <- sub("Acc", "_accelerometer", names(extract))
names(extract) <- sub("Gyro", "_gyro", names(extract))
names(extract) <- sub("-mean()", "_mean", names(extract))
names(extract) <- sub("-std()", "_standard_deviation", names(extract))
names(extract) <- sub("()", "", names(extract), fixed = TRUE)
names(extract) <- sub("-X", "_X-axis", names(extract))
names(extract) <- sub("-Y", "_Y-axis", names(extract))
names(extract) <- sub("-Z", "_Z-axis", names(extract))
names(extract) <- sub("Jerk", "_time_derived", names(extract))
names(extract) <- sub("Mag", "_magnitude", names(extract))

## ------------------------------

## Creating a tidy data set with the average of each variable
## for each activity and each subject.

melted_data <- melt(extract, id = c(names(extract)[1:3]), measure.vars = c(names(extract[4:69])))
tidy_data <- dcast(melted_data, activity+subject ~ variable, mean)

## tidy_data is the final data table, cleaned, organized and
## summarized by the means values.