library(readr)
library(dplyr)
library(lubridate)

# Set locale, needed to get english abbreviated weekdays in the plot
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")

data <- read_csv2("household_power_consumption.txt", na = "?") %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    select(datetime, Global_active_power:Sub_metering_3)

# 2nd graph
dt <- data$datetime
gap <- data$Global_active_power
plot(dt, gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save plot to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()