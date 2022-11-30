
setwd("coursera/Data Science/Getting & Cleaning Data/week3")


library (dplyr)

##Q1

con <- url ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

q1 <- read.csv (con)

agricultureLogical <- q1$AGS == 6 & q1$ACR == 3

which (agricultureLogical)

## Q2

q2 <- readJPEG("q2.jpg", native = TRUE)

quantile (q2, probs = c(0.3, 0.8))

## Q3

library (dplyr)

library (tidyverse)

con30 <- url ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")

con31 <- url ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

q30 <- read.csv (con30, skip = 4) %>% as_tibble

q31 <- read.csv (con31) %>% as_tibble

q30<-select(q30,X,X.1,X.3,X.4)

names(q30)<-c("CountryCode", "Rank","Country","Total")

#q30 <- rename (q30, CountryCode = X)

q30 <- q30 %>% mutate(across(Rank, as.integer))

res <- inner_join(q30, q31, by = "CountryCode") %>%
  
       arrange (desc (Rank))

# the number os countries with rank and the number of rows doesnt match

sum (!is.na(res[,2]))


## Q4

oecd <- res [res$Income.Group == "High income: OECD",]

mean (oecd$Rank, na.rm = TRUE)

non_oecd <- res [res$Income.Group == "High income: nonOECD",]

mean (non_oecd$Rank, na.rm = TRUE)


## Q5

quantile_gdp <- cut (res$Rank, breaks = quantile (res$Rank, probs = seq(0, 1, length = 6), na.rm = TRUE))

table (quantile_gdp, res$Income.Group)







