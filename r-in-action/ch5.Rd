# 5. advanced data management

# 5.1 grade the first 20% as A, the second 20% as B...
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones", "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak", "Greg Knox", "Joel England", "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English, stringsAsFactors=FALSE)

# 5.2 deal with numeric and char values

# 5.2.1 math functions
abs(-4)                 # 4
sqrt(25)                # 5
ceiling(3.475)          # 4
floor(3.475)            # 3
trunc(5.99)             # 5
round(3.475, digits=2)  # 3.48
signif(3.475, digits=2) # 3.5

# cos(x), sin(x), tan(x)
# acos(x), asin(x), atan(x)
# cosh(x), sinh(x), tanh(x)
# acosh(x), asinh(X), atanh(x)

log(10)
exp(2.302585)

log(10,10)
log10(10)

# 5.2.2 statistics functions
x <- 1:4
mean(x)
median(x)
sd(x)
var(x)
mad(x) # median absolute deviation?
quantile(x, c(.3, .84))
range(x)
sum(x)
diff(x, lag=1)
min(x)
max(x)

y <- scale(x, center=TRUE, scale=TRUE)
mean(y)
sd(y)

# 5.2.3 distribution
runif(5)
runif(5)

set.seed(1234)  # reproducible results
runif(5)        # [1] 0.1137034 0.6222994 0.6092747 0.6233794 0.8609154

# 5.2.4 char processing
x <- c("ab", "cde", "fghij")
length(x)   # 3 elements
nchar(x)    # 2,3,4 chars for each elements

x <- "abcdef"
substr(x, 2, 4)
substr(x, 2, 4) <- "222222" # replace char 2~4
x

grep("abc", c("aaBcc", "aabcc", "abccc"), fixed=TRUE)
grep("a.c", c("aaBcc", "aabcc", "abccc"), fixed=FALSE)

sub("\\s",".","Hello There")

strsplit("abc", "")

paste("x", 1:3,sep="")
paste("x", 1:3,sep="M")
paste("Today is", date())

toupper("Hello World")
tolower("Hello World")

# 5.2.5 other functions 
length(c(2,5,6,9))
seq(1,10,2)
seq(10,1,-2)
rep(1:3, 2)
cut(1:100, 4)     # 4 levels
pretty(1:100, 4)  # [1]   0  20  40  60  80 100
cat("Hello", "World")

# 5.2.6 apply functions on matrix and data frame
a <- 5
sqrt(a)

b <- c(1.243, 5.654, 2.99)
round(b)

c <- matrix(1:12, nrow=3)
log(c)
mean(c)
apply(c, 1, sum) # apply on each row
apply(c, 2, sum) # apply on each column

# 5.3 solve question
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones", "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak", "Greg Knox", "Joel England", "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English, stringsAsFactors=FALSE)
roster

z <- scale(roster[, 2:4])
score <- apply(z, 1, mean)
roster <- cbind(roster, score)

y <- quantile(score, c(.8,.6,.4,.2))
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "E"

name <- strsplit((roster$Student), " ")
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)
roster <- cbind(Firstname,Lastname, roster[,-1])
roster <- roster[order(Lastname,Firstname),]
roster 

options(digits=2)
roster[order(roster$score, decreasing = TRUE),]

# 5.4 control flow

## 5.4.1 repeat and loop

for (i in 1:3) print(i)

i <- 3
while (i > 0) {print(i); i <- i - 1}

# 5.4.2 conditional

grade <- c('A', 'B', 'B', 'C')
if (is.character(grade)) grade <- as.factor(grade)
if (!is.factor(grade)) grade <- as.factor(grade) else print("Grade already is a factor")

score <- 0.7
outcome <- ifelse (score > 0.5, "passed", "falsed")
outcome

feelings <- c("sad", "afraid")
for (i in feelings) {
  print(
    switch(i,
      happy   = "I am glad you are happy",
      afraid  = "There is nothing to fear",
      sad     = "Cheer up",
      angry   = "Calm down now"
    )
  )
}

# 5.5 function
mydate <- function(type="logn") {
  switch(type,
    long  = format(Sys.time(), "%A %B %d %Y"),
    short = format(Sys.time(), "%m-%d-%y"),
    cat(type, "is not a recognized type\n")
  )
}

mydate()
mydate("long")
mydate("short")
mydate("medium")

# 5.6 aggregate & reshape

# 5.6.1 matrix transpose
mat <- matrix(1:9, nrow=3)
mat
t(mat)

# 5.6.1 aggregate
options(digits=3)
attach(mtcars)
aggregate(mtcars, by=list(cyl), FUN=mean, na.rm=TRUE)
aggregate(mtcars, by=list(gear), FUN=mean, na.rm=TRUE)
aggregate(mtcars, by=list(cyl, gear), FUN=mean, na.rm=TRUE)
detach(mtcars)

# 5.6.2 reshape2
mydata <- data.frame(ID=c(1,1,2,2), Time=c(1,2,1,2), X1=c(5,3,6,2), X2=c(6,5,1,4))

library(reshape2)
md <- melt(mydata, id=c("ID", "Time"))
md

dcast(md, ID~variable, mean)
dcast(md, Time~variable, mean)
dcast(md, ID~Time, mean)
dcast(md, ID+Time~variable)
dcast(md, ID+variable~Time)
dcast(md, ID~variable+Time)
