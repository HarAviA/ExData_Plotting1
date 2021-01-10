## Plot 3

# creating the plot

par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(subsetdata, {
  plot(Sub_metering_1 ~ Date_Time, type="l", ylab = "Energy Submetering", xlab="")
  lines(Sub_metering_2 ~ Date_Time, col = "Red")
  lines(Sub_metering_3 ~ Date_Time, col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), lwd = c(1, 1, 1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save file and close device

dev.copy(png, file = "plot3.png", height = 480, widht = 480)
dev.off()
