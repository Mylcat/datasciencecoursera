## Read lines from the webpage



readURL<-function(URL){
  
  con=url(url)
  htmlCOde=readLines(con)
  close(con)
  htmlCOde
}


readURLParsed<-function(URL){
  library(XML)  
  con<-url(URL)  
  html<-htmlTreeParse(url,useInternalNodes = TRUE)
  
  ##xpathSApply(html,"//title",xmlValue)
  xpathSApply(html,"//td[@id='col-citedby']",xmlValue)
}

readURLhttr<-function(URL){
  library(httr)
  html2=GET(URL)
  content2=content(html2,as="text")
  parsedHtml=htmlParse(content2,asText=TRUE)
  xpathSApply(parsedHtml,"//title",xmlValue)
}


readSpecificLineURL<-function(URL){

  con=url("http://biostat.jhsph.edu/~jleek/contact.html")
#   htmlCode=readLines(con)
linenum <-readline("Enter the line number : ")
readLine<-scan(file=con,skip=(as.integer(linenum)-1),nlines=1,what=c("character","Integer"),fill=FALSE,sep="\n")
# print(readLines(htmlCode,n=1,warn=TRUE))
#print(htmlCode) 
close(con)
readLine
}



url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
#output<- readURL(url)
#output<-readURLParsed(url)
#output<-readURLParsed(url)
output<-readSpecificLineURL(url)
print(output)
print(nchar(output)) 

