

# Download and extract the file
if(!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip", method = "curl")
    unzip("data.zip")
}

# Step 1: Merge the training and the test sets to create one data set

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
sbj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(x_train, y_train, sbj_train)

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
sbj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(x_test, y_test, sbj_test)

data <- rbind(train, test)

features <- read.table("UCI HAR Dataset/features.txt")
column_names <- c(as.character(features$V2), "activity", "subject")

names(data) <- column_names

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement

mean_std_cols <- grep("(mean|std)\\(\\)", names(data), value = T)
data <- data[, c(mean_std_cols, "activity", "subject")]

# Step 3: Use descriptive activity names to name the activities in the data set

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")$V2
data$activity <- activity_labels[data$activity]

# Step 4: Appropriately label the data set with descriptive variable names

print(names(data))
# Obs: This step was already done in the previous steps.
#      Information about each of the columns can be found
#      in the "features_info.txt" file

# Step 5: From the data set in step 4, create a second, independent tidy data set with the average
#         of each variable for each activity and each subject

averages <- aggregate(. ~ activity + subject, data, mean)
write.table(averages, "averages.txt", row.names = FALSE)
