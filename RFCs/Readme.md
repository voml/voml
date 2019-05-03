Arc's Request for Comments
==========================

## States

- 已接受: 该特性已被接受并生效(✔️).
- 可追加: 该特性已被接受且可追加条例(➕).
- 可选的: 该特性是否实现由作者自行决定(❕).
- 讨论中: 该特性正在讨论细化中(❔).
- 已否决: 该特性已被否决或覆盖(❌).



## RFCs List

| RFCs  | Name                                            | State | Remark               |
| :---- | :---------------------------------------------- | :---: | :------------------- |
| 1     | [JSON Compatible][#1]                           |  ✔️   |                      |
| 2     | [Root Scope][#2]                                |       | Defer                |
| 3     | [Standardize Dict][#3]                          |  ✔️   |                      |
| 4     | [Standardize List][#4]                          |  ✔️   |                      |
| 5     | [Inherit Scope][#5]                             |  ✔️   |                      |
| 6     | [Default Export][#6]                            |  ✔️️  |                      |
| 7     | [Resolve Options for Arc][#7]                   |   ➕   |                      |
| 8     | [Style Guide for Arc][#8]                       |   ➕   |                      |
| 9     | [Empty Statement][#9]                           |  ✔️️  |                      |
| 10    | [Standardize Reference][#10]                    |  ✔️️  |                      |
| 11    | [Standardize Special Value][#11]                |  ✔️️  |                      |
| 12    | [Standardize Macro][#12]                        |   ❌   | Overrided [#17][#17] |
| 13    | [Standardize Number][#13]                       |  ✔️️  |                      |
| 14    | [Exponent][#14]                                 |       | Defer                |
| 15    | [Character Escape][#15]                         |       | ❔ Stage-1            |
| 16    | [Multiline String][#16]                         |       | ❔ Stage-1            |
| 17    | [Multi-Parameter Macro][#17]                    |       | ❔ Stage-1            |
| 18    | [Binding Macro][#18]                            |       | ❔ Stage-1            |
| 19    | [Structured Macro][#19]                         |       | ❔ Stage-1            |
| 20    | [Shadow Path][#20]                              |  ✔️️  |                      |
| 21    | [Arc Intermediate Representation][#21]          |   ❕   | Non-Standard         |
| 22    | [Calculation Order][#22]                        |   ❕   | Non-Standard         |
| 65535 | ----------------------------------------------- | ----- | ----------------     |



## Auxiliary Tools

用如下脚本刷新引用

```mathematica
SetDirectory@NotebookDirectory[];
filter = <|
	"id" -> ToExpression@First@StringSplit[#, {"RFC", "-"}],
	"name" -> URLEncode@#
|>&;
files = Sort[filter /@ FileNames["RFC*"]];
StringTemplate["[#`id`]: ./`name`"] /@ files // TableForm
```

[#1]: ./RFC1%20-%20JSON%20Compatible.md
[#2]: ./RFC2%20-%20Root%20Scope.md
[#3]: ./RFC3%20-%20Standardize%20Dict.md
[#4]: ./RFC4%20-%20Standardize%20List.md
[#5]: ./RFC5%20-%20Inherit%20Scope.md
[#6]: ./RFC6%20-%20Default%20Export.md
[#7]: ./RFC7%20-%20Resolve%20Options.md
[#8]: ./RFC8%20-%20Style%20Guide.md
[#9]: ./RFC9%20-%20Empty%20Statement.md
[#10]: ./RFC10%20-%20Standardize%20Reference.md
[#11]: ./RFC11%20-%20Standardize%20Special%20Value.md
[#12]: ./RFC12%20-%20Standardize%20Macro.md
[#13]: ./RFC13%20-%20Standardize%20Number.md
[#14]: ./RFC14%20-%20Exponent.md
[#15]: ./RFC15%20-%20Character%20Escape.md
[#16]: ./RFC16%20-%20Multiline%20String.md
[#17]: ./RFC17%20-%20Multi-Parameter%20Macro.md
[#18]: ./RFC18%20-%20Binding%20Macro.md
[#19]: ./RFC19%20-%20Structured%20Macro.md
[#20]: ./RFC20%20-%20Shadow%20Path.md
[#21]: ./RFC21%20-%20Arc%20IR.md
[#22]: ./RFC22%20-%20Calculation%20Order.md
[#25]: ./RFC25%20-%20Glossary.md
[#26]: ./RFC26%20-%20Numerical%20Macros.md

