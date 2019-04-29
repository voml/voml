ARC v0.2.0
===========
*Arc means Readable Configuration*

Purpose
-------

- ARC 是一种可读的序列化格式, 可以作为配置文件和日志文件
- ARC 可以无歧义地映射为哈希表, 其他语言能很容易的解析出封装的数据结构.
- ARC 被设计成能压缩成单行, 也就是说换行和空格是无所谓的.

Table of Contents
-----------------
- [注释](#standard-comment)
- [列表](#standard-list)
- [字典](#standard-dict)
- [键值对](#user-content-keyvalue-pair)
- [字符串](#standard-string)

[注释](#standard-comment)<a id="standard-comment">&nbsp;</a>
------------------------------------------------------------

井字符（Hash Symbol）将该行余下的部分标记为注释。

% 这是一个单行注释
%%% 这是多行注释 %%%

[十进制整数](#standard-integer)<a id="standard-integer">&nbsp;</a>
-----------------------------------------------------------------

- `十进制整数`有数字, 下划线以及加减号组成, 对应类型为大整数.
- 负数的前缀是减号, 正数可以有加号前缀.
- 整数值 `-0` 与 `+0` 是有效的, 并等同于无前缀的零。

