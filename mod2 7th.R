library(dplyr)
data <- read.csv("laptop_battery_health_usage.csv")

head(data)

data$brand <- as.factor(data$brand)

anova_data <- data[, c("brand", "battery_health_percent")]

anova_data <- na.omit(anova_data)

anova_result <- aov(battery_health_percent ~ brand, data = anova_data)
print(summary(anova_result))

summary_stats <- anova_data %>%
  group_by(brand) %>%
  summarise(
    mean_health = mean(battery_health_percent),
    se_health = sd(battery_health_percent) / sqrt(n())
  )

print(summary_stats)

plot(1:nrow(summary_stats), summary_stats$mean_health,
     ylim = c(min(summary_stats$mean_health - summary_stats$se_health) - 5,
              max(summary_stats$mean_health + summary_stats$se_health) + 5),
     xaxt = "n",
     pch = 19, col = "blue",
     xlab = "Brand",
     ylab = "Mean Battery Health (%)",
     main = "Battery Health Percentage by Brand with SE Bars")

axis(1, at = 1:nrow(summary_stats), labels = summary_stats$brand)

arrows(x0 = 1:nrow(summary_stats),
       y0 = summary_stats$mean_health - summary_stats$se_health,
       x1 = 1:nrow(summary_stats),
       y1 = summary_stats$mean_health + summary_stats$se_health,
       code = 3, angle = 90, length = 0.1, col = "blue", lwd = 2)


p_value <- summary(anova_result)[[1]][["Pr(>F)"]][1]
if (p_value < 0.05) {
  cat("Decision: Reject Null Hypothesis (H0).\n")
  cat("Conclusion: Battery health percentage differs significantly among brands.\n")
} else {
  cat("Decision: Accept Null Hypothesis (H0).\n")
  cat("Conclusion: No significant difference in battery health percentage among brands.\n")
}
