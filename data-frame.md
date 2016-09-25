# 資料框架

統計計算分析的資料, 通常有一個的基本架構, 在 R 稱作 資料框架 (data frame).
資料框架通常類似矩形的列聯表 (cross table), 在資料框架內, 同一變數的數值是在同一欄內 (column). 
在 R, 資料框架是統計分析中最基本的資料結構, 許多統計模型分析必須用到資料框架. 
資料框架與矩陣類似, 不同的地方在資料框架變數不需要是相同的變數形式 (種類), 實數變數, 文字變數, 邏輯變數等可已放在同一資料框架中.

1. 每一欄 (column), 都是一個變數
2. 第一列 (row), 可以是變數的 “變數名稱” (variable names)
3. 每一欄的變數形式可以是實數, 文字, 邏輯變數.
4. 第一欄 (column) 有時候是 “列標籤” (row label)

## 手動產生
```r
> member = data.frame(id=c(1,2,3), height=c(170, 175, 165), weight=c(70, 72, 62))
> member
  id height weight
1  1    170     70
2  2    175     72
3  3    165     62
```

## 使用資料框架內的變數
使用 `$` 存取 data frame 內變數
```r
> member$weight
[1] 70 72 62

> mean(member$weight)
[1] 68
```

當固定使用同一資料框架持續進行統計分析時,

1. 可以用 `names(data.frame.name)` 取得名稱為 data.frame.name 資料框架內的變數名稱.
2. 可以用 `attach(data.frame.name)` 載入名稱為 data.frame.name 資料框架. 這樣就可以直接適用變數名稱來進行分析.
3. 當不再使用某一特定資料框架時, 可以用 `detach(data.frame.name)`, 移出 R 工作空間常駐位置.

```r
> names(member)
[1] "id"     "height" "weight"
> height
錯誤: 找不到物件 'height'

> attach(member)
> height
[1] 170 175 165
> mean(weight)
[1] 68
> detach(member)
```
