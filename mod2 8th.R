library(dplyr)
library(ggplot2)

data <- read.csv("yahooStock.csv")

anova_data <- data[, c("transactionType", "symbolType", "amount")]

anova_data$transactionType <- as.factor(anova_data$transactionType)
anova_data$symbolType <- as.factor(anova_data$symbolType)

anova_data <- na.omit(anova_data)

anova_result <- aov(amount ~ transactionType * symbolType, data = anova_data)
print(summary(anova_result))

summary_stats <- anova_data %>%
  group_by(transactionType, symbolType) %>%
  summarise(
    mean_amount = mean(amount),
    se_amount = sd(amount)/sqrt(n()),
    .groups = "drop"
  )
print(summary_stats)

ggplot(summary_stats, aes(x=transactionType, y=mean_amount, fill=symbolType)) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=mean_amount - se_amount, ymax=mean_amount + se_amount),
                width=0.2, position=position_dodge(0.9)) +
  labs(title="Transaction Amount by Transaction Type and Symbol Type",
       x="Transaction Type", y="Mean Amount") +
  theme_minimal()

p_values <- summary(anova_result)[[1]][["Pr(>F)"]]

if(length(p_values) >= 1){
  if(p_values[1] < 0.05){
    cat("Transaction Type: Reject H0 → amount differs among transaction types\n")
  } else cat("Transaction Type: Accept H0 → amount is similar across transaction types\n")
}

if(length(p_values) >= 2){
  if(p_values[2] < 0.05){
    cat("Symbol Type: Reject H0 → amount differs among symbol types\n")
  } else cat("Symbol Type: Accept H0 → amount is similar across symbol types\n")
}

if(length(p_values) >= 3){
  if(p_values[3] < 0.05){
    cat("Interaction: Reject H0 → interaction exists between transaction type and symbol type\n")
  } else cat("Interaction: Accept H0 → no significant interaction\n")
}
