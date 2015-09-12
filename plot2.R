# I don't like repeating myself, especially not in code. So I put all
# the shared code, for (down)loading data, in a separate file
# A dataframe 'data' is loaded with the data.
source("load_data.R")

# Plot the second graph: open the png device...
png(filename = "plot2.png", width = 480, height = 480)

# create the plot...
dt <- data$datetime
gap <- data$Global_active_power
plot(dt, gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# and close the device.
dev.off()