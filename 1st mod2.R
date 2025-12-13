library(psych)

data_full <- read.csv("spotify_data clean.csv")


data1 <- data_full[, c("track_popularity",
                       "artist_popularity",
                       "track_duration_min")]

head(data1)

summary(data1)

describe(data1)

print("simran s113")