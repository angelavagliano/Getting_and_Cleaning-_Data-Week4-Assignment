# After downloading and unzipping the data file into your R working directory, 
# Run the following code:

library(dplyr)

### Read Train 
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

### Read Test
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

### Read variable names
variable_names <- read.table("./features.txt")

### read activity labels
activity_labels <- read.table("./activity_labels.txt")

# 1. Merges the training and the test sets to create one data set
X_tot <- rbind(X_train, X_test)
Y_tot <- rbind(Y_train, Y_test)
subject_tot <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_tot <- X_tot[,selected_var[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_tot)   <- "activity"
Y_tot$activitylabel <- factor(Y_tot$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_tot[,2]

# 4. Appropriately labels the data set with descriptive variable names
colnames(X_tot) <- selected_var[,2]
colnames(subject_tot) <- "subject"

total <- cbind(subject_tot, activitylabel, X_tot)

# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject
total_mean <- total %>% 
  group_by(activitylabel, subject) %>% 
  summarize_each(funs(mean))
write.table(total_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE)
