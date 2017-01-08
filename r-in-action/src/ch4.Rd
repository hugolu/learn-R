# 4.1 - create leadership

manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age, q1, q2, q3, q4, q5, stringsAsFactors=FALSE)

leadership

# 4.2 - create new variables
# variable_name <- expression

mydata <- data.frame(x1 = c(2,2,6,4), x2 = c(3,4,2,8))

mydata <- transform(mydata,
                    sumx = x1 + x2,
                    meanx = (x1 + x2)/2)

# 4.3 - recode variables

leadership$age[leadership$age == 99] <- NA

leadership <- within(leadership, {
                      agecat <- NA
                      agecat[age > 75]              <- "Elder"
                      agecat[age >= 55 & age <= 75] <- "Middle Aged"
                      agecat[age < 55]              <- "Young"})
leadership

# 4.4 - rename variables

#fix(leadership) # manager >> managerID
#names(leadership)[2] <- "testDate"
names(leadership)[6:10] <- c("item1", "item2", "item3", "item4", "item5")

library(plyr)
leadership <- rename(leadership,
                    c(manager="managerID", date="testDate"))
leadership

# 4.5 - default values

# which is NA
is.na(leadership[, 6:10])

# remove NA
x <- c(1, 2, NA, 3)
x[1] + x[2] + x[3] + x[4]   # NA
sum(x)                      # NA
sum(x, na.rm=TRUE)          # 6

newdata <- na.omit(leadership)
newdata
