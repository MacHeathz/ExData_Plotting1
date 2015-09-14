# I don't like repeating myself, especially not in code. So I put all
# the shared code, for (down)loading consumer_power_data, in a separate file.
# A consumer_power_dataframe 'consumer_power_data' is loaded with the consumer_power_data.
source("load_consumer_power_data.R")

# Setup the png device for 2 rows, 2 columns. 
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# Create the first plot, in topleft position
with(consumer_power_data, plot(datetime, Global_active_power, type = "l",
                ylab = "Global Active Power", xlab = ""))

# Create the second plot, in topright position
with(consumer_power_data, plot(datetime, Voltage, type = "l"))

# Create the third plot, in bottomleft position, with legend
dt <- consumer_power_data$datetime
plot(dt, consumer_power_data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(dt, consumer_power_data$Sub_metering_2, type = "l", col = "red")
lines(dt, consumer_power_data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

# Create the fourth plot, in bottomright position
with(consumer_power_data, plot(datetime, Global_reactive_power, type = "l"))

# Close the png device
dev.off()
