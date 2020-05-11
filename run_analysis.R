# ---
#  title: 'Codebook - COURSE 3 WEEK4''s Programming Assignment '
#output:
#  
# ---
  


print("#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       WELCOME       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
print("# NOTE THAT THIS SCRIPT WAS DEVELOPED IN A WINDOWS MACHINE")
print("#      It may require a customisation for other O.S.")
print("#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     END-WELCOME     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

# Required file names
Xtrain_fname <- "./data/UCI HAR Dataset/train/X_train.txt"
Ytrain_fname <- "./data/UCI HAR Dataset/train/y_train.txt"
Strain_fname <- "./data/UCI HAR Dataset/train/subject_train.txt" 
Xtest_fname <- "./data/UCI HAR Dataset/test/X_test.txt"
Ytest_fname <- "./data/UCI HAR Dataset/test/y_test.txt"
Stest_fname <- "./data/UCI HAR Dataset/test/subject_test.txt"
activitylbls_fname <- "./data/UCI HAR Dataset/activity_labels.txt"
featuresname_fname <- "./data/UCI HAR Dataset/features.txt" 

data_files <- c(Xtrain_fname, Ytrain_fname, Strain_fname,
                Xtest_fname, Ytest_fname, Stest_fname,
                activitylbls_fname, featuresname_fname)


## Check the existance of the files on the current repository
present_datafiles_result <- file.exists(data_files)

if(sum(present_datafiles_result) != length(data_files)) {
    print("#SCRIPT> the following files where not found in the system")
    print(data_files[!present_datafiles_result])
    print("#SCRIPT> Proceeding to rebuild the data content")
    print("#SCRIPT> NOTE: an INTERNET connection is required...")
    
    dir.create(path = "./data", recursive = TRUE, showWarnings = FALSE)
    data_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    data_zip_filename <- "./data/getdata_projectfiles_UCI HAR Dataset.zip"
    download.file(data_URL, data_zip_filename, mode = "wb")
    unzip(data_zip_filename, exdir = "./data")
    
    
    ## VERIFYING THAT THE DOWNLOAD CONTENT IS CORRECT!
    present_datafiles_result <- file.exists(data_files)
    if(sum(present_datafiles_result) != length(data_files)) {
      stop(paste("#SCRIPT> IMPOSIBLE TO CONTINUE: the downlad ZIP doesn't contain ALL THE FILES: ", data_files[!present_datafiles_result]));
    }
}

## 1.	Merges the training and the test sets to create one data set.
training_set <- c("X" = Xtrain_fname, "Y" = Ytrain_fname, "Subject" = Strain_fname)
test_set <- c("X" = Xtest_fname, "Y" = Ytest_fname, "Subject" = Stest_fname)
labels_set <- c("activities" = activitylbls_fname, "features" = featuresname_fname)


# Defining an auxiliary function to load data
loadDataFromFileSSet <- function(dataSet, XCLabels, Ycategories, YClabel = "Activity", SClabel = "Subject") {
    features_df <- read.table(XCLabels, col.names = c("id", "Feature"), header = FALSE)
    data_df <- read.table(file = dataSet["X"], col.names = features_df[["Feature"]], dec = ".", colClasses = rep("numeric", 561), header = FALSE) ;
    data_df <- cbind(data_df, read.table(file = dataSet["Y"], col.names = c(YClabel), dec = ".", colClasses = rep("numeric", 1), header = FALSE));
    data_df <- cbind(data_df, read.table(file = dataSet["Subject"], col.names = c(SClabel), dec = ".", colClasses = rep("numeric", 1), header = FALSE));
    return(data_df);
}


## Load the data into DFs
train_dataset <- loadDataFromFileSSet(dataSet = training_set, XCLabels = labels_set["features"]);
test_dataset <- loadDataFromFileSSet(dataSet = test_set, XCLabels = labels_set["features"]);

## MERGED DATA TRAIN AND TEST
merged_data <- rbind(train_dataset, test_dataset) 


## 2.	Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
# Got help here: https://stackoverflow.com/questions/48776515/selecting-multiple-columns-using-regular-expressions
extracted_data <- select(.data = merged_data, "Subject", "Activity", grep("(mean[.]{2})|(std[.]{2})", names(merged_data)))



## 3.	Uses descriptive activity names to name the activities in the data set
activity_df <- read.table(labels_set["activities"], col.names = c("id", "Activity"))
rownames(activity_df) <- activity_df$id
activity_df <- activity_df["Activity"]
extracted_data["Activity"] <- activity_df[extracted_data[["Activity"]], ]

## 4.	Appropriately labels the data set with descriptive variable names.
names(extracted_data)<-gsub("Acc", ".Accelerometer", names(extracted_data))
names(extracted_data)<-gsub("Gyro", ".Gyroscope", names(extracted_data))
names(extracted_data)<-gsub("Mag", ".Magnitude", names(extracted_data))
names(extracted_data)<-gsub("^t", "Time_", names(extracted_data))
names(extracted_data)<-gsub("^f", "Frequency_", names(extracted_data))
names(extracted_data)<-gsub("mean[.]{2}", "MEAN", names(extracted_data))
names(extracted_data)<-gsub("std[.]{2}", "STD", names(extracted_data))
names(extracted_data)<-gsub("freq[.]{2}", "FREQUENCY", names(extracted_data))
names(extracted_data)<-gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data)<-gsub("Body[.]", "Body", names(extracted_data))


## 5.	From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
# HELP: Removing objects from a list :  https://statisticsglobe.com/remove-element-from-list-in-r
summarize_columns <- names(extracted_data)
summarize_columns <- summarize_columns[summarize_columns %in% c("Subject","Activity") == FALSE]
summary_df <- group_by(.data=extracted_data, Subject, Activity) %>% summarise_at(funs(mean), .vars=summarize_columns)

## Saving the summarized DATA FRAME!
## For more information on HOWTO save a DF into CSV HERE: 
##    http://mercury.webster.edu/aleshunas/R_learning_infrastructure/Saving%20an%20R%20data%20file.html
write.csv(x = summary_df, file = "ActivitySubjectMeanSummary.csv")

print("#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       BYE       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
print("#                              /!\      Processing END     /!\                             #")
print("# You will find the summary of the Data in the file 'ActivitySubjectMeanSummary.csv'       #")
print("#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     END-BYE     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")


