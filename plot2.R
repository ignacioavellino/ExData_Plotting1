setwd("/Users/ignacioavellino/Documents/Studies/Courses/2014/06-exdata/Projects/1")

data <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings="?")
data$DateAsChar <- as.character(data$Date)
data$TimeAsChar <- as.character(data$Time)

data$dateTimeAsChar <- paste(data$DateAsChar, data$TimeAsChar)

# Changing data types
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

data$dateTime <- strptime(data$dateTimeAsChar, format="%d/%m/%Y %H:%M:%S")

# Filtering
startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
data.filtered <- data[(data$Date >= startDate) & (data$Date <= endDate),]

# Plotting
with(data.filtered, plot(dateTime, Global_active_power, type="l"
     , ylab="Global Active Power (kilowats)"))

# Saving
dev.copy(png, file = "plot2.png")
dev.off()