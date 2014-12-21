workingDirectory <- "C:/Coursera/Data Science/Getting and Cleaning Data/Course Project/UCI HAR Dataset"
file_path <- "ProjectTidyData.txt"
cat ("\014") # Clear Console
setwd(workingDirectory)
# Read data set
data <- read.table(file_path, header = TRUE)
# Display a subset
data[1:20,1:4]
