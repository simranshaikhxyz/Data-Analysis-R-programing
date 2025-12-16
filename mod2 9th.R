data <- read.csv("ecommerce_10000.csv")

chi_data <- data[, c("Category", "Platform")]

chi_data <- na.omit(chi_data)

table_chi <- table(chi_data$Category, chi_data$Platform)
print(table_chi)

chi_result <- chisq.test(table_chi)
print(chi_result)

if(chi_result$p.value < 0.05){
  cat("Reject H0 → Category and Platform are dependent (related).\n")
} else {
  cat("Accept H0 → Category and Platform are independent (not related).\n")
}
