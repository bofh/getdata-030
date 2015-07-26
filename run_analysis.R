library(reshape2)

basePath <- "UCI HAR Dataset"
testPath <- file.path(basePath, "test")
trainPath <- file.path(basePath, "train")

# Merges the training and the test sets to create one data set.
testData <- read.table(file.path(testPath, "X_test.txt"))
trainData <- read.table(file.path(trainPath, "X_train.txt"))
mergedData <- rbind(trainData, testData)

# Appropriately labels the data set with descriptive variable names. 
colnames(mergedData) <- read.table(file.path(basePath, "features.txt"))[,2]

# Uses descriptive activity names to name the activities in the data set
activities <- read.table(file.path(basePath, "activity_labels.txt"))
testLabels <- read.table(file.path(testPath, "y_test.txt"))
trainLabels <- read.table(file.path(trainPath, "y_train.txt"))
mergedLabels <- rbind(trainLabels, testLabels)
namedLabels <- merge(mergedLabels, activities)

trainSubject <- read.table(file.path(trainPath, "subject_train.txt"))
testSubject <- read.table(file.path(testPath, "subject_test.txt"))
mergedSubjects <- rbind(trainSubject, testSubject)
colnames(mergedSubjects) <- "subject"

fullData <- cbind(mergedSubjects, namedLabels[,2], mergedData)

filter <- grep("mean|std", colnames(fullData))
# Extracts only the measurements on the mean and standard deviation for each measurement. 
meanStdData <- fullData[c(1, 2, 3, filter)]

# independent tidy data set with the average of each variable for each activity and each subject
# subject activity average
colnames(meanStdData)[2]<-"label"
melted <- melt(meanStdData, id.var = c("subject", "label"))
result <- dcast(melted, subject + label ~ variable, mean)

write.table(result, "tidy.txt")

result
