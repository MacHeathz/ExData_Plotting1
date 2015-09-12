# I don't like repeating myself, especially not in code. So I put all
# the shared code, for (down)loading data, in a separate file
# A dataframe 'data' is loaded with the data.
source("load_data.R")

# Plot the first graph: open png device...
png(filename = "plot1.png", width = 480, height = 480)

# plot the histogram...
gap <- data$Global_active_power
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# and close the device.
dev.off()
