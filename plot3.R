library(readr)
library(dplyr)
library(lubridate)

data <- read_csv2("household_power_consumption.txt", na = "?") %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    select(datetime, Global_active_power:Sub_metering_3)

dt <- data$datetime
esm <- c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)
plot(dt, data$Sub_metering_3, type = "l", ylab = "Energy Submetering", xlab = "")

# Save plot to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
