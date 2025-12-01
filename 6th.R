
library(dplyr)


df1 <- read.csv("C:/Users/mvluc/Downloads/synthetic_medical_symptoms_dataset.csv")   
df2 <- read.csv("C:/Users/mvluc/Desktop/Dataset/iris.xlsx")         


df1_small <- df1 %>% select(age, gender, fever)
df2_small <- df2 %>% select(sepal_length, sepal_width, species)


combined_data <- bind_rows(df1_small, df2_small)


write.csv(combined_data, "combined_data.csv", row.names = FALSE)


print(combined_data)
