## Getting and Cleaning Data - Course Project week 3

getZipFileFromURL<-function(val){
  # Download the file from the internet and store in the filename getdata_projectfiles_UCI_HAR_Dataset.zip in the data folder
  #  download.file(url = val,destfile ="data/getdata_projectfiles_UCI_HAR_Dataset.zip" )
  setwd("E://Narayana//work//RProjects//datasciencecoursera")
  # Extract the zip file data/getdata_projectfiles_UCI_HAR_Dataset.zipinto the directory data
  unzip(zipfile = "data/getdata_projectfiles_UCI_HAR_Dataset.zip", exdir = "data")
  # set the working directory to the extracted path datasciencecoursera//data//UCI HAR Dataset
  setwd("E://Narayana//work//RProjects//datasciencecoursera//data//UCI HAR Dataset")
  print(getwd())
  

  

  
  
  library("plyr")
  library("dplyr")
  
  # Read features
  features <-read.table("features.txt",header = FALSE,sep = " ")
  colnames(features)<-c("sno","feature")
  featurestbl<-tbl_df(features)
  featurestbl<<-featurestbl 
  print(featurestbl)
  #   
  
  # Read Activity Labels
  activitylbls <-read.table("activity_labels.txt",header = FALSE,sep = " ")
  colnames(activitylbls)<-c("ref","activity")
  activitylblstbl<-tbl_df(activitylbls)
  
  # load data from X_test.txt from TEST Folder
  testSubjectDataX<-read.table("test/X_test.txt",header=FALSE, stringsAsFactors = FALSE, fill = TRUE) 
  testSubjectDataXtbl<-tbl_df(testSubjectDataX)
  print(ncol(testSubjectDataXtbl))
  testSubjectDataXtbl<<-testSubjectDataXtbl
  # load data from Y_test.txt from TEST Folder
  testSubjectDataY<-read.table("test/Y_test.txt",header=FALSE, stringsAsFactors = FALSE, fill = TRUE) 
  testSubjectDataYtbl<-tbl_df(testSubjectDataY)
  print(testSubjectDataYtbl)
  
  # loading subject data from TEST Folder
  testSubjectX<-read.table("test/subject_test.txt",header=FALSE, stringsAsFactors = FALSE, fill = TRUE) 
  testSubjectXtbl<-tbl_df(testSubjectX)
  print(ncol(testSubjectXtbl))
  testSubjectXtbl<<-testSubjectXtbl
  
  #loading  data from X_train.txt folder
  trainSubjectDataX<-read.table("train/X_train.txt",header=FALSE, stringsAsFactors = FALSE, fill = TRUE) 
  trainSubjectDataXtbl<-tbl_df(trainSubjectDataX)
  print(ncol(trainSubjectDataXtbl))
  trainSubjectDataXtbl<<-trainSubjectDataXtbl
  
  # loading data from Y_train.txt
  trainSubjectDataY<-read.table("train/Y_train.txt",header=FALSE, stringsAsFactors = FALSE, fill = TRUE) 
  trainSubjectDataYtbl<-tbl_df(trainSubjectDataY)
  print(trainSubjectDataYtbl)
  
  #loading subject data from subject_train.txt
  trainSubjectX<-read.table("train/subject_train.txt",header=FALSE, stringsAsFactors = FALSE, fill = TRUE) 
  trainSubjectXtbl<-tbl_df(trainSubjectX)
  print(ncol(trainSubjectXtbl))
  trainSubjectXtbl<<-trainSubjectXtbl
  
  # merging the subjects ids data 
  subjects<-rbind(testSubjectXtbl,trainSubjectXtbl)
  subjects<<-subjects
  colnames(subjects)<-c("SubjectID")
  
  # merging the data from test and train for X 
  subjectsData<-rbind(testSubjectDataXtbl,trainSubjectDataXtbl)
  subjectsData<<-subjectsData
  
  # merging the data from test and train for Y - Activities
  subjectsDataActivities<-rbind(testSubjectDataYtbl,trainSubjectDataYtbl)
  subjectsDataActivities<<-subjectsDataActivities
  
  # set the column name for activities before adding it to themain data frame
  colnames(subjectsDataActivities)<-c("Activity")
  
  # set the column names for the data from the features list loaded.
  colnames(subjectsData)<-featurestbl$feature
  subjectsData<<-subjectsData
  
  #retaining only std and mean from the data frame
  subjectsDataSel<-select(subjectsData,contains("std()"),contains("mean()"),-contains("angle"),-contains("Freq")) 
  subjectsDataSelOut<-subjectsDataSel
  
  # Cbind of the subject,activities and data for mean and std 
  subjectsDataSel<-cbind(subjects,subjectsDataActivities,subjectsDataSel)
  
  # Setting the lookup for activity -= Need to be enhanced
  
  subjectsDataSel[which(subjectsDataSel$Activity == 1),]$Activity <-"WALKING"
  subjectsDataSel[which(subjectsDataSel$Activity == 2),]$Activity <-"WALKING_UPSTAIRS"
  subjectsDataSel[which(subjectsDataSel$Activity == 3),]$Activity <-"WALKING_DOWNSTAIRS"
  subjectsDataSel[which(subjectsDataSel$Activity == 4),]$Activity <- "SITTING"
  subjectsDataSel[which(subjectsDataSel$Activity == 5),]$Activity <- "STANDING"
  subjectsDataSel[which(subjectsDataSel$Activity == 6),]$Activity <- "LAYING"
  

 
  #Group by for summary
  subjectsDataSel<-group_by(subjectsDataSel,Activity,SubjectID)
  
  ## ddply to calculate the mean for each variable grouped by activity and SubjectID
  subjectsDataSelMean<-ddply(subjectsDataSel, .(Activity,SubjectID), numcolwise(mean))
  
  #External variable to verify
  subjectsDataSelOut<<-subjectsDataSelMean
  
  #write the file back to the disk for uploading
  write.table(subjectsDataSelMean,file = "output.txt",row.names = FALSE)

  # set the working directory back to the project directory to invoke the file with source("run_analysis.R")
  setwd("E://Narayana//work//RProjects//datasciencecoursera")
}



##---------------------------------------
##  URL to extract the file from Internet
path<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
getZipFileFromURL(path)

