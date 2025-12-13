
data <- read.csv("global_earthquakes_10yrs_M4.5_2025-12-10.csv")


head(data, 10)

# Paired t-test using two columns from the CSV
t.test(data$depth, data$mag, paired = TRUE)
