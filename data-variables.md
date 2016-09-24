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

### 輸入簡單資料

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

### 輸入向量資料 - 使用 `c()`
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

### 輸入序列向量 - 使用 `seq()`
```r
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
