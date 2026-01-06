library(ggplot2)
library(readr)

mydata <- read_csv("C:/Users/Lenovo/Downloads/indian_pharmaceutical_products_clean.csv")

mydata <- mydata[1:10, ]

mydata$price_inr <- as.numeric(mydata$price_inr)
mydata$pack_size <- as.numeric(mydata$pack_size)
mydata$brand_name <- as.factor(mydata$brand_name)

# bar plot
ggplot(mydata, aes(x = brand_name)) +
  geom_bar(fill = "blue") +
  labs(title = "Number of Products by Brand",
       x = "Brand",
       y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# box plot
ggplot(mydata, aes(y = price_inr)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Product Prices",
       y = "Price (INR)") +
  theme_minimal()

# scatter plot
ggplot(mydata, aes(x = pack_size, y = price_inr, color = brand_name)) +
  geom_point(size = 3) +
  labs(title = "Price vs Pack Size",
       x = "Pack Size",
       y = "Price (INR)") +
  theme_minimal()
