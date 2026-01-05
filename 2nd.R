library(dplyr)

data2 <- read.csv("Amazon.csv")

head(data2, 10)

# Frequency of Category
table(data2$Category)

# Frequency of Brand
table(data2$Brand)

# Frequency of PaymentMethod
table(data2$PaymentMethod)

count(data2, Category)
count(data2, Brand)
count(data2, PaymentMethod)
print("simran s113")

