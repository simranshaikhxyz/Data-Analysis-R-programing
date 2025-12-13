# Step 1: Read CSV
crime_data <- read.csv("crime.csv/crime.csv")

# Step 2: View dataset
head(crime_data)

# Step 3: Reshape data to get 'Before' and 'After' X values per NEIGHBOURHOOD
library(tidyr)
paired_data <- pivot_wider(crime_data, 
                           id_cols = NEIGHBOURHOOD, 
                           names_from = DAY, 
                           values_from = X,
                           names_prefix = "Day_")

# Step 4: View reshaped paired data
print(paired_data)

# Step 5: Perform paired t-test
# Compare X values from Day 1 vs Day 2
paired_t_test <- t.test(paired_data$Day_1, paired_data$Day_2, paired = TRUE)

# Step 6: View result
print(paired_t_test)
