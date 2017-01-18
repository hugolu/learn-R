# 6. Basic graph

score <- runif(100) * 100
test <- as.data.frame(score)
test$grade[score >= 75] <- 'A'
test$grade[score >= 50 & score < 75] <- 'B'
test$grade[score >= 25 & score < 50] <- 'C'
test$grade[score <= 25] <- 'D'
counts <- table(factor(test$grade))

# 6.1 barplot
library(vcd)
barplot(counts, main="Test", xlab="Grade", ylab="Num")
barplot(counts, main="Test", xlab="Num", ylab="Grade", horiz=TRUE)

