library(lubridate)
library(dplyr)

data <- read.csv("flights.csv/flights.csv")

data_10 <- head(data, 10)

data_small <- data_10 %>% select(year, month, day)

# ORIGINAL DATA
print("Original Data (Selected Columns):")
print(data_small)

# 1. Create Date and Extract Components
processed_data <- data_small %>%
  mutate(
    Actual_Date = make_date(year, month, day), 
    
    Year_Num = year(Actual_Date),
    Month_Num = month(Actual_Date),
    Month_Name = month(Actual_Date, label = TRUE),
    Day_Num = day(Actual_Date),
    Weekday_Num = wday(Actual_Date),
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_Date),
    Day_of_Year = yday(Actual_Date)
  )

print(" 2. Data with Extracted Date Components ")
print(processed_data)

# 3. Current Time Extraction

current_time <- now()

print("3. Current Time Extraction ")
print(paste("Current Year:", year(current_time)))
print(paste("Current Month:", month(current_time)))
print(paste("Current Day:", day(current_time)))
