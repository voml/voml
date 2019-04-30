ARC v0.4.0
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
- [键值对](#user-content-keyvalue-pair)
- [十进制整数](#standard-integer)
- [十进制小数](#standard-decimal)
- [字符串](#standard-string)
- [特殊值](#standard-special-value)
- [引用值](#standard-reference-value)
- [列表](#standard-list)
- [字典](#standard-dict)
