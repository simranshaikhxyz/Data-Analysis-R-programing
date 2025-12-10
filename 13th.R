library(dplyr)


cats_df <- data.frame(
  Name = c("Nomnom", "Pimpi", "Larry", "Demsy", "Tutu", "Tempo", "Nemo", 
           "Milo", "Luna", "Cleo", "Nomnom", "Pimpi"),
  Age = c(2, 3, 5, 4, 1, 2, 3, 4, 1, 5, 2, 3),
  Favorite_Food = c("Tuna", "Chicken", "Salmon", "Beef", "Turkey", 
                    "Tuna", "Salmon", "Chicken", "Tuna", "Beef", "Tuna", "Chicken")
)

print("1. Original Cats Dataset ")
print(cats_df)

# 2. Identify Exact Duplicate Rows
duplicates_report <- cats_df %>%
  group_by(Name, Age, Favorite_Food) %>%
  count() %>%
  filter(n > 1)

print("2. Identification Report (Rows that are duplicated) ")
print(duplicates_report)

# 3. Remove Exact Duplicates
clean_exact <- cats_df %>%
  distinct()

print("3. Removed Exact Duplicates")
print(clean_exact)

# 4. Keep Unique Cats by Name Only 
unique_cats <- cats_df %>%
  distinct(Name, .keep_all = TRUE)

print("4. Unique Cats Only (Partial Duplicates removed)")
print(unique_cats)

# 5. Example print for a specific cat
print("Nomnom Tuna Age 2")
