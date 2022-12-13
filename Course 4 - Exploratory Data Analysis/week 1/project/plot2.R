
library(lubridate)

#otpimized version https://rpubs.com/skycrater/180401

setwd ("~/coursera/Data Science/Course 4 - Exploratory Data Analysis/week 1/project")

filename <- "firstProject.zip"

# Checking if archive already exists.
if (!file.exists(filename)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file (fileURL, filename, method="auto")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# good practice to use colClasses when possible, decrease mem usage

data <- read.table (file = "household_power_consumption.txt",
                    header = TRUE,
                    sep = ";",
                    na.strings = "?",
                    colClasses = c ("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# subset to desired dates using regex
# 2007-02-01 and 2007-02-02

data_subset <- data [grep ("^(1|2)/2/2007", data$Date), ]

#data_subset <- data_subset[complete.cases(data_subset), ]

#convert to date, as specified in the assignment

data_subset$Date <- as.Date (data_subset$Date, format = "%d/%m/%Y")

#convert to time, as specified in the assignment and create X-axis

dateTime <- with (data_subset, strptime (paste (Date, Time), "%F %T"))

data_subset <- cbind (dateTime, data_subset)

# Now, open device to save plot

png ("plot2.png", width = 480, height = 480)

with (data_subset, plot (Global_active_power ~ dateTime, 
                         type = "l",
                         xlab = "",
                         ylab="Global Active Power (kilowatts)"))


# remember to close device ;)
dev.off ()
