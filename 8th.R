library(dplyr)

sleep_df <- read.csv("C:/Users/mvluc/Downloads/dataset_2191_sleep.csv", stringsAsFactors=TRUE)

cat("\n--- 1. Original Data (First 6 Rows) ---\n")
print(head(sleep_df))

cat("\n--- Count of Missing Values per Column ---\n")
print(colSums(is.na(sleep_df)))

clean_omit <- na.omit(sleep_df)

cat("\n--- 2. Data after na.omit() ---\n")
print(paste("Original rows:", nrow(sleep_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

# Fill missing numeric values with column means using dplyr
clean_replace <- sleep_df %>%
  mutate(
    body_weight = ifelse(is.na(body_weight), mean(body_weight, na.rm = TRUE), body_weight),
    brain_weight = ifelse(is.na(brain_weight), mean(brain_weight, na.rm = TRUE), brain_weight),
    max_life_span = ifelse(is.na(max_life_span), mean(max_life_span, na.rm = TRUE), max_life_span),
    gestation_time = ifelse(is.na(gestation_time), mean(gestation_time, na.rm = TRUE), gestation_time),
    predation_index = ifelse(is.na(predation_index), mean(predation_index, na.rm = TRUE), predation_index)
  )

cat("\n--- 3. Data after replacing NAs with column means ---\n")
print(head(clean_replace))

cat("\n--- Remaining NAs after replacement ---\n")
print(colSums(is.na(clean_replace)))
