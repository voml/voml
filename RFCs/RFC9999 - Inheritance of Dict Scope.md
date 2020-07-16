RFC9999: Inheritance of Dict Scope
==================================
![](https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square)

- 提出时间: 2020-07-15
- 最后修改: 2020-07-16

## Motivation

简化超长超深路径的输入


## Design

### Simple Inheritance

在开头使用 `.`, 表示继承父级的名称

```ini
[root]
  [.dict]
  v = true
  <.list>
  & null
```

等价于

```ini
[root.dict]
v = true
<root.list>
& null
```

展开即为

```js
module.exports = {
    root: {
        dict: { v: true },
        list: [null]
    }
}
```

### Nest Inheritance

当有多个 `.` 起始时, 

```ini
[root]
  [.dict]
  v = true
    <..list>
    & null
```

等价于

```ini
[root.dict]
v = true
<root.dict.list>
& null
```

展开即为

```js
module.exports = {
    root: {
        dict: {
            v: true,
            list: [null]
        },
    }
}
```

### Prohibited Matters

Inherit Scope 不能是空的, 考虑如下构造

```ini
[a]
  <.b>
  c = 1
```

若允许空, `<.b>` 发现没有匹配于是变成空列表, 下面的 `c = 1` 挂载在 `[a]` 下就不会报错.

解析结果如下, 这不符合直观感受.

```ts
module.exports = {
    a: {
        b: [ ],
        c: 1
    }
}
```

禁止继承空声明以后报错, 要求添加 `&`

---

非法继承

```ini
[a]
  [..b]
  c = 1
```

