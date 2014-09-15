## Read a fortran format
con=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
output<-read.fwf(con,widths = c(1,9,5,8,5,8,5,4,1,3,5,4,1,3),sep = "\t",header = FALSE,skip=4)
tempoutput<-output[c(8,9,10,12,13,14)]
sum(tempoutput$V8)
sum(tempoutput$V10)
stempoutput<-subset(tempoutput,tempoutput$V9=='-')
sum(stempoutput$V10)
print(tempoutput)
