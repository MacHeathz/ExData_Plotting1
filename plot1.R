# I put all the shared code, for (down)loading data, in a separate file
source("load_data.R")

# Plot the first graph
png(filename = file.path(getwd(), "plot1.png"), width = 480, height = 480)

gap <- data$Global_active_power
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save plot to png file
# dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
