## File download from internet



URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

if(!file.exists("data")){
  dir.create("data")
}


download.file(URL, destfile = "./data/uscommunities.csv")
list.files("./data")
communities<-read.csv("./data/uscommunities.csv",header = TRUE,as.is=TRUE)

print(length(which(na.omit(communities$VAL) >=24)))

URLQ3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx" 

#download.file(URLQ3, destfile = "./data/naturalgas.xlsx")
#Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')
#library(rJava)
#library(xlsx)

naturalgas<-read.xlsx("./data/getdata_data_DATA.gov_NGAP.xlsx",sheetIndex = 1,header = TRUE)

library(XML)

urlq4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

download.file(urlq4, destfile = "./data/restaurants.xml")

doc<-xmlTreeParse("./data/restaurants.xml",useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)

print(length(which((xpathSApply(rootNode,"//zipcode",xmlValue)=="21231"))))

url4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
fread(url4)

