## Coursera - Johns Hopkins
## Exploratory data analysis
## Course Project 1 - Plot 3

## Read in the data and keep only the required rows

filename <- "household_power_consumption.txt"
mydf <- read.table(filename, header=TRUE, sep=";", na.strings="?")
mydf <- mydf[mydf$Date=="1/2/2007" | mydf$Date=="2/2/2007", ]

## Add new column with date and time POSXlt

mydf$DateTime <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")

## Configure the graphics device, then plot the lines and add legend

png("plot3.png")
with(mydf, {
    plot(DateTime, Sub_metering_1, type="l",
         xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    
    legend("topright", lty=par("lty"), col=c("black", "red", "blue"),
           legend=paste("Sub_metering", c(1,2,3), sep="_"))
})
dev.off()

