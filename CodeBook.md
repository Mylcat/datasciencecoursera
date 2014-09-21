## Code Book for Analysis of the fields for the data set extracted.

the following process has been followed to arrive at the data set

1.Download file using 
 
 download.file(url = val,destfile ="data/getdata_projectfiles_UCI_HAR_Dataset.zip" )

2. set working directory using setwd

3.load libraries plyr and dplyr in order

4.Read the features data 

5. Read the activities 

6. load the data from X_test and X_train

7. load the data from subject data 

8. merge the dataframes of training and test

9. set the label names for activities and subjectids

10. select the correct metric requested by discarding the not necessary ones using contains in select

11.Merge activities,subjects and the data from training and test.

12.set the activities description from the data loaded.

13.Groupby for the fields Activity and Subjectid

14. ddply for mean of all the fields.

15.Write the output into the file for uploading.

