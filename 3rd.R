install.packages(c("readr", "psych"))
library(readr)
library(psych)


my_data <- read.csv("C:/Users/mvluc/Downloads/simranpython/tips.csv")


head(my_data)
tail(my_data)


cat("Dimensions (Rows, Columns): ", paste(dim(my_data), collapse = ", "), "\n")


str(my_data)

summary(my_data)

cat("Column Names: ", paste(names(my_data), collapse = ", "), "\n")

describe(my_data)

