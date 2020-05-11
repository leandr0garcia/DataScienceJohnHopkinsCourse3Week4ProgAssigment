---
title: IMPORTANT PROJECT INFORMATION - COURSE 3 WEEK4
output: html_notebook
---

# INTRODUCTION
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal of this assigment is to prove that we are able to prepare tidy data that can be used for later analysis. 

# REVIEWING THIS WORK
This work will be evaluated by anybody who wants to review it. The evaluation criteria:

1. The submitted data set is tidy.

2. The Github repo contains the required scripts.

3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

4. The README that explains the analysis files is clear and understandable.

5. The work submitted for this project is the work of the student who submitted it.

# PROCEDURE TO REPLICATE THE TIDY DATA SET

* The original data was downloaded and UNZIPPED in the local directory.

* The `run_analysis.R` script worked on the original data as follow: 
  
  * The training and the test sets were merged in one data set.

  * Only the measurements on the mean and standard deviation for each measurement were extracted.

  * The Activity values were replaced by their description.

  * Appropiate descriptive labels were added to each variable name.

  * Then, an  average of each variable for each activity and each subject was prepared. 

  * The Data was saved on `ActivitySubjectMeanSummary.txt` file.


# ABOUT THIS REPOSITORY CONTENT

* [This File, `README.md`](./readme.md), that explains how all of the scripts work and how they are connected.
* [A code book `codebook.md`](./codebook.md), that describes the variables, the data, and any transformations or work that performed to clean up of the data. 
* [The `run_analysis.R` script](./run_analysis.R) that performs all the required calculations to create the tidy data set.
  ```
      ## *TO RUN IT*
      ##    In the R console.
      source("run_analysis.R")
  ```
* [The tidy data set, `ActivtiySubjectMeanSummary.txt`](./ActivitySubjectMeanSummary.txt) in TEXT format. You can load it using the `read.table` function in *R*.
* [`data` folder](./data), a folder with the data file (ZIP) used to prepare the tidy data set. 
    *NOTE* it must be unzipped under the working directory where `run_analysis.R` script was launched, to avoid downloading the data zip from the Internet. You must be sure that the following files are present in the working directory before running the `run_analysis.R` script :
    * TRAIN SET 
      - `./UCI HAR Dataset/train/X_train.tx`t
      - `./UCI HAR Dataset/train/y_train.txt`
      - `./UCI HAR Dataset/train/subject_train.txt` 
      
    * TEST SET
      - `./UCI HAR Dataset/test/X_test.txt`
      - `./UCI HAR Dataset/test/y_test.txt`
      - `./UCI HAR Dataset/test/subject_test.txt`
    * OTHER FILES
      - `./UCI HAR Dataset/activity_labels.txt`
      - `./UCI HAR Dataset/features.txt`
