## Download and read data into R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./household_power_consumption.zip")
unzip("./household_power_consumption.zip")
df <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE)
library(dplyr)

## Plot 3
mydf3 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
mydf3 <- mutate(mydf3, dateTime = paste(Date, Time))
mydf3$dateTime <- strptime(mydf3$dateTime, "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(mydf3$dateTime, mydf3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(mydf3$dateTime, mydf3$Sub_metering_2, col = "red")
lines(mydf3$dateTime, mydf3$Sub_metering_3, col = "blue")
legend("topright" , c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black","red","blue"), cex = 1)
dev.off()