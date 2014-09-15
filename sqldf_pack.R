## Usage of sqldf package

sqldfdataRead<-function(URL){
  #con<-url(URL)
  #datatxt<-readLines(con)
  
  data_sqldf<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",header = T)
#  close(con)
}

library(sqldf)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
acs<-sqldfdataRead(url)
#sqldf("select distinct AGEP from acs") -- unique values
