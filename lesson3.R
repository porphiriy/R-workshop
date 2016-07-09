download.file("https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/4938964/temperature.csv", 
              "data/temperature.csv")
temperature <- read.csv("data/temperature.csv")
head(temperature)
tail(temperature)
str(temperature)

library(xlsx)

temperature <- read.table(file = "data/temperature",
                          header = TRUE,
                          sep = ",",
                          quote = FALSE,
                          dec = ".")

sex <- factor(c("male", "female", "female", "male"))
levels(sex)
str(sex)
as.integer(sex)


food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
levels(food)
as.integer(food)
food <- factor(food, levels=c("low", "medium", "high"))
levels(food)
min(food) ## doesn't work
food <- factor(food, levels=c("low", "medium", "high"), ordered=TRUE)
levels(food)
min(food) ## works!


f <- factor(c(1, 5, 10, 2))
as.numeric(f)               ## wrong! and there is no warning...
as.numeric(as.character(f)) ## works...
as.numeric(levels(f))[f]

exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control",
                   "treat1", "treat2", "treat3"), levels = c("treat1", "treat2", "treat3", "control"))
table(exprmt)
barplot(table(exprmt))

#Another solution:
  movetolast <- function(data, move) {
    data[c(setdiff(names(data), move), move)]
  }

exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control",
                   "treat1", "treat2", "treat3"))
table1 <- table(exprmt)
table1 <- movetolast(table1, c("control"))
barplot(table1)

