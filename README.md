This is a Course Project for Getting and Cleaning Data from Coursera.

Given a Samsung data in a directory pointed by basePath (which is "UCI HAR Dataset" in a current work dir by default) run_analysis.R will output file tidy.txt with a tidy data set with the average of each variable for each activity and each subject.

Script will do the following:
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Set descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names.
* Create a second, independent tidy data set with the average of each variable for each activity and each subject by using dcast and melt functions.

CodeBook.md is supplied.

