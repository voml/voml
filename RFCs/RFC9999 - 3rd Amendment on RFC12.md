RFC9999: Structured Macro
=======================

- [3rd Amendment on RFC12][#12]
- 提出时间: 2019-05-05
- 当前状态: 已采纳

## Motivation

Macro 作为一等公民, 进一步扩展到 Scope 上.

表示指定结构化的展开方式.

## Design

### Part I

允许宏作用两次.

```text
number@i64 = @exp[2, 10, 5]
```

右边的值先展开, 然后左边的键后展开.

### Part II

当前, 宏不支持叠加, 例如:

```text
number = @i64@exp[2, 10, 5]
```

具体待议, 能叠加会增加复杂度, 不能叠加会违反 Macro 作为一等公民的声明.

### Part III

域可以指定 macro 展开

```text
(path/scope@macro)

<path/scope@macro>
```

最终效果等同于展开完之后作用于整个结构.

因为域也是键的一种.

### Part IV

是否要使用不同的符号?

考虑如下不同的符号:

```text
key~Set = [1, 2, 3]
key@Set = [1, 2, 3]
key#Set = [1, 2, 3]
key^Set = [1, 2, 3]
key&Set = [1, 2, 3]
key*Set = [1, 2, 3]
key?Set = [1, 2, 3]
```

## Guide

由于不同的语言允许的特殊符号不同, 为了兼容考虑, 建议宏的模式只由英文字母组成 `[@][a-zA-Z]+`.

使用所有符号仍是合法的, 但是很可能造成语言之间的迁移问题的话.

将宏分类为两种, 以下为建议命名法:

- 数据类型: `[@][a-z][a-zA-Z]*`.
- 数据容器: `[@][A-Z][a-zA-Z]*`.

```text
key@DataContainer = @dataType'raw-value'
```

表示将右边的输入交给左边的 Handler.

此特性有助于语言的反射特性实现

```text
key@List  = [1, "2", "2"]
key@Tuple = [1, 2, 2]
key@Set   = [1, 2, 3]
```

[#12]: ./RFC12%20-%20Standardize%20Macro.md
