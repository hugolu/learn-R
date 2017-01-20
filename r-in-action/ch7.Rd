options(digits=3)

# 7 basic statistics analytics

# 7.1 descriptive
myvars <- c('mpg', 'hp', 'wt')
head(mtcars[myvars])

# summary
summary(mtcars[myvars])

# sapply
mystats <- function(x, na.omit=FALSE) {
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return (c(n=n, mean=n, stdev=s, skew=skew, kurtosis=kurt))
}

sapply(mtcars[myvars], mystats)

# Hmisc
library(Hmisc)
describe(mtcars[myvars])

# pastecs
library(pastecs)
stat.desc(mtcars[myvars])
