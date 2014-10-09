## Coursera - Johns Hopkins
## Exploratory data analysis
## Course Project 1 - Plot 2

## Read in the data and keep only the required rows

filename <- "household_power_consumption.txt"
mydf <- read.table(filename, header=TRUE, sep=";", na.strings="?")
mydf <- mydf[mydf$Date=="1/2/2007" | mydf$Date=="2/2/2007", ]

## Add new column with date and time POSXlt

mydf$DateTime <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")

## Configure the graphics device and plot line graph

png("plot2.png")
plot(mydf$DateTime, mydf$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
