# I put all the shared code, for (down)loading data, in a separate file
source("load_data.R")

# Plot the second graph
png(filename = file.path(getwd(), "plot2.png"), width = 480, height = 480)

dt <- data$datetime
gap <- data$Global_active_power
plot(dt, gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()