RFC18 - Standardize List
========================

- 提出时间: 2019-04-20
- 最后更新: 2020-07-09
- 当前状态: 已采纳

## Motivation

标准化列表(List)语义.

## Relation

- [#RFC1: JSON Compatible][#1]: 采纳
- [#RFC5: Inherit Scope][#5]: 采纳
- [#RFC23: 1st Amendment][#23]: 采纳
- [#RFC24: 2nd Amendment][#24]: 否决


## Design

由 `( )` 包裹表示一个列表

### Default

list 的默认值为空列表

```
default = ()
```


列表中元素可以为任意类型

```
list1 = (1, 2, 3)
list2 = ("a", "b", "c")
```


列表中元素不必为相同类型



列表元素可以使用 `,` 或 `;` 或者 ` ` 分割






[#1]: ./RFC1%20-%20JSON%20Compatible.md
[#5]: ./RFC5%20-%20Inherit%20Scope.md
[#23]: ./RFC23%20-%201st%20Amendment%20on%20RFC4.md
[#24]: ./RFC24%20-%202nd%20Amendment%20on%20RFC4.md
