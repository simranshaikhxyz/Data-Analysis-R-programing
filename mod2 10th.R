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

# pie chart
ggplot(mydata, aes(x = "", fill = dosage_form)) +
  geom_bar(width = 1) +
  coord_polar("y") +
  labs(
    title = "Pie Chart of Products by Dosage Form",
    fill = "Dosage Form"
  ) +
  theme_void()

# high low chart
ggplot(mydata, aes(x = brand_name)) +
  geom_linerange(
    aes(
      ymin = price_inr - 10,
      ymax = price_inr + 10
    ),
    color = "darkgreen",
    size = 1
  ) +
  geom_point(aes(y = price_inr), color = "red", size = 2) +
  labs(
    title = "High–Low Chart of Product Prices by Brand",
    x = "Brand",
    y = "Price (INR)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

