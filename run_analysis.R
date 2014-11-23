assignment3 <- function()
{
   # 
   activity_labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
   
   # Read the data in
   print("Reading in Data")
   x_test <- read.fwf("c:\\temp\\UCI HAR Dataset\\test\\X_test.txt", widths=rep(16, 561))
   y_test <- read.csv("c:\\temp\\UCI HAR Dataset\\test\\y_test.txt", header=F)
   subject_test <- read.csv("c:\\temp\\UCI HAR Dataset\\test\\subject_test.txt", header=F)
   x_train <- read.fwf("c:\\temp\\UCI HAR Dataset\\train\\X_train.txt", widths=rep(16, 561))
   y_train <- read.csv("c:\\temp\\UCI HAR Dataset\\train\\y_train.txt", header=F)
   subject_train <- read.csv("c:\\temp\\UCI HAR Dataset\\train\\subject_train.txt", header=F)
   features <- read.csv("c:\\temp\\UCI HAR Dataset\\features.txt", sep=" ", header=F)

   # 'Merge' here, just means concatenate the test and train sets, not join them by a link
   print("Merging")
   X <- rbind(x_test, x_train)
   # Set the column names of subject to match so we can join
   colnames(subject_test) <- "subject"
   colnames(subject_train) <- "subject"
   subject <- rbind(subject_test, subject_train)
   subject <- subject[,1] # turn it into a vector
   Y <- rbind(y_test, y_train)
   
   # Change measurement names to meaningful ones
   print("Relabelling")
   colnames(X) <- features[,2]
   # Change activity names to meaningful ones
   activity <- cut(as.integer(Y[,1]), breaks=6, labels=activity_labels)
   
   # Means and SDs are in the first 6 columns
   print("Trimming")
   mno <- X[,1:6]
   
   # Create 'nice' trimmed dataset with activities, subject and means
   # Averages are in the first three columns
   print("Tidying")
   tidy <- cbind(subject, activity, mno[,1:3])

   # Get the output
   print("Writing output")
   write.table(tidy, file="c:\\temp\\output.txt", row.name=FALSE)
   # Create Tidy dataset with averages for each subject
   #  1.Merges the training and the test sets to create one data set.
   #  2.Extracts only the measurements on the mean and standard deviation for each measurement. 
   #  3.Uses descriptive activity names to name the activities in the data set
   #  4.Appropriately labels the data set with descriptive variable names. 
   #  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

}