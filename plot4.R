## Download and read data into R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./household_power_consumption.zip")
unzip("./household_power_consumption.zip")
df <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE)
library(dplyr)

## Plot 4
mydf4 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
mydf4 <- mutate(mydf4, dateTime = paste(Date, Time))
mydf4$dateTime <- strptime(mydf4$dateTime, "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(mydf4$dateTime, mydf4$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(mydf4$dateTime, mydf4$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(mydf3$dateTime, mydf3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(mydf3$dateTime, mydf3$Sub_metering_2, col = "red")
lines(mydf3$dateTime, mydf3$Sub_metering_3, col = "blue")
legend("topright" , c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"), bty = "n", cex = 1)
plot(mydf4$dateTime, mydf4$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()