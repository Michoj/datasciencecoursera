---
title: "README"
author: "Micho Janssen"
date: "Sunday, December 21, 2014"
output: html_document
---

This README file to describe the run_anaylsis.R script.

The purpose of run_analysis.R is to combine two sets of data and manipulate the data set to produce a tidy set of data. A tidy set of data is a data that consists of one row per observation, and one column for each observed variable. The data was collected as part of a study, "Human Activity Recognition Using Smartphones Data Set". Detailed descripton of data collection and cleaning may be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Two data sets containing observations of 30 people (subjects) participating in study. Many variables (observations) were collected from Smartphones, equiped with embedded inertial sensors. The sensors sensed and recorded motion data. The data sets are labled train and test. 

The run_analysis.R script performs the following steps:

1. Read in all relevant data.
  - Read Training data.
  - Read Training IDs (subject IDs).
  - Read Training data Activity Levels.
  - Read Test data.
  - Read Test IDs (subject IDs).
  - Read Test data Activity Levels.
  - Read Column Names.
  - Read Activity Levels lables.
2. Combine the data into one data set.
  - The Test data is merged (appended) to Training data, matced by Column.
  - The ID (subject) and Activity levels are Merged with data set, ID and Activity Level columns are prepended to data set.
3. Assign column names.
4. Subset data set into a smaller data set containing columns which names has the string "mean" or "std" in it.
5. Find the mean and standard deviation of all selected columns, for each subject (ID), by level of activity (actLvls), assign values to a dataframe.
6. Sort the dataframe to group together Subjects (ID) and Activity Levels.
7. Find the mean of all subjects, activity levels, and variables.
8. Sort new dataframe by subject and activity levels, store results in a dataframe.
9. Replace Activity Levels.
10. Write tidy data set data into a text file.
     