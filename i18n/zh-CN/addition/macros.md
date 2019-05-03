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

## 数值字面量

- 浮点数: `@f8, @f16, @f32, @f64, @f128`

**IEEE 754 所规定的浮点数!**

- 无符号: `@u8, @u16, @u32, @u64, @u128`

- 整数: `@i8, @i16, @i32, @i64, @i128`

- 十六进制: `@h`

- 八进制: `@o`

- 二进制: `@b`


## DateTime
- `d, date, DateTime`

```py
@d`1926:08:17`
```

坐标日期时刻


要准确地表示世上的一个特定时间，你可以使用指定了时区偏移量的 [RFC 3339](http://tools.ietf.org/html/rfc3339) 格式的日期时刻。

```toml
odt1 = 1979-05-27T07:32:00Z
odt2 = 1979-05-27T00:32:00-07:00
odt3 = 1979-05-27T00:32:00.999999-07:00
```

出于可读性的目的，你可以用空格替代日期和时刻中间的 T（RFC 3339 的第 5.6 节中允许了这样做）。

```toml
odt4 = 1979-05-27 07:32:00Z
```

小数秒的精度取决于实现，但至少应当能够精确到毫秒。  
如果它的值超出了实现所支持的精度，那多余的部分必须被舍弃，而不能四舍五入。

各地日期时刻

如果你省略了 [RFC 3339](http://tools.ietf.org/html/rfc3339) 日期时刻中的时区偏移量，这表示该日期时刻的使用并不涉及时区偏移。  
在没有其它信息的情况下，并不知道它究竟该被转化成世上的哪一刻。  
如果仍被要求转化，那结果将取决于实现。

```toml
ldt1 = 1979-05-27T07:32:00
ldt2 = 1979-05-27T00:32:00.999999
```

小数秒的精度取决于实现，但至少应当能够精确到毫秒。  
如果它的值超出了实现所支持的精度，那多余的部分必须被舍弃，而不能四舍五入。

各地日期

如果你只写了 [RFC 3339](http://tools.ietf.org/html/rfc3339) 日期时刻中的日期部分，那它表示一整天，同时也不涉及时区偏移。

```toml
ld1 = 1979-05-27
```

各地时刻

如果你只写了 [RFC 3339](http://tools.ietf.org/html/rfc3339) 日期时刻中的时刻部分，它将只表示一天之中的那个时刻，而与任何特定的日期无关、亦不涉及时区偏移。

```toml
lt1 = 07:32:00
lt2 = 00:32:00.999999
```

小数秒的精度取决于实现，但至少应当能够精确到毫秒。  
如果它的值超出了实现所支持的精度，那多余的部分必须被舍弃，而不能四舍五入。

## RegularExpression
- `re, regex, RegularExpression`

```py
@re``
```





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

## Quantity
- `Quantity`

物理量

```py
@q`5 cm`
```

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

