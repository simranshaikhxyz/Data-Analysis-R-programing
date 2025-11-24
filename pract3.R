library(dplyr)
library(readr)

df <- read_csv("C:/Users/mvluc/Downloads/simranpython/Processed_Shopping_Data.csv")

hi <- subset(df, annual_income > 70000)
cat("High income rows:", nrow(hi), "\n")
head(hi)

as <- subset(df, Age > 30 & spending_score > 50)
cat("Age > 30 AND spending_score > 50:", nrow(as), "\n")
head(as)

sc <- subset(df, gender == "Male" | spending_score > 80)
cat("Special customers:", nrow(sc), "\n")
head(sc)

hi2 <- df |> filter(annual_income > 70000)
cat("High income rows (dplyr):", nrow(hi2), "\n")

as2 <- df |> filter(Age > 30, spending_score > 50)
cat("Age > 30 AND spending_score > 50 (dplyr):", nrow(as2), "\n")

score20_40 <- df |> filter(spending_score %in% c(20, 40))
cat("Customers with spending_score 20 or 40:", nrow(score20_40), "\n")
