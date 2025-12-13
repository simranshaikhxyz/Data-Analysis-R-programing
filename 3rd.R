data3 <- read.csv("Instagram_Analytics.csv")

head(data3)


# Two-way table: media_type × traffic_source

table(data3$media_type, data3$traffic_source)

# Two-way table: media_type × content_category

table(data3$media_type, data3$content_category)

# Optional: Add margins (totals) to a two-way table
addmargins(table(data3$media_type, data3$traffic_source))
