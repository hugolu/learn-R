# 數字 (只有一個元素的向量)
27 * 1.8 + 32

# 向量 (一維的容器)
temp <- c(27, 29, 23, 14)
temp * 1.8 + 32

temp[4]

temp[c(1,2,3)]
temp[-4]

temp > 20
temp[temp > 20]
temp[temp > mean(temp)]

# 矩陣 (二為的容器)
vector <- 1:12
matrix1 <- matrix(vector, nrow=3, ncol=4, byrow=FALSE)

vec1 <- 1:3
vec2 <- 4:6
vec3 <- 7:9
matrix1 <- cbind(vec1, vec2, vec3)
matrix2 <- rbind(vec1, vec2, vec3)

matrix1[1,1] + matrix1[1,2] + matrix1[1,3]
sum(matrix1[1,])

ifelse(matrix1 %% 2 == 0, TRUE, FALSE)

# 數據框
city <- c('A', 'B', 'C', 'D')
temp <- c(27, 29, 23, 14)
data <- data.frame(city, temp)

data[,1]
data[,'city']
data$city

data[data$temp > mean(data$temp),]
with(data, data[temp > mean(temp),])

summary(data)

order(data$temp)
data[order(data$temp),]
data[order(data$temp),][1:2,]

# 列表
data_list <- list(temp = temp, city = city)

# 缺失值 (應該有而沒有，起到佔位符作用)
temp <- c(27, 29, 23, 14, NA)
mean(temp)
mean(temp, na.rm=TRUE)

# 空值 (表示完全沒有，可用來快速刪除複雜對象的一個元素)
temp <- c(27, 29, 23, 14, NULL)
mean(temp)

# 連接
textCon <- textConnection('output', 'w')
sink(textCon)
print('This will be not shown on screen, but written into output object')
sink()
print(output)


fileCon <- file('output.txt', 'w')
sink(fileCon)
print('This will be not shown on screen, but written into output.txt')
sink()
close(fileCon)
browseURL('output.txt')

# 公式 ??

# 表達式 (使用 eval 函數來運行表達式，最終生成需要的x)
x <- 0
ex <- expression(x <- seq(1, 10, 2))
x
eval(ex)
x

# 環境
ls(envir = .GlobalEnv)
ls()

env1 <- new.env()
assign("x1", 1:5, envir = env1)
get("x1", envir = env1)
exists("x1", envir = env1)
rm("x1", envir = env1)
exists("x1", envir = env1)

# 函數
circleArea <- function(r) {
  area <- pi * r^2
  return(area)
}

circleArea(4)