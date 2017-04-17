

        library(data.table)
        library(dplyr)

                ## read files necessary for computations
        test_x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
        test_y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
        test_subjects<-read.table("data/UCI HAR Dataset/test/subject_test.txt")
        
        train_x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
        train_y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
        train_subjects <- read.table("data/UCI HAR Dataset/train/subject_train.txt")        
                
                ## read files for data definitions
        features <- read.table("data/UCI HAR Dataset/features.txt", col.names=c("feature_id", "feature_label")) 
        features_toinclude <- grep("-(mean|std)\\(\\)", features$feature_label)                 
        
        activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_label")) 
        activity_labels$activity_label <- gsub("_", "", as.character(activity_labels$activity_label)) 
        
                ## merge tables to create single data sets, and name appropriately
        data_x <- rbind(test_x, train_x)
        names(data_x) <- gsub("\\(|\\)", "", features$feature_label[features_toinclude]) 
        
        data_y <- rbind(test_y, train_y)
        names(data_y) = "activity_id"
        
        data_subjects <- rbind(test_subjects, train_subjects)
        names(data_subjects) <- "subject_id"

        activity <- merge(data_y, activity_labels, by="activity_id")$activity_label 
             
                ## combine tables to create single data table, inlcuding only desired columns
        all_data <- cbind(data_subjects, activity, data_x) 
        all_dataDT <- data.table(all_data[,1:68]) 
        
                ## calculate standard deviation and mean grouping by activity and subject_id, then output 
        all_dataDT$subject_id <- as.factor(all_dataDT$subject_id)
        calc_dataDT <- ddply(all_dataDT, .(subject_id, activity), function(x) colMeans(x[3:68]))
        write.table(calc_dataDT, "tidy_data.txt", row.name = FALSE) 

        
        
