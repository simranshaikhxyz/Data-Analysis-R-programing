
library(dplyr)

crime_df <- read.csv("crime.csv/crime.csv",
                     na.strings = c("", "NA"))

activity_df <- read.csv("time_series_data_human_activities.csv/time_series_data_human_activities.csv",
                        na.strings = c("", "NA"))

print("--- Data Structure Before Transformation ---")
print(names(crime_df))
print(names(activity_df))

# Clean Crime Data

crime_clean <- crime_df[, c("INCIDENT_NUMBER", "OFFENSE_CODE_GROUP")]
names(crime_clean) <- c("ID", "Value")
crime_clean$Source <- "Crime Data"


# Clean User Activity Data

activity_clean <- activity_df[, c("user", "activity")]
names(activity_clean) <- c("ID", "Value")
activity_clean$Source <- "User Activity"


# Convert Value to character (for uniformity)

crime_clean$Value <- as.character(crime_clean$Value)
activity_clean$Value <- as.character(activity_clean$Value)

# Combine the two datasets

combined_data <- rbind(crime_clean, activity_clean)

print("Combined Data Summary ")
print(paste("Crime rows:", nrow(crime_clean)))
print(paste("Activity rows:", nrow(activity_clean)))
print(paste("Total rows (Expected):", nrow(crime_clean) + nrow(activity_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print(" Preview of Combined Data")
print(head(combined_data))
print(tail(combined_data))

print("simran s113")


