# Code Book for the Course Project of the Cleaning Data Class

* `download.file`: function used to download files from a given URL
* `unzip`: function used to unzip files
* `x_train`: temporary dataset which contains the numeric values of the measured features of the train data
* `y_train`: temporary dataset which identifies the activity performed by a number id in the train data
* `sbj_train`: temporary dataset which identifies the subject by a number id in the train data
* `train`: temporary dataset which holds all of the train data
* `x_test`: temporary dataset which contains the numeric values of the measured features of the test data
* `y_test`: temporary dataset which identifies the activity performed by a number id in the test data
* `sbj_test`: temporary dataset which identifies the subject by a number id in the test data
* `test`: temporary dataset which holds all of the test data
* `data`: dataset which contains all of the data from the experiment. The same variable transformed throughout the code, as it is modified to have the desired columns and column names
* `features`: dataset which identifies the features by column number
* `column_names`: vector with the names of the measured features
* `mean_std_cols`: feature names which are the "mean" or "standard deviation" of other features in the dataset
* `activity_labels`: vector that identifies the activities performed by number id
* `averages`: dataset which holds the mean of the features by subject and activity