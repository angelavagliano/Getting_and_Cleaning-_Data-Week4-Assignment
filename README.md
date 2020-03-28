# Getting_and_Cleaning-_Data-Week4-Assignment  

*Peer-graded Assignment: Getting and Cleaning Data Course Project*

- First, download and unzip the data file into your R working directory.
- Second, download the R source code into your R working directory.
- Finally, execute R source code to generate tidy data file.

### Data description

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

### Code explaination
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

### New dataset

The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### The code was written based on the instruction of this assignment

1. Read training and test dataset into R environment. 
   Read variable names into R envrionment. 
   Read activities labels into R environment.

2. Merges the training and the test data sets to create one data set. 
   Use rbind command to combine them.

3. Extracts only the measurements on the mean and standard deviation for each measurement. 
   Use grep command to get column indexes for variable name contains "mean()" or "std()".

4. Uses descriptive activity names to name the activities in the data set.
   Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
   Use write.table command to create a new tidy dataset after group_by and summarize_each commands from the dplyr package.
