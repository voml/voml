# 局部化 DSL

用 @macro"""DSL""" 或 @macro(DSL) 标记局部化 DSL.

在目标语言中反序列化成相应的 Object

目标语言需自定义 handler, 若解析失败, 那么返回如下结构体:

{
    "type": "DataTime"
    "data": ""
    "error": "not impl"
}


以下为建议命名:





# Level A 
![Standarded](https://img.shields.io/badge/Stage-Standarded-success.svg?style=flat-square)

在所有主流语言中都有对应的数据结构, 推荐所有的语言实现标准解析.







# Level B
![Recommended](https://img.shields.io/badge/Stage-Recommended-informational.svg?style=flat-square)

非常常用的数据结构, 作为可选项存在, 推荐所有的语言实现一定的解析.

此阶段会被分配到一个简称, 其他自定义名称不得冲突.

## UnixTime
- `t, time, UnixTime`


@t



# Level C
![Experiment](https://img.shields.io/badge/Stage-Experiment-important.svg?style=flat-square)

实验阶段, 此阶段会被分配到全称, 要求所有的语言遵守, 其他自定义名称不得冲突


## Matrix
- `Matrix`

```py
@m'''
1,2,3;
4,5,6;
7,8,9;
'''
```

# Level D
![Controversy](https://img.shields.io/badge/Stage-Controversy-critical.svg?style=flat-square)

讨论阶段, 不分配任何名称, 名称为暂定名称

## StringTemplate

字符串模板

## Expression

数学表达式

## 编程语言

嵌入式的一段代码, 由编程语言全程指定.

# Level E 
![Proposal](https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square)

草案阶段, 阐述数据结构的定义以及用途, 名称从长避免冲突.

