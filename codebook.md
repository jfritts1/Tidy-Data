# CODEBOOK

This codebook outlines the data included in this project.

## DataSet 

The analysis in this project is based on the Human Activity Recognition Using Smartphones Dataset. The data set is comprised of several files and and data necessary to construct the resulting dataset produced by this script. The necessary files include the "Train" and "Test" data files (located in their respective directories) as well as the "features" and "activity" files (located in the root directory).

## Data Source

This project assumes the file has already been downloaded and unzipped in a "data" folder in your working directory.

The original data source used in this analysis can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables

The following variables are used to bring in the 'original' data from the dataset in preparation for computation and creation of additional variables to fullfil the project requirements. Additional variables are commented in the code as needed.

* test_x - the data of the results of each activity
* test_y - the 'activity' being performed for each data result
* test_subjects - the individuals (i.e. subjects) creating each activity and result
* train_x - the data of the results of each activity
* train_y - the 'activity' being performed for each data result
* train_subjects - the individuals (i.e. subjects) creating each activity and result
* features - features (or calculations) of the data
* activity_labels - "friendly" labels for all activities