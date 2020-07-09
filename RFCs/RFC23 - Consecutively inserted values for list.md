RFC23: Consecutively inserted values for list
=============================================

- 提出时间: 2019-05-03
- 最后更新: 2019-08-25
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
