setwd("/Users/ignacioavellino/Documents/Studies/Courses/2014/06-exdata/Projects/1")

data <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings="?")

# Changing data types
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

# Filtering
startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
data.filtered <- data[(data$Date >= startDate) & (data$Date <= endDate),]

# Plotting
hist(data.filtered$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowats)", col="red")

# Saving
dev.copy(png, file = "plot1.png")
dev.off()