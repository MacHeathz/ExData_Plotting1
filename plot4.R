# I put all the shared code, for (down)loading data, in a separate file
source("load_data.R")

# Setup the plot canvas for 2 rows, 2 columns
par(mfrow = c(2,2))

# Create the first plot, in topleft position
with(data, plot(datetime, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab = ""))

# Create the second plot, in topright position
with(data, plot(datetime, Voltage, type = "l"))

# Create the third plot, in bottomleft position, with legend
dt <- data$datetime
plot(dt, data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(dt, data$Sub_metering_2, type = "l", col = "red")
lines(dt, data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

# Create the fourth plot, in bottomright position
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
