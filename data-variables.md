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
> a <- 12.3 # numeric
> a
[1] 12.3
> b <- 123 # integer
> b
[1] 123
> c <- TRUE # logical
> c
[1] TRUE
> d <- "x" # character
> d
[1] "x"
> e <- "hello world" # string
> e
[1] "hello world"
> e <- 12 + 3i # complex
> e
[1] 12+3i
```
