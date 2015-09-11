# I put all the shared code, for (down)loading data, in a separate file
source("load_data.R")

# Plot the three Submetering graphs
png(filename = file.path(getwd(), "plot3.png"), width = 480, height = 480)

dt <- data$datetime
plot(dt, data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(dt, data$Sub_metering_2, type = "l", col = "red")
lines(dt, data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()
