# Getting and Cleaning Data Course Project - Final Project README FILE
Prepared by: Pablo Toapanta N.
Date: 16/07/2016

## REPO Content
- README.md: Description about the data source and steps applied to this to reach the goal of the final project.
- CODEBOOK.md: Details about variables, data and transformations applied.
- run_analysis.R: R code file.
- tidyDataSet.txt: final data set after R code were applied.

## Goals
Based on the final project instructions, the R code prepared must comply these requirements:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps

**STEP 1:**
- Read training, testing and variable names data, from: /train/X_train.txt, /test/X_test.txt and features.txt files.
- Apply variable names to testing and training data.

**STEP 2: first project task**
- Merge training and testing data sets.

**STEP 3: second project task**
- From the variable names data frame select just the ones representing mean and standard deviation data.
- Create a new data frame with just the variables obtained in the last data frame.

**STEP 4: third project task**
- Read activity data for training and testing from: /train/y_train.txt ,/test/y_test.txt files.
- Read activity labels from activity_labels.txt file.
- Apply activity names to Activity variable in the data set.

**STEP 5: fourth project task**
- Cast each variable name and transform them based on these labels: t=time, f=frecuency, Acc=Accelerometer, Gyro=Gyroscope, Mag=Magnitude, BodyBody=Body

**STEP 6: fifth project task**
- Read subject data from /test/subject_test.txt and /train/subject_train.txt files.
- Bind the subject data to the data set.
- Create a new data set with the average of each variable per each activity and subject.
