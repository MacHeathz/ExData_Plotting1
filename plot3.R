library(readr)
library(dplyr)
library(lubridate)

# Set locale, needed to get english abbreviated weekdays in the plot
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")

data <- read_csv2("household_power_consumption.txt", na = "?") %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    select(datetime, Global_active_power:Sub_metering_3)

dt <- data$datetime

# Plot three Submetering graphs
plot(dt, data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(dt, data$Sub_metering_2, type = "l", col = "red")
lines(dt, data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

# Save plot to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
