library(readr)

data <- read_csv("C:/Users/Lenovo/Downloads/Agriculture_price_dataset.csv")

price_data <- data[, c("Min_Price", "Max_Price", "Modal_Price")]

price_data$Min_Price <- as.numeric(price_data$Min_Price)
price_data$Max_Price <- as.numeric(price_data$Max_Price)
price_data$Modal_Price <- as.numeric(price_data$Modal_Price)

price_data <- na.omit(price_data)

cor_matrix <- cor(price_data)

cor_matrix
