# Read the CSV file
market_data <- read.csv("Agriculture_price_dataset.csv")

# View the dataset
head(market_data)
# One-sample t-test
t_test_result <- t.test(market_data$Modal_Price, mu = 115)

# View result
print(t_test_result)
