library(writexl)
library(gridExtra)

data <- data.frame(
  Name = c("nomnom", "tutu", "pimpi"),
  age = c(2, 1, 1),
  water_intake = c("1.5ml", "1ml", "1ml")
)

write.csv(
  data,
  "cat_results.csv",
  row.names = FALSE
)


summary_data <- data.frame(
  weight = c(2,1,2),
  food = c("whiskas","purepet","whiskas")
)

write_xlsx(
  list(
    "cat" = data,
    "Summary" = summary_data
  ),
  "cat_results.xlsx"
)

pdf("cat_results.pdf")
print(data)
dev.off()

pdf("cat_results_table.pdf")
grid.table(data)
dev.off()


