library(readr)
library(dplyr)
library(lubridate)

# If dataframe already exists, do nothing
if(!exists("consumer_power_data")) {
    # Define some strings for the download url, and the names of the zipfile and
    # the datafile.
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zip <- "exdata-data-household_power_consumption.zip"
    file <- "household_power_consumption.txt"
    
    # Download / unzip the data file if it's not yet in the workdirectory
    if (!file.exists(file)) {
        print("Data file not found.")
        if (!file.exists(zip)) {
            # use downloader package for platform-independent https handling
            suppressPackageStartupMessages(library(downloader))
            print("Downloading data.")
            download(url, zip)
        }
        print("Unzipping data zipfile.")
        unzip(zip)
        file.remove(zip)
    }
    
    # Set locale, needed to get english abbreviated weekdays in the plot
    Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
    
    # Read and filter the data, and construct datetime column from the Date and Time
    print("Loading data...")
    consumer_power_data <- read_csv2(file, na = "?") %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(datetime = dmy_hms(paste(Date, Time))) %>%
        select(datetime, Global_active_power:Sub_metering_3)
    
    print("Done.")
}
