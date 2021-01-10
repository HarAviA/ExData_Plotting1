# Load data

getwd()
setwd("C:/Users/4. EXPLORATORY DATA ANALYSIS")

# Create data directory

if(!file.exists("./data")){dir.created("./data")}

# Downloading the file in the working directory

if(!file.exists("./data/household_power_consumption.zip")){
  fileURL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(fileURL, destfile = "./data/household_power_consumption.zip")
}

unzip(zipfile = "./data/household_power_consumption.zip", exdir = "./data")

data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", dec = ".",
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
                     
summary(data)
names(data)

# Format the respective column as a date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset of data from 2007-02-01 and 2007-02-02.

subsetdata <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Remove incomplete observations

subsetdata <- subsetdata[complete.cases(subsetdata),]

# Creating new variable

library(dplyr)

subsetdata <- mutate(subsetdata, Date_Time = paste(subsetdata$Date, subsetdata$Time, sep = " "))
head(subsetdata)

# Adding date and time format to the variable Date_Time

subsetdata$Date_Time <- as.POSIXct(subsetdata$Date_Time)

# Delete the "Date" and "Time" columns

subsetdata <- subsetdata[, !(names(subsetdata) %in% c("Date", "Time"))]
head(subsetdata)
str(subsetdata)

## Plot 1
# creating the histogram

hist(subsetdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Save file and close device

dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
