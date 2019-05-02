ARC lastest
========================================================================================================================
*Arc Readable Configuration*

Purpose
------------------------------------------------------------------------------------------------------------------------

- ARC is a readable serialization format that can be used as a configuration file and log file
- ARC can be unambiguously mapped to a hash table, and other languages can easily parse out the encapsulated data structure.
- ARC is designed to be compressed into a single line, which means that line breaks and spaces are indifferent.

Table of Contents
------------------------------------------------------------------------------------------------------------------------
1. [Comment](#standard-comment)
2. [Key-Value Pair](#standard-record)
3. [String](#standard-string)
4. [Special-Value](#standard-special-value)
5. [Reference-Value](#standard-reference-value)
6. [Macro](#standard-macro)
7. [Number](#standard-number)
8. [Dictionary](#standard-dict)
9. [List](#standard-list)
- [Additional](./addition.md)



注释 <a id="standard-comment">&nbsp;</a>
------------------------------------------------------------------------------------------------------------------------

百分号 (Percent Sign) 会将该行余下的部分标记为注释

```md
% 这是一个单行注释, 没有特殊效果

%%% 这是多行注释
*这里高亮 markdown 语法*
**可以设置 meta 信息**
*`$` 用来表示唯一属性*
- $version = '1.0'
- $md5 = '5C8607DF825EB982'
*`@` 用来表示可变属性*
- @align-comment = true
- @empty-line = 2
**Arc 在注释中 lint 自身**
%%%
```

ARC 中使用 `,` 以及 `;` 作为 eos 分隔符, 这两者是等价的.

出现大于一个 eos 表示空声明, 没有任何作用.
