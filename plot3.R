

# Download zipped data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

# Checking if folder exists
if (!file.exists("household_power_consumption")) { 
    unzip(temp)
}

# Remove temp file
unlink(temp)

# Listing files in the working directory
list.files(getwd())

data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
# names(data)

#?strptime

# Obtaining Date and Time
dateTime <- paste(data[,1], data[,2])

# Formatting dateTime
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# Obtaining a subset from "2007-02-01" to "2007-02-02 23:59:00"
finalData <- subset(data,dateTime >="2007-02-01" & dateTime <="2007-02-02 23:59:00") 

#Obtaining dateTime column
dateTimeCol <- dateTime[dateTime >="2007-02-01" & dateTime <="2007-02-02 23:59:00"]

# Creating png
png(file="plot3.png", width=480, height=480)

# Generating plot3
plot(dateTimeCol, finalData$Sub_metering_1,  ylab="Energy sub metering", type="l", xlab="", col="black")
lines(dateTimeCol, finalData$Sub_metering_2, col="red", type="l")
lines(dateTimeCol, finalData$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)


# Closing graphic device
dev.off()
