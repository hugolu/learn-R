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
