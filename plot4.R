library(readr)
library(dplyr)
library(lubridate)

data <- read_csv2("household_power_consumption.txt", na = "?") %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    select(datetime, Global_active_power:Sub_metering_3)

# dev.copy(png, file = "plot$4.png", width = 480, height = 480)
# dev.off()