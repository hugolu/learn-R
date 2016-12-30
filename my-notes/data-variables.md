# 資料變數

## 分類

數值以具有名稱的向量 (vector) 形式儲存，單一數值 (scalar) 視為僅有單一元素的向量

類型 | 說明
-----|------
numeric | 實數向量
integer | 整數向量
logical | 邏輯變數向量: TRUE(T), FALSE(F)
complex | 複數向量
character | 文字或字串向量
list | 列表

### 簡單資料

```r
> x <- 12.3 # numeric
> x
[1] 12.3
> x <- 123 # integer
> x
[1] 123
> x <- TRUE # logical
> x
[1] TRUE
> x <- "x" # character
> x
[1] "x"
> x <- "hello world" # string
> x
[1] "hello world"
> x <- 12 + 3i # complex
> x
[1] 12+3i
```

### 向量資料 - 使用 `c()`
```r
> x <- c(1,2,3)
> x
[1] 1 2 3
> c(4,5,6) -> y
> y
[1] 4 5 6
> 1 / x
[1] 1.0000000 0.5000000 0.3333333
> y <- c("apple", "banana", "cherry")
> y
[1] "apple"  "banana" "cherry"
> z <- c(1:5)
> z
[1] 1 2 3 4 5
> z.tmp <- z > 2
> z.tmp
[1] FALSE FALSE  TRUE  TRUE  TRUE
```

### 序列向量 - 使用 `seq()`
```r
> x <- 1:5
> x
[1] 1 2 3 4 5
> x <- seq(1,5,1)
> x
[1] 1 2 3 4 5
> y <- seq(5,1,-1)
> y
[1] 5 4 3 2 1
> z <- rep(1,5)
> z
[1] 1 1 1 1 1
```

### 矩陣 - 使用 `matrix()`
```r
> x <- matrix(1:8, nrow=4)
> x
     [,1] [,2]
[1,]    1    5
[2,]    2    6
[3,]    3    7
[4,]    4    8
> x <- matrix(1:8, nrow=4, byrow=T)
> x
     [,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
[4,]    7    8
> x <- matrix(c(1,2), nrow=4, ncol=2)
> x
     [,1] [,2]
[1,]    1    1
[2,]    2    2
[3,]    1    1
[4,]    2    2
> 
```

### 列表(list) - 使用 `list()`
```r
> x <- c(1, 3, 5)
> y <- c("apple", "banana", "cherry")
> z <- list(x, y)
> z
[[1]]
[1] 1 3 5

[[2]]
[1] "apple"  "banana"  "cherry"

> z <- list(num=x, str=y)
> z
$num
[1] 1 3 5

$str
[1] "apple"  "banana"  "cherry"

> z$num
[1] 1 3 5
> z$str[2]
[1] "banana"
```

### 資料框架(data frame) - 使用 `data.frame()`
```r
> x <- c(1, 3, 5)
> y <- c("apple", "banana", "cherry")
> z <- data.frame(num=x, str=y)
> z
  num    str
1   1  apple
2   3 banana
3   5 cherry
```

```r
> zz <- edit(z) # 修改 z，另存於 zz
> zz
  num    str
1   1  apple
2   3 banana
3   6 cherry
```
