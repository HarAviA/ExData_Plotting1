## Plot 2

# creating the plot

plot(subsetdata$Global_active_power ~ subsetdata$Date_Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save file and close device

dev.copy(png, "plot2.png", width  = 480, height = 480)
dev.off()
