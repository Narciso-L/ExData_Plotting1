

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

# Creating png
png(file="plot1.png", width=480, height=480)

# Generating plot1
hist(finalData$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power")

# Closing graphic device
dev.off()


