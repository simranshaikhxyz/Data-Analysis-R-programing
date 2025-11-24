tips <- read.csv("C:/Users/mvluc/Downloads/simranpython/tips.csv", stringsAsFactors=TRUE)
View(tips)
lm(tip~size)
attach(tips)

temp <- read.csv("~/temp.txt", stringsAsFactors=TRUE)
lm(ID ~ Pressure)
attach(temp)