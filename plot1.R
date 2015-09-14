# I don't like repeating myself, especially not in code. So I put all
# the shared code, for (down)loading consumer_power_data, in a separate file
# A consumer_power_dataframe 'consumer_power_data' is loaded with the consumer_power_data.
source("load_consumer_power_data.R")

# Plot the first graph: open png device...
png(filename = "plot1.png", width = 480, height = 480)

# plot the histogram...
gap <- consumer_power_data$Global_active_power
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# and close the device.
dev.off()
