## Coursera - Johns Hopkins
## Exploratory data analysis
## Course Project 1 - Plot 1

## This procedure gets only the rows with specified dates
## Helps lower the memory requirement for large dataset

filename <- "household_power_consumption.txt"

## First, get just the column of dates
tmpcolcls <- c("character", rep("NULL", 8))  ## to skip columns
dates <- read.table(filename, header=TRUE, sep=";", na.strings="?", 
                   colClasses=tmpcolcls)

## Then, find which rows contain the required days
reqrows <- which(dates$Date=="1/2/2007" | dates$Date=="2/2/2007")

## Finally, read in only the required rows
dfr1 <- read.table(filename, header=TRUE, sep=";", na.strings="?", nrow=1)  ## to get column names
mydf <- read.table(filename, header=TRUE, sep=";", na.strings="?",
                   skip=min(reqrows)-1, nrows=length(reqrows),
                   col.names=names(dfr1))

## Configure the graphics device and plot histogram
png("plot1.png") 
hist(mydf$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
