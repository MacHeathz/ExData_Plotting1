# I don't like repeating myself, especially not in code. So I put all
# the shared code, for (down)loading consumer_power_data, in a separate file
# A consumer_power_dataframe 'consumer_power_data' is loaded with the consumer_power_data.
source("load_consumer_power_data.R")

# Plot the second graph: open the png device...
png(filename = "plot2.png", width = 480, height = 480)

# create the plot...
dt <- consumer_power_data$datetime
gap <- consumer_power_data$Global_active_power
plot(dt, gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# and close the device.
dev.off()