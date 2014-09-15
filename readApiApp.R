## Accessing application from R


readAPiApp<-function(api){
  library(httr)
  oauth_endpoints("github")
  myapp<-oauth_app("repos","3fc8e44360df127eb504","e67966a114e1f8c4ab11f8882689660de734376f")
  
  github_token <- oauth2.0_token(oauth_endpoints("github"),myapp)
  
  gtoken <- config(token = github_token)
  req <- GET("https://api.github.com/users/mylcat/repos",gtoken)
  stop_for_status(req)
  content(req)
  ##2013-08-28T18:18:50Z
  #created_at": "2013-08-28T18:18:50Z",
   # "updated_at": "2014-03-27T15:17:57Z",
  #  "pushed_at": "2014-03-27T15:06:21Z",
  
#   "created_at": "2013-11-07T13:25:07Z",
#   "updated_at": "2014-09-13T15:26:28Z",
#   "pushed_at": "2013-11-25T16:08:34Z",
} 

# req<-with_config(gtoken,GET("https://api.github.com/users/mylcat/repos"))
# stop_for_status(req)
# content(req)
output <-readAPiApp()
print(output)