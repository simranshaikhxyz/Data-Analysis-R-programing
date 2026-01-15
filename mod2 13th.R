df <- read.csv("~/delhi-weather-aqi-2025.csv")

df_model <- df[, c("temp_c", "humidity")]

df_model <- df_model[1:20, ]

df_model <- na.omit(df_model)

model <- lm(temp_c ~ humidity, data = df_model)

summary(model)

plot(df_model$humidity, df_model$temp_c,
     main = "Simple Linear Regression: Temperature vs Humidity",
     xlab = "Humidity (%)",
     ylab = "Temperature (°C)",
     pch = 16,
     col = "blue")

abline(model, col = "red", lwd = 2)
