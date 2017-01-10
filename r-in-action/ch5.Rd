# 5. advanced data management

# 5.1 grade the first 20% as A, the second 20% as B...
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones", "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak", "Greg Knox", "Joel England", "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
stringsAsFactors=FALSE)

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


