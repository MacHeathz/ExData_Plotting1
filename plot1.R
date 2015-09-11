library(readr)
library(dplyr)
library(lubridate)

# Read and filter the data, and construct datetime column from the Date and Time
data <- read_csv2("household_power_consumption.txt", na = "?") %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    select(datetime, Global_active_power:Sub_metering_3)

# Plot the first graph
gap <- data$Global_active_power
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save plot to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
