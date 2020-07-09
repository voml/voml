RFC18 - Standardize List
========================

- 提出时间: 2019-04-20
- 当前状态: 已采纳

## Motivation

标准化列表(List)语义.

## Relation

- [#RFC1: JSON Compatible][#1]: 采纳
- [#RFC5: Inherit Scope][#5]: 采纳
- [#RFC23: 1st Amendment][#23]: 采纳
- [#RFC24: 2nd Amendment][#24]: 否决


## Design

由



`[ ]`


First Amendment


RFC23: First Amendment on RFC4
==============================

- 提出时间: 2019-05-03
- 当前状态: 已采纳

## Motivation

简化列表输入

## Design

原语义: `&` 表示插入一个值.

```antlr
group: '&' data # DataGroup ;
```

新语义: `&` 表示切换值捕捉模式, 将接下来的值都捕捉进列表, 直到模式切换或域切换.

```antlr
group: '&' data+ # DataGroup ;
```

## Advantages

原来每一项都要写出 `&`

```arc
<fruits>
* class = 3
  sales = 128
& "Apple"
& "Banana"
& "Cherry"
```

现在只需要写一个 `&` 表示模式切换

```arc
<fruits>
* class = 3
  sales = 128
& "Apple"
  "Banana"
  "Cherry"
```

## Compatibility

兼容原语法

RFC23: First Amendment on RFC4
==============================

- 提出时间: 2019-05-03
- 当前状态: 已否决

## Motivation

简化列表输入

## Design

原语义, 需要 `&` 切换值捕捉模式.

```antlr
group: '&' data+ # DataGroup ;
```

新语义, 列表域默认值捕捉模式

```antlr
group: '&'? data+ # DataGroup ;
```

## Advantages

优点是如果一个列表域由纯值构成, 则不需要写任何模式切换符号.


原写法

```arc
<fruits>& 
"Apple"
"Banana"
"Cherry"
<lint/trailing-comma>
& true
* multiline = "always"
  singleline = "never"
```

新写法

```arc
<fruits>
"Apple"
"Banana"
"Cherry"
<lint/trailing-comma> true
* multiline = "always"
  singleline = "never"
```

## Veto Reasons

否决原因如下:

出现非法预期, 考虑如下构造:

```arc
<a>
  [1,2,3]
  [4,5,6]
* b = true
  c = false
  [7 8 9]
  d = null
```

预期行为, 报错, 要求添加 `&` 以及 `*`.

实际行为, 解析为:

```ts
module.exports = {
    a: [
        [1, 2, 3],
        [4, 5, 6],
        {
            b: true,
            c: false,
        },
        [7, 8, 9],
    ],
    d: null,
}
```

原因, 解析器发现模式不匹配, 隐式切换了作用域.

解决这个需要增加一条特殊匹配规则, 太麻烦了.

此种情况, 建议使用列表字面量 `[ ]` 表示, 代价不过是多一层缩进.

况且新写法也太过古怪了...




[#1]: ./RFC1%20-%20JSON%20Compatible.md
[#5]: ./RFC5%20-%20Inherit%20Scope.md
[#23]: ./RFC23%20-%201st%20Amendment%20on%20RFC4.md
[#24]: ./RFC24%20-%202nd%20Amendment%20on%20RFC4.md
