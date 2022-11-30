setwd("coursera/Data Science/Getting & Cleaning Data/week2")

##Q1

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "0b5cab9bf2f1eb5ee59a",
                   secret = "7d939920268547d00b3a1cbc073bf4c6ec1b3ba2"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)

## Answer

json1 = content (req)
json2 = jsonlite::fromJSON(jsonlite::toJSON(json1))

json2

json2[json2$name == "datasharing",]

#Q2

library(sqldf)

acs <- read.csv("quiz2.csv")


##Q4

con <- url ("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines (con)
nchar (htmlCode [10])
nchar (htmlCode [20])
nchar (htmlCode [30])
nchar (htmlCode [100])

##Q5


output <- read.fortran("quiz5.for", format = "10A9.0", skip=4)
sum (output[,4])

