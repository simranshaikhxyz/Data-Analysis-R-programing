df <- read.csv("~/delhi-weather-aqi-2025.csv")

df_model <- df[, c("aqi_index", "pm2_5")]

df_model <- na.omit(df_model)

df_model$AQI_Binary <- ifelse(df_model$aqi_index > 100, 1, 0)

model <- glm(AQI_Binary ~ pm2_5, 
             data = df_model, 
             family = binomial)
summary(model)

predicted_prob <- predict(model, type = "response")

plot(df_model$pm2_5, predicted_prob,
     xlab = "PM2.5",
     ylab = "Probability of Bad AQI",
     main = "Logistic Regression: AQI vs PM2.5",
     pch = 16, col = "blue")
