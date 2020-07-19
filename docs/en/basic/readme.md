ARC Language
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



键值对<a id="standard-record">&nbsp;</a>
------------------------------------------------------------------------------------------------------------------------

> ARC 被设计成可以无歧义地映射为哈希表

因此 ARC 最基本的构成单元是键值对(Record)

**只需把 json 开头末尾的 `{ }` 对删除就可以得到合法的 `arc` 文件!**

键名在等号的左边而值在右边, 键名和键值周围的空白会被忽略。

可以使用 js 风格的 `:`, 也可以使用 py 风格的 `=`.

### Advance

左边不需要加引号, 除非包含 `/` 与空格换行等, 或者由纯数字构成.

`/` 用于分割 KeyPath, `/` 两边的空格会被无视.

```toml
root/key = 1
```

等价于:

```ts
module.exports = {
    root : {
        key: 1
    }
}
```

#### 最佳实践
- 使用等号分隔键值对
- 等号两边使用一个空格分割
- 末尾不加任何符号
- `/` 两边不加空格



