---
title: "Creating and documenting a Tidy Data Set"
output: html_document
---


#### This repository includes the following:  

 - This file  -- README.md
 
 - The R code to create the tidy dataset -- run_analysis.R
 
 - The codebook showing the new dataset and info about the source data as well. -- CodeBook.md


### Explanation of run_analysis.R file
#### The following steps were performed in the R file to create the tidy data set:  

 - setup for Windows 7 OS

- Download and unzip zipped data

- read all the data into R


- Set column names in main data sets

- Find the columns whose names contain "mean" or "std"

- select only the columns indicating means or standard deviations

- add columns for Subject and Activities


- Combine test and train data by rows into one large data set

- Name the first two columns that contain Activities and Subjects

- Provide nice variable names to the columns

- Change data frame to a data table with Activities and Subjects as keys

- Change Activities and Subjects to factors

- Create tidy data set with means for each variable by Activities and Subject


