library(tidyr)
library(dplyr)

data <- read.csv("diamonds.csv/diamonds.csv")

original <- data
print("Original Data:")
print(original)

# WIDE -> LONG 
long_data <- original %>%
  pivot_longer(
    cols = -carat,
    names_to = "Variable",
    values_to = "Value",
    values_transform = as.character
  )

print("Long Data:")
print(long_data)

# LONG -> WIDE
wide_data <- long_data %>%
  pivot_wider(
    names_from = Variable,
    values_from = Value
  )

print("Wide Data:")
print(wide_data)

# CREATE A SMALL REPORT
report <- original %>%
  summarise(
    total_rows = n(),
    avg_carat = mean(carat, na.rm = TRUE),
    min_carat = min(carat, na.rm = TRUE),
    max_carat = max(carat, na.rm = TRUE)
  )

print("Small Report:")
print(report)
