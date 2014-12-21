---
title: "CookBook"
author: "Micho Janssen"
date: "Sunday, December 21, 2014"
output: html_document
---
## 
## The variables used in run_analysis.R
## 
### Input/Output Variables
The variables given as download is described at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

A zipped file (getdata_projectfiles_UCI HAR Dataset.zip) was supplied which contains all the data files and descritption files used in this project.

The features captured (feature selection) and the variables presented are captured in :

features.txt

The Names of Variables used in these datasets are descripbed in:

featuresinfo.txt

Files Used to Read in information:

- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt : Train Subject lables
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt : Test Subject lables


Variables used in run_analysis.R:

- workingDirectory : The path to the working directory, contaning files with data
- outFile : Name of file into which Tidy Data set is written
- train : Training set data
- trainID : Training set subjects (numbered 1-30)
- trainActLvls : Training set Activity Levels (1-6)
- test : Test set data
- testID : Test set subjects (numbered 1-30)
- testActLvls : Test set Activity Levels (1-6)
- var_names : Column names (data sets variable names)
- ActLvlsNames : Activity Levels lables (6 Levels)
- testc : Test Data dataframe - ID (col 1) + Activity Levels (col 2) + test data set read
- trainc : Train Data dataframe - ID (col 1) + Activity Levels (col 2) + train data set read
- merged_set :  Train and Test set data merged
- new_names : Variable containing new columns (ID, Activity Levels, and Column names used with Train and Test data sets)
- tmp : variable containing temporary values
- ts  : temporary susbset containing data from merged_set columns with letters "mean" or "std" in column name
- ag  : Dataframe with aggregated values. Means and Standard Deviations of column values for each subject and activity level. Data ordered by subject and activity level
- dfMeans : Dataframe with aggregated values. Means of column values for each subject and activity level. Data ordered by subject and activity level

### Libraries required

- base

### Memory required to run run_analysis.R

- Data fits in aproximately 140 MB RAM
