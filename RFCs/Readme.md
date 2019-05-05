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
| :---- | :------------------------------------- | :---: | :--------------- |
| 1     | [JSON Compatible][#1]                  |  ✔️   |                  |
| 2     | [Root Scope][#2]                       |       | 推迟             |
| 3     | [Standardize Dict][#3]                 |  ✔️   |                  |
| 4     | [Standardize List][#4]                 |  ✔️   |                  |
| 5     | [Inherit Scope][#5]                    |  ✔️   |                  |
| 6     | [Default Export][#6]                   |  ✔️️  |                  |
| 7     | [Resolve Options for Arc][#7]          |   ➕   | 规范             |
| 8     | [Style Guide for Arc][#8]              |   ➕   | 规范             |
| 9     | [Empty Statement][#9]                  |  ✔️️  |                  |
| 10    | [Standardize Reference][#10]           |  ✔️️  |                  |
| 11    | [Standardize Special Value][#11]       |  ✔️️  |                  |
| 12    | [Standardize Macro][#12]               |  ✔️️  |                  |
| 13    | [Standardize Number][#13]              |  ✔️️  |                  |
| 14    | [Exponent][#14]                        |       | 推迟             |
| 15    | [Character Escape][#15]                |       | ❔ Stage-1        |
| 16    | [Multiline String][#16]                |       | ❔ Stage-1        |
| 17    | [Multiple Parameters Macro][#17]       |  ✔️️  |                  |
| 18    | [Binding Macro][#18]                   |  ✔️️  | ❔ Stage-1        |
| 19    | [Structured Macro][#19]                |  ✔️️  | ❔ Stage-1        |
| 20    | [Shadow Path][#20]                     |  ✔️️  |                  |
| 21    | [Arc Intermediate Representation][#21] |   ❕   | 语义无关         |
| 22    | [Calculation Order][#22]               |   ❕   | 语义无关         |
| 23    | [1st Amendment on RFC4][#23]           |  ✔️️  |                  |
| 24    | [2nd Amendment on RFC4][#24]           |   ❌   |                  |
| 25    | [Glossary][#25]                        |  🎓   | 语义无关         |
| 26    |                                        |       |                  |
| 27    |                                        |       |                  |
| 28    |
| 29    |
| 30    |
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
[#17]: ./RFC17%20-%201st%20Amendment%20on%20RFC12.md
[#18]: ./RFC18%20-%202nd%20Amendment%20on%20RFC12.md
[#19]: ./RFC19%20-%203rd%20Amendment%20on%20RFC12.md
[#20]: ./RFC20%20-%20Shadow%20Path.md
[#21]: ./RFC21%20-%20Arc%20IR.md
[#22]: ./RFC22%20-%20Calculation%20Order.md
[#23]: ./RFC23%20-%201st%20Amendment%20on%20RFC4.md
[#24]: ./RFC24%20-%202nd%20Amendment%20on%20RFC4.md
[#25]: ./RFC25%20-%20Glossary.md
[#26]: ./RFC26%20-%20Numerical%20Macros.md
[#27]: ./RFC27%20-%20DateTime%20Macros.md
[#28]: ./RFC28%20-%20Regex%20Macros.md
[#29]: ./RFC29%20-%20Quantity%20Macros.md
[#30]: ./RFC30%20-%201st%20Amendment%20on%20RFC5.md
[#31]: ./RFC31%20-%201st%20Amendment%20on%20RFC10.md
[#32]: ./RFC32%20-%20Include%20Macros.md
[#33]: ./RFC33%20-%20Import%20Macros.md