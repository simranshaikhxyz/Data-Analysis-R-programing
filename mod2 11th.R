library(ggplot2)
library(readr)

crime <- read_csv("crime.csv/crime.csv")

crime <- crime[1:20, ]

crime <- crime[, c("HOUR", "MONTH", "TYPE")]

# histogram
ggplot(crime, aes(HOUR)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(
    title = "Crimes by Hour of the Day (First 20 Rows)",
    x = "Hour",
    y = "Number of Crimes"
  ) +
  theme_minimal()

# histogram
ggplot(crime, aes(MONTH)) +
  geom_histogram(binwidth = 1, fill = "lightgreen", color = "black") +
  labs(
    title = "Crimes by Month (First 20 Rows)",
    x = "Month",
    y = "Number of Crimes"
  ) +
  theme_minimal()

# box plot
ggplot(crime, aes(TYPE, HOUR)) +
  geom_boxplot(fill = "orange") +
  labs(
    title = "Crime Time by Type (First 20 Rows)",
    x = "Crime Type",
    y = "Hour of Day"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
