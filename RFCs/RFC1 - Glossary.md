RFC25: Glossary
===============
![](https://img.shields.io/badge/Stage-Complement-informational.svg?style=flat-square)

- 提出时间: 2019-05-04
- 最后修改: 2019-05-04

## Motivation

统一术语的使用.

## Design

### Word List

#### 原子(Atom)

不可分割的最小单位, 包括数值, 特殊值, 字符串.

#### 键(Key)

`key = value` 左边的部分, 存值的编号.

#### 路由(Routing)
`root/key` 这个整体

#### 值(Value)

#### 记录(Record)
也叫键值对(Key-Value Pair)

#### 字典(Dict)

储存记录的结构体

#### 列表(List)

储存值的结构体

#### 引用(Reference)
也叫援引(Cite), 指向一个路由.

#### 宏(Macro)

#### 域(Scope)

### Commit Specification

提交需要用一个符号标记类型以便索引, 当前有以下约定:

| Mark | Remark     |
| :--- | :--------- |
| 🎂   | 项目初始化 |
| 🎮   | 发布正式版 |
| 🌿   | 新 RFC     |
| 💾   | RFCs 修订  |
| 📑   | 文档       |
| 📖   | 翻译       |
| 🔖   | 教程       |
| 🔧   | 语法歧义   |

要且只要一个符号.

### RFC Stages

| Stage | Detail                                      | Mark                    |
| :---- | :------------------------------------------ | :---------------------- |
| 标准  | 已经通过成为标准的提案   | ![Adopted][Adopted]  |
| 待定  | 由于种种因素还未通过的提案   | ![Pending][Pending] |
| 失效  | 被驳回或者失效的提案 | ![Abandoned][Abandoned]  |
| 草案  | 没有经过充分讨论的提案 | ![Proposal][Proposal] |
| 补充  | 与核心语言无关的补充说明   | ![Complement][Complement]    |

### Type Hint Stages

仅有 `Level-S` 的标准级数据结构要求解析器实现, 其他都是可选的.

| Stage | Detail                                      | Mark                    |
| :---- | :------------------------------------------ | :---------------------- |
| 标准  | `Level-S` : 几乎所有的语言中都有的数据结构   | ![Standarded][Macro-S]  |
| 推荐  | `Level-A` : 很多语言中都有, 常用的数据结构   | ![Recommended][Macro-A] |
| 实验  | `Level-B` : 很有用的数据结构                 | ![Experiment][Macro-B]  |
| 讨论  | `Level-C` : 该数据结构的用途及普适性有待考量 | ![Controversy][Macro-C] |
| 草案  | `Level-D` : 某种语言中有的概念或特殊的结构   | ![Proposal][Macro-D]    |


[Adopted]: https://img.shields.io/badge/Stage-Standarded-success.svg?style=flat-square
[Pending]: https://img.shields.io/badge/Stage-Experiment-important.svg?style=flat-square
[Abandoned]: https://img.shields.io/badge/Stage-Abandoned-critical.svg?style=flat-square
[Proposal]: https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square
[Complement]: https://img.shields.io/badge/Stage-Complement-informational.svg?style=flat-square

[Macro-S]: https://img.shields.io/badge/Stage-Standarded-success.svg?style=flat-square
[Macro-A]: https://img.shields.io/badge/Stage-Recommended-informational.svg?style=flat-square
[Macro-B]: https://img.shields.io/badge/Stage-Experiment-important.svg?style=flat-square
[Macro-C]: https://img.shields.io/badge/Stage-Controversy-critical.svg?style=flat-square
[Macro-D]: https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square
