## Coursera - Johns Hopkins
## Exploratory data analysis
## Course Project 1 - Plot 4

## Read in the data and keep only the required rows

filename <- "household_power_consumption.txt"
mydf <- read.table(filename, header=TRUE, sep=";", na.strings="?")
mydf <- mydf[mydf$Date=="1/2/2007" | mydf$Date=="2/2/2007", ]

## Add new column with date and time POSXlt

mydf$DateTime <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")

## Configure the screen device and plot the graphs

png("plot4.png")
par(mfrow=c(2, 2), ps=12)  ## Grid with 2 rows, 2 columns and by row

## Plot 1.1: line graph of Global Active Power

plot(mydf$DateTime, mydf$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

## Plot 1.2: line graph of Voltage

plot(mydf$DateTime, mydf$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

## Plot 2.1: line graphs of energy sub metering

with(mydf, {
    plot(DateTime, Sub_metering_1, type="l",
         xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    
    legend("topright", lty=par("lty"), col=c("black", "red", "blue"),
           bty="n", legend=paste("Sub_metering", c(1,2,3), sep="_"))
})

## Plot 2.2: line graph of global reactive power

plot(mydf$DateTime, mydf$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()