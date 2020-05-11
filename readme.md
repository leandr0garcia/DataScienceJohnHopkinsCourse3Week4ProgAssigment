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


# REPOSITORY CONTENT

* [This File, `README.md`](./README.md), that explains how all of the scripts work and how they are connected.
* [A code book `codebook.md`](./codebook.md), that describes the variables, the data, and any transformations or work that performed to clean up of the data. 
* [The `run_analysis.R` script](./run_analysis.R) that performs all the required.
* [The tidy data set, `ActivtiySubjectMeanSummary.csv`](./ActivtiySubjectMeanSummary.csv) in CSV format.
* [`data` folder](./data), a folder with the data file (ZIP) used to prepare the tidy data set. 
    *NOTE* it must be unzipped under data to avoid the script downloads the data zip from the Internet. You must be sure that the files are present in the working directory when running the `run_analysis.R` script :
    * TRAIN SET 
      - `./data/UCI HAR Dataset/train/X_train.tx`t
      - `./data/UCI HAR Dataset/train/y_train.txt`
      - `./data/UCI HAR Dataset/train/subject_train.txt` 
      
    * TEST SET
      - `./data/UCI HAR Dataset/test/X_test.txt`
      - `./data/UCI HAR Dataset/test/y_test.txt`
      - `./data/UCI HAR Dataset/test/subject_test.txt`
    * OTHER FILES
      - `./data/UCI HAR Dataset/activity_labels.txt`
      - `./data/UCI HAR Dataset/features.txt`
        