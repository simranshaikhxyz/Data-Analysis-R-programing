library(dplyr)
library(tidyr)

df <- read.csv("C:/Users/mvluc/Downloads/Employee.csv", na.strings = c("", "NA"))

df_clean <- df %>%
  mutate(
    PaymentTier = replace_na(PaymentTier, 0),
    Age = replace_na(Age, 0)
  )

print("--- Cleaned Baseline Data ---")
print(head(df_clean))

df_calc <- df_clean %>%
  mutate(
    Bonus = PaymentTier * 0.1,
    Total_Compensation = PaymentTier + Bonus
  )

print("--- Method A: Arithmetic Results (Total Compensation) ---")
print(df_calc %>% select(PaymentTier, Bonus, Total_Compensation))

df_logic <- df_clean %>%
  mutate(
    Age_Group = ifelse(Age < 30, "Young", ifelse(Age <= 50, "Mid-Age", "Senior")),
    Tier_Label = ifelse(PaymentTier > 5000, "Premium", "Standard")
  )

print("--- Method B: Logic Results ---")
print(df_logic %>% select(Age, Age_Group, PaymentTier, Tier_Label))

df_text <- df_clean %>%
  mutate(
    Employee_Summary = paste(Education, "employee from", City, "with Tier", PaymentTier)
  )

print("--- Method C: Text Transformation ---")
print(head(df_text$Employee_Summary))

final_dataset <- df_clean %>%
  mutate(
    Total_Compensation = PaymentTier + (PaymentTier * 0.1),
    High_Earner = ifelse(Total_Compensation > 7000, TRUE, FALSE),
    Summary_Report = paste0(Education, ", Age: ", Age, ", Tier: ", PaymentTier)
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))
