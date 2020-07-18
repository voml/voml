Arc's Request for Comments
==========================

## States

- 已接受: 该特性已被接受并生效(✔️).
- 可追加: 该特性已被接受且可追加条例(➕).
- 可选的: 该特性是否实现由作者自行决定(❕).
- 讨论中: 该特性正在讨论细化中(❔).
- 已否决: 该特性已被否决或覆盖(❌).
- 不相关: 该特性和解析器没有关系(🎓).


## RFCs List

| RFCs  | Name                                   | State | Remark           |
|:------|:---------------------------------------|:-----:|:-----------------|
| 1     | [Glossary][#1]                  |  ✔️   |                  |
| 2     | [JSON Compatible][#2]                       |       | 推迟               |
| 3     | [Routing][#3]                 |  ✔️   |                  |
| 4     | [Shadow Routing][#4]                 |  ✔️   |                  |
| 5     | [Arc Intermediate Representation][#5]                    |  ✔️   |                  |
| 6     | [Import Statement][#6]                   |  ✔️️  |                  |
| 7     | [Phantom Space][#7]          |   ➕   | 规范               |
| 8     | [Style Guide for Arc][#8]              |   ➕   | 规范               |
| 9     | [Typed Arc][#9]                  |  ✔️️  |                  |
| 10    | [Standardize Special Value][#10]           |  ✔️️  |                  |
| 11    | [Standardize Character][#11]       |  ✔️️  |                  |
| 12    | [Standardize String][#12]               |  ✔️️  |                  |
| 13    | [Multiline String][#13]              |  ✔️️  |                  |
| 14    | [Standardize Integer][#14]                        |       | 推迟               |
| 15    | [Standardize Byte][#15]                |       | ❔ Stage-1        |
| 16    | [Standardize Decimal][#16]                |       | ❔ Stage-1        |
| 17    | [Standardize Dict][#17]       |  ✔️️  |                  |
| 18    | [Dict Scope][#18]                   |  ✔️️  | ❔ Stage-1        |
| 19    | [Standardize List][#19]                |  ✔️️  | ❔ Stage-1        |
| 20    | [List Scope][#20]                     |  ✔️️  |                  |
| 21    | [Standardize Reference][#21] |   ❕   | 语义无关             |
| 22    | [Calculation Order][#22]               |   ❕   | 语义无关             |
| 23    | [1st Amendment on RFC4][#23]           |  ✔️️  |                  |
| 24    | [2nd Amendment on RFC4][#24]           |   ❌   |                  |
| 25    | [Glossary][#25]                        |  🎓   | 语义无关             |
| 26    |                                        |       |                  |
| 27    |                                        |       |                  |
| 28    |                                        |       |                  |
| 29    |                                        |       |                  |
| 30    |                                        |       |                  |
| 65535 | -------------------------------------- | ----- | ---------------- |

## Additional Clause

书写等价形式必须使用 ts 模块, 禁止使用 json, yaml, toml 等格式.

## Auxiliary Tools

用如下脚本刷新引用

```mathematica
SetDirectory@NotebookDirectory[];
filter=<|"id"->ToExpression@First@StringSplit[#,{"RFC","-"}],"name"->URLEncode@#|>&;
files=Sort[filter/@FileNames["RFC*"]];
CopyToClipboard@StringRiffle[StringTemplate["[#`id`]: ./`name`"]/@files,"\n"];
```

[#1]: ./RFC1%20-%20Glossary.md
[#2]: ./RFC2%20-%20JSON%20Compatible.md
[#3]: ./RFC3%20-%20Routing.md
[#4]: ./RFC4%20-%20Shadow%20Routing.md
[#5]: ./RFC5%20-%20Arc%20IR.md
[#6]: ./RFC6%20-%20Import%20Statement.md
[#7]: ./RFC7%20-%20Phantom%20Space.md
[#8]: ./RFC8%20-%20Style%20Guide.md
[#9]: ./RFC9%20-%20Typed%20Arc.md
[#10]: ./RFC10%20-%20Standardize%20Special%20Value.md
[#11]: ./RFC11%20-%20Standardize%20Character.md
[#12]: ./RFC12%20-%20Standardize%20String.md
[#13]: ./RFC13%20-%20Multiline%20String.md
[#14]: ./RFC14%20-%20Standardize%20Integer.md
[#15]: ./RFC15%20-%20Standardize%20Byte.md
[#16]: ./RFC16%20-%20Standardize%20Decimal.md
[#17]: ./RFC17%20-%20Standardize%20Dict.md
[#18]: ./RFC18%20-%20Dict%20Scope.md
[#19]: ./RFC19%20-%20Standardize%20List.md
[#20]: ./RFC20%20-%20List%20Scope.md
[#21]: ./RFC21%20-%20Standardize%20Reference.md
[#23]: ./RFC23%20-%20Consecutively%20inserted%20values%20for%20list.md
[#24]: ./RFC24%20-%202nd%20Amendment%20on%20RFC4.md
[#100]: ./RFC100%20-%20Standardize%20Macro.md
[#101]: ./RFC101%20-%20Numerical%20Macros.md
[#102]: ./RFC102%20-%20DateTime%20Macros.md
[#103]: ./RFC103%20-%20Regex%20Macros.md
[#104]: ./RFC104%20-%20Quantity%20Macros.md