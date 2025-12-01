library(dplyr)

# Load the dataset
disasters <- read.csv("C:/Users/mvluc/Downloads/global_disaster_response_2018_2024 (1).csv")

# Original dataset (first 3 rows)
cat("\n--- Original Dataset (First 3 rows) ---\n")
print(head(disasters, 3))

# Select specific columns
selected_cols <- disasters %>%
  select(country, disaster_type, severity_index, casualties)

cat("\n--- Selected Specific Columns ---\n")
print(head(selected_cols, 3))

# Example: Select columns starting with 'c' (like country, casualties)
starts_with_c <- disasters %>%
  select(starts_with("c"))

cat("\n--- Selected Columns Starting with 'c' ---\n")
print(head(starts_with_c, 3))

# Drop a single column
dropped_one <- disasters %>%
  select(-severity_index)

cat("\n--- Dataset with 'severity_index' Dropped ---\n")
print(names(dropped_one))

# Drop multiple columns
dropped_multiple <- disasters %>%
  select(-severity_index, -casualties)

cat("\n--- Dataset with 'severity_index' and 'casualties' Dropped ---\n")
print(names(dropped_multiple))

# Drop a range of columns (from disaster_type to casualties)
dropped_range <- disasters %>%
  select(-(disaster_type:casualties))

cat("\n--- Dataset with Range 'disaster_type' to 'casualties' Dropped ---\n")
print(names(dropped_range))
