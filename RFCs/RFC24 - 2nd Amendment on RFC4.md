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