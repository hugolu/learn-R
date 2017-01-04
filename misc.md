# 雜七雜八

## 安裝 packages
```R
install.packages('plyr', repos='http://mirrors.tuna.tsinghua.edu.cn/CRAN/')
```

> [CRAN Mirrors](https://cran.r-project.org/mirrors.html)

## Package 包

- 包是R函数、数据、预编译代码以一种定义完善的格式组成的集合。
- `.libPaths()`能够显示库所在的位置
- `library()`则可以显示库中有哪些包
- `search()`可以告诉你哪些包已加载并可使用
- `install.packages("package_name")` 安装一个包
- `install.packages()` 不加参数，显示一个CRAN镜像站点的列表
- `update.packages()` 可以更新已经安装的包
- `installed. packages()` 列出安装的包,以及它们的版本号、依赖关系等信息
- `library("package_name")` 命令载入包
- `help(package="package_name")` 可以输出某个包的简短描述以及包中的函数名称和数据集名称的列表
