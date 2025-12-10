data <- read.csv("amsterdam_weekdays.csv")

data_10 <- head(data, 10)

# Keep only 3 selected columns
data_small <- data_10 %>% select(realSum, room_type, guest_satisfaction_overall)

# ORIGINAL DATA
print("Original Data (Selected Columns):")
print(data_small)

# Structure of dataset 
print("Structure of the dataset:")
str(data_small)

# Summary statistics
print("Summary statistics of the dataset:")
summary(data_small)
