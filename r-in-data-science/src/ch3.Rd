library(reshape2)

# vector operation
func <- function(x) {
  if (x %% 2 == 0) 'even' else 'odd'
}

vec <- 1:4
sapply(vec, func)
lapply(vec, func)

funcv <- Vectorize(func)
funcv(vec)

ifelse(vec %% 2 == 0, 'even', 'odd')

# data-frame operation
sapply(iris[, 1:4], mean)
lapply(iris[, 1:4], mean)

# list operation
mylist <- as.list(iris[, 1:4])
sapply(mylist, mean)
lapply(mylist, mean)

# matrix operation
set.seed(1)
vec <- round(runif(12)*100)
mat <- matrix(vec, 3, 4)
apply(mat, MARGIN = 1, sum) # calculate by 1st dimension (row)
apply(mat, MARGIN = 2, sum) # calculate by 2nd dimension (column)

# apply a function over a ragged array
tapply(X = iris$Sepal.Length, INDEX = list(iris$Species), FUN = mean)
with(iris, tapply(Sepal.Length, INDEX = list(Species), FUN = mean))

with(iris, aggregate(Sepal.Length, by = list(Species), FUN = mean))

# apply a function to a multiple list or vector arguments
vec1 <- vec2 <- 1:9
para <- expand.grid(vec1, vec2)
mapply(FUN = function(x,y) (x*y), para[,1], para[,2])

outer(vec1, vec2, FUN = function(x,y) (x*y))

# repeat evaluation of an expression
replicate(3, sum(runif(10)))

# subset
subset(iris, Species == 'setosa')

# transform
transform(iris, Sepal.LW = Sepal.Length*Sepal.Width)

# grouping
set.seed(1)
num <- runif(20)*100
data <- data.frame(num)

q25 <- quantile(data$num, 0.25)
q50 <- quantile(data$num, 0.50)
q75 <- quantile(data$num, 0.75)
groupvec <- c(min(data$num), q25, q50, q75, max(data$num))
labels <- c('A', 'B', 'C', 'D')
with(data, cut(num, breaks = groupvec, labels = labels, include.lowest = TRUE))

# encode a vector as a factor (the terms ‘category’ and ‘enumerated type’ are also used for factors)
vec <- 1:8 %% 2
factor(vec, labels = c('odd', 'even'))

vec <- 1:8 %% 3
factor(vec, labels = c('A', 'B', 'C'))

# Stack or Unstack Vectors from a Data Frame or List
data_l <- stack(iris[, 1:4])
data_w <- unstack(data_l)

# mean of each specie
subdata <- iris[,4:5]
data_w <- unstack(subdata)
colMeans(data_w)

library(reshape2)
dcast(subdata, Species~., value.var = 'Petal.Width', fun = mean)

# long/wide format
iris_long <- melt(iris, id='Species')

dcast(data = iris_long, formula = Species~variable, value.var = 'value', fun = mean)
dcast(iris_long, Species~variable, mean)

# dcast
head(tips)

dcast(tips, sex~., value.var = 'tip', fun = mean)
dcast(tips, sex~size, value.var = 'tip', fun=mean)

dcast(tips, sex~., value.var = 'tip', fun = mean)
dcast(tips, sex~., value.var = 'total_bill', fun=mean)

tips_melt = melt(data = tips, id.vars = c('sex', 'smoker', 'time', 'size', 'day'))
dcast(tips_melt, sex~variable, value.var = 'value', fun = mean) # variable={total_bill,tip}

# dcast can deal with multiple variables
tips_mean <- dcast(tips_melt, sex+smoker~variable, mean)
tips_mean$rate <- with(tips_mean, tip/total_bill)
tips_mean

# ddply
library(plyr)

ratio_fun <- function(x) { sum(x$tip) / sum(x$total_bill) }

ddply(tips, 'sex', ratio_fun)
ddply(tips, sex~smoker, ratio_fun)

# paste, cat
d = data.frame(x = c(1,2,3), y = c('a','b','c'))
cat(paste(d$y, d$x, sep = '='), sep = '\n')

# file I/O
f <- file('/tmp/file.txt')
cat(1:3, sep = '\n', file = f)
scan(file = f)
close(f)



input 
