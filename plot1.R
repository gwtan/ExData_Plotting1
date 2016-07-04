##Download and read data into R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./household_power_consumption.zip")
unzip("./household_power_consumption.zip")
df <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE)

##Plot 1
mydf1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(mydf1$Global_active_power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()