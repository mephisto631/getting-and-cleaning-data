## 1. Merge the training and the test sets to create one data set
merge1 <- read.table("UCI HAR Dataset/train/X_train.txt")
merge2 <- read.table("UCI HAR Dataset/test/X_test.txt")
mergeX <- rbind(merge1,merge2)

merge1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
merge2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
mergeS <- rbind(merge1,merge2)

merge1 <- read.table("UCI HAR Dataset/train/y_train.txt")
merge2 <- read.table("UCI HAR Dataset/test/y_test.txt")
mergeY <- rbind(merge1,merge2)


## 2. Extract only the measurements on the mean and Stdev for each measurement. 

features <- read.table("UCI HAR Dataset/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- mergeX[, indices_of_good_features]
names(X) <-features[indices_of_good_features, 2]
names(X) <-gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] = gsub("_","",tolower(as.character(activities[,2])))
mergeY[,1] = activities[mergeY[,1], 2]
names(mergeY) <- "activity"

## 4. Appropriately labels the data set with descriptive activity names. 

names(mergeS) <- "subject"
cleaned <- cbind(mergeS,mergeY,X)
write.table(cleaned, "merged_clean_data.txt")

## 5. Create a 2nd, independent tidy data set with a averge of each variable for ach activity and ach subject.

uniqueSubjects = unique(mergeS[,1])
numSubjects = length(unique(mergeS)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for(s in 1:numSubjects) {
        for (a in 1:numActivities) {
                result[row, 1] = uniqueSubjects[s]
                result[row, 2] = activities[a, 2]
                tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a,2], ]
                result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
                row = row+1
        }
}
write.table(result, "data_set_with_the_averages.txt", row.name = F)
