library(dplyr)
library(readr)

df <- read_csv("C:/Users/mvluc/Downloads/simranpython/winequality-red.csv")

sorted_alcohol <- df |> arrange(alcohol)
head(sorted_alcohol, 5)

sorted_quality <- df |> arrange(desc(quality))
head(sorted_quality, 5)

multi_sort <- df |> arrange(`fixed acidity`, desc(`residual sugar`))
head(multi_sort, 10)

high_alcohol <- df |> filter(alcohol > 12) |> arrange(desc(quality))
print(high_alcohol |> select(alcohol, quality, `residual sugar`) |> head(5))
