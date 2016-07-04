## Download and read data into R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./household_power_consumption.zip")
unzip("./household_power_consumption.zip")
df <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE)
library(dplyr)

## Plot 2
mydf2 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
mydf2 <- mutate(mydf2, dateTime = paste(Date, Time))
mydf2$dateTime <- strptime(mydf2$dateTime, "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(mydf2$dateTime, mydf2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()