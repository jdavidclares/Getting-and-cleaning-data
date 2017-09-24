# Getting-and-cleaning-data

This ReadMe file summarizes the proccess followed in the script run_analysis.R to complete the programming task of this course.

The main steps are the following ones:

1. Reading and merging test and train data into a single data set.
2. Extracting only the measurements on the mean and standard deviation. For this task, we've only taken the measurements which contain the words "mean" or "std" in their name.
3. Using descriptive activity names to name the activities in the data set. We've used the names of the activities provided by  activity_labels.txt instead of the numbers.
4. Appropiately labeling the data set with descriptive variable names. For this task, parenthesis have been deleted and some words such as mean or std have been capitalized or expanded.
5. Creating independent tidy data with the average of each variable for each activity and each subject.

The resulting tidy data is attached in the file tidy_data.txt
