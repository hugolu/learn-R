library(reshape2)

# original data
ID <- c(1,1,2,2)
Time <- c(1,2,1,2)
X1 <- c(5,3,6,2)
X2 <- c(6,5,1,4)
mydata <- data.frame(ID, Time, X1, X2)
mydata

# melt
md <- melt(mydata, id=c('ID', 'Time'))
md

# cast
dcast(md, ID~variable, mean)
dcast(md, Time~variable, mean)
dcast(md, ID~Time, mean)
dcast(md, ID+Time~variable)
dcast(md, ID+variable~Time)
dcast(md, ID~variable+Time)
