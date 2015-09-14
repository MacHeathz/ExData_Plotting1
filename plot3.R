# I don't like repeating myself, especially not in code. So I put all
# the shared code, for (down)loading consumer_power_data, in a separate file
# A consumer_power_dataframe 'consumer_power_data' is loaded with the consumer_power_data.
source("load_consumer_power_data.R")

# Plot the three Submetering graphs: open png device...
png(filename = "plot3.png", width = 480, height = 480)

# plot the three graphs...
dt <- consumer_power_data$datetime
plot(dt, consumer_power_data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(dt, consumer_power_data$Sub_metering_2, type = "l", col = "red")
lines(dt, consumer_power_data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

# and close the png device.
dev.off()
