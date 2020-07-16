RFC9999: Inheritance of Dict Scope
==================================
![](https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square)

- 提出时间: 2020-07-15
- 最后修改: 2020-07-16

## Motivation

简化超长超深路径的输入

## Design

### Simple Inheritance

在开头使用 `.`, 表示继承父级的路由

```ini
[root]
  [.dict]
  v = true
  <.list>
  & null

# which equivalent to:
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

当有多个 `.` 起始时, 表示继承次一级的域

```ini
[root]
  [.dict]
  v = true
    <..list>
    & null

# which equivalent to:
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

## Irregular Matters

### Empty inheritance field

继承域不能是空的, 考虑如下构造

```ini
# warning!
[a]
  <.b>
  c = 1
```

`<.b>` 发现没有匹配于是变成空列表, 下面的 `c = 1` 挂载在 `[a]` 下.

解析结果如下, 这不符合直观感受.

```js
module.exports = {
    a: {
        b: [ ],
        c: 1
    }
}
```

---

### Illegal inheritance

继承必须逐级增加, 越级继承是非法的, 应该报错

```ini
# error!
[a]
  [..b]
  c = 1
```

