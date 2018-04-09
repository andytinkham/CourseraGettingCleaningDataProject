# Johns Hopkins University Coursera Data Science Specialization
# Getting and Cleaning Data course, final project
# Andy Tinkham, April 8, 2018

library(data.table)
library(dplyr)
library(reshape2)

# Retrieve the data if it doesn't already exist in the working directory
if (!file.exists("./UCIHARDataSet.zip")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./UCIHARDataSet.zip",
                      method = "curl")

        # Unzip the data. Overwrite any files that might already exist with the
        # same names to make sure we're using the latest data we just downloaded
        unzip("./UCIHARDataSet.zip", overwrite = TRUE)

        # To keep the environment clean, I'll remove variables when I'm finished
        # with them throughout this script
        rm(fileURL)
}

# Switch into the unzipped Dataset directory to make our paths shorter as we
# read the files. We'll switch back once we've read everything.
setwd("./UCI HAR Dataset")

# Overall descriptors
activity_labels <- read.table("./activity_labels.txt", sep = " ",
                              col.names = c("activityid", "activitydescription"))

features <- read.table("./features.txt",
                       col.names = c("featureid", "measurementname"),
                       stringsAsFactors = FALSE)

# Test data set
subject_test <-  read.table("./test/subject_test.txt", col.names = "subjectid")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt", col.names = "activityid")

testdataset <- data.table(subject_test, X_test, y_test)

rm(subject_test)
rm(X_test)
rm(y_test)

# Training data set
subject_train <- read.table("./train/subject_train.txt", col.names = "subjectid")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt", col.names = "activityid")

traindataset <- data.table(subject_train, X_train, y_train)

rm(subject_train)
rm(X_train)
rm(y_train)

# Switch back to working in the parent directory
setwd("..")

# Merge the training and test sets into one data set
dataset <- rbind(traindataset, testdataset)

rm(traindataset)
rm(testdataset)

# Extract only the measurements on the mean and standard deviation for each
# measurement. Skip any measurements of meanFreq and angles (which refer to Mean
# in their names) as those are different measurements than what's specified in
# the project instructions
desiredmeasurements <- grepl("(mean[^F])|(std)", features$measurementname)
measurementNames <- features$measurementname[desiredmeasurements]

# We want to keep the first and last columns (the subject ids and the activity
# ids), so add 2 more TRUES to desired measurement - 1 at beginning and 1 at end
desiredmeasurements <- c(TRUE, desiredmeasurements, TRUE)

# Using with = FALSE means that desiredmeasurements isn't treated as a literal
# column name, so it works like a data frame would when given a logical vector
dataset <- dataset[,desiredmeasurements, with = FALSE]

rm(desiredmeasurements)
rm(features)

# Use descriptive activity names to name the activities in the data set. We'll
# use the text given in the activity_levels.txt file in the data package.
# Code found at
# https://stackoverflow.com/questions/14417612/r-replace-an-id-value-with-a-name
# with thanks to Stack Overflow user 42-
dataset[["activityid"]] <- activity_labels[match(dataset[['activityid']],
                                                 activity_labels[['activityid']]),
                                           'activitydescription']
rm(activity_labels)

# Appropriately label the data set with descriptive variable names

# Make the names more descriptive
# "Acc" = "Acceleration"
measurementNames <- gsub("Acc", "Acceleration", measurementNames)

# "Mag" = "Magnitude"
measurementNames <- gsub("Mag", "Magnitude", measurementNames)

# Some of the feature names in the included text file refer to "BodyBody". This
# is not mentioned in the features_info.txt file, so is probably a mistake.
measurementNames <- gsub("BodyBody", "Body", measurementNames)

# Remove the ()s from the variable names
measurementNames <- gsub("[()]", "", measurementNames)

# The t at the beginning of the measurements indicates time. Use time instead
measurementNames <- sub("^t", "time", measurementNames)

# Do the same with the f which indicates frequency. Use frequency instead.
measurementNames <- sub("^f", "frequency", measurementNames)

# Replace std with standarddeviation
measurementNames <- gsub("std", "standarddeviation", measurementNames)

# Convert the names all to lowercase to align with class naming standards
measurementNames <- tolower(measurementNames)

# Add names for the first and last columns & set the names
measurementNames <- c("subject", measurementNames, "activity")
colnames(dataset) <- measurementNames

rm(measurementNames)

# Create a 2nd independent tidy data set with the average of each variable for
# each activity and each subject.  I have opted to go with long form tidy data
# as permitted by instructions
outputdataset <- melt(dataset, id.vars = c("subject", "activity"))

rm(dataset)

outputdataset <- outputdataset %>%
        group_by(subject, activity, variable) %>%
        mutate(average=mean(value)) %>%
        distinct(subject, activity, variable, average) %>%
        arrange(subject) %>%
        print

# Write tidy data set to text file with write.table using row.name = FALSE
write.table(outputdataset, "./outputdataset.txt", row.names = FALSE)
