
library(dplyr)
library(stringr)
library(tidyr)

diabetes_df <- read.csv("C:/Users/mvluc/Downloads/diabetes.csv", 
                        na.strings = c("", "NA"))

diabetes_df <- diabetes_df %>%
  mutate(Patient_Code = paste0("PT-", 1000 + row_number(), "-2023"))

print("--- Original Dataset ---")
print(head(diabetes_df))


diabetes_df <- diabetes_df %>%
  mutate(
    Code_Prefix = str_sub(Patient_Code, 1, 2),
    Year = str_sub(Patient_Code, -4, -1)
  )

print("--- Data after str_sub() ---")
print(diabetes_df %>% select(Patient_Code, Code_Prefix, Year))

# Using str_split()
split_matrix <- str_split(diabetes_df$Patient_Code, "-", simplify = TRUE)
diabetes_df <- diabetes_df %>%
  mutate(
    Prefix = split_matrix[,1],
    ID = split_matrix[,2],
    Mfg_Year = split_matrix[,3]
  )

print("--- Data after str_split() ---")
print(diabetes_df %>% select(Patient_Code, Prefix, ID, Mfg_Year))


diabetes_df <- diabetes_df %>%
  separate(Patient_Code, into = c("Dept", "Patient_ID", "Year"), sep = "-")

print("--- Data after separate() ---")
print(diabetes_df %>% select(Dept, Patient_ID, Year))

