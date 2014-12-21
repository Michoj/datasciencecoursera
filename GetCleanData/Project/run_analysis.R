workingDirectory <- "C:/Coursera/Data Science/Getting and Cleaning Data/Course Project/UCI HAR Dataset"
outFile <- "ProjectTidyData.txt"
cat ("\014") # Clear Console
setwd(workingDirectory)
# Read data sets
train <- read.table("train/X_train.txt")           # Training set data
trainID <- read.table("train/subject_train.txt")   # Training set subjects (1-30)
trainActLvls <- read.table("train/Y_train.txt")    # Training set Activity Levels (1-6)
test <- read.table("test/X_test.txt")              # Test set data
testID <- read.table("test/subject_test.txt")      # Test set subjects (1-30
testActLvls <- read.table("test/Y_test.txt")       # Test set Activity Levels (1-6)
var_names <- read.table("features.txt")            # Column names
ActLvlsNames <- read.table("activity_labels.txt")  # Activity Levels lables
# Add IDs
testc <- cbind(testActLvls,test)                   # ActLvls (col 1) + Test data
testc <- cbind(testID,testc)                       # ID (col 1) + Testc (ID + ActLvls + data)
trainc <- cbind(trainActLvls,train)                # ActLvls (col 1) + Train data
trainc <- cbind(trainID,trainc)                    # ID (col 1) + Trainc (ID + ActLvls + data)
# Join the data sets vertically (add rows of on to other)
merged_set <- rbind(trainc,testc)
# Assign names to variables
new_names <- var_names[,2]                         # Names now a factor
new_names <- lapply(new_names, as.character)       # Factor turned into a List
# Pre-pend names with 'ID' & 'ActLvls' as new col names
new_names <- c("ID","ActLvls",new_names)
# Assign Names to merged (combined) data set
names(merged_set) <- new_names
# Any NA's ?
sum(tmp <- colSums(is.na(merged_set)))             # should be 0 (and is)
# Group records together (sort by ID, then by ActLvls)
merged_set <- merged_set[order(merged_set$ID,merged_set$ActLvls) , ]
# Find all names containing 'mean' or 'std'
tmp <- grep("std|mean",new_names)
# Subset merged_data into set with variable names containing std/mean
#   include ID and ActLvls in this new set
ts <- merged_set[,c(1,2,tmp)]
# aggregate row mean & std deviation (of each variable, for each ID and each ActLvls)
# can be done by: ag <- aggregate(. ~ ID*ActLvls, tc, function(x) c(mean = mean(x), sd = sd(x)))
# now ag is a dataframe where colums [,3:81] contain matrices, e.g column 3 has a matrix [2,180] in it
#  with names tBodyAcc-mean()-X.mean and tBodyAcc-mean()-X.sd
# acces these values use ag[[3]][,1] (means) or ag[[3]][,2] (deveiations)
# very cumbersome. To fix (avoid cols with matrices) run the following line (new DF with only cols)
ag <- do.call(data.frame, aggregate(. ~ ID*ActLvls, ts, function(x) c(mean = mean(x), sd = sd(x))))
# aggregate with sort (group by) Subject (ID) and actvity Levels (ActLvls)
# ag2 is now ordered by Activity Levels, so, re-order (subject, activity)
ag <- ag[order(ag$ID,ag$ActLvls),]
# Turn ActLvls into Factor (with names read into ActLvlsNames)
ag[,2] <- cut(ag[,2],br=6,labels=ActLvlsNames[,2]) # turned integer levels into a Factor (6 levels)
# ag is stil ordered (and grouped), so nothing to do here
# Step 4 done, now onto step 5 of Project (tidy data)
# Find mean for each subject, activity, and variable (mean of single observation)
dfMeans <- aggregate(. ~ ID*ActLvls, ts, function(x) c(mean = mean(x)))
# Sort data by Subject and Activity Level
dfMeans <- dfMeans[order(dfMeans$ID,dfMeans$ActLvls),]
# Turn ActLvls into Factor (with names read into ActLvlsNames)
dfMeans[,2] <- cut(dfMeans[,2],br=6,labels=ActLvlsNames[,2]) # converted to Factor (6 levels)
# write data object out to file (outFile)
write.table(dfMeans,outFile,row.name=FALSE)
