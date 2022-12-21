

Some initial consideration:

1. The original Github Repo is from [rdpeng](https://github.com/rdpeng/ExData_Plotting1), or Roger D. Peng.

2. The resolution was made by me, but I like to compare after i complete the
assignment how others made the graphs. I really liked this version from
[skycrater](https://rpubs.com/skycrater/180401)

3. Details about how the convertion of data from `character` to `Date` and 
`Posix` are commented in the code.

# Course 4 - Exploratory Data Analysis

## Plot 1

```
# the assignment asks for col = "red", but this light blue is so much better. lol
hist (data_subset$Global_active_power, 
      col = "light blue", 
      xlab = "Global Active Power (kilowatts",
      main = "Global Active power")
```

The image is bellow and the complete code can be found [here](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot1.R).

![Plot1](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot1.png)

## Plot 2

```
with (data_subset, plot (Global_active_power ~ dateTime, 
                         type = "l",
                         xlab = "",
                         ylab="Global Active Power (kilowatts)"))
```

The image is bellow and the complete code can be found [here](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot2.R)

![Plot2](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot2.png)


## Plot 3

```
with (data_subset, plot (Sub_metering_1 ~ dateTime, 
                         type = "l",
                         xlab = "",
                         ylab="Energy sub metering"))


with (data_subset, lines (Sub_metering_2 ~ dateTime, col  = "red"))

with (data_subset, lines (Sub_metering_3 ~ dateTime, col  = "blue"))

# add legend 
with (data_subset, legend ("topright", 
                           lwd = 2,
                           lty = 1,
                           cex = .8,
                           legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                           col = c ("black", "red", "blue")))
```

The image is bellow and the complete code can be found [here](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot3.R)

![Plot3](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot3.png)


## Plot 4

```
# This one is too big to put in a README file 
```

The image is bellow and the complete code can be found [here](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot4.R)

![Plot4](https://github.com/HiimHotta/Data-Science-Foundations-using-R-Specialization/blob/main/Course%204%20-%20Exploratory%20Data%20Analysis/week%201/project/plot4.png)