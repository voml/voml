RFC9999: Inheritance of List Scope
==================================
![](https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square)

- 提出时间: 2020-07-15
- 最后修改: 2020-07-16

## Motivation

简化超长超深路径的输入

## Design

### Simple Inheritance

在开头使用 `.`, 表示继承父级的路由

```arc
<root>
  [.0]
  v = true
  <.1>
  & null

# which equivalent to:
[root]
* v = true
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

```arc
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

### Skipped index inheritance

继承域不能是空的, 考虑如下构造

```arc
# warning!
<root>
  [.0]
  path = "root.0.path"
  [.2]
  path = "root.2.path"
```

解析结果如下:

```js
module.exports = {
    root: [
        { path: "root.0.path" },
        null,
        { path: "root.2.path" }
    ]
}
```

---

### Illegal inheritance

继承必须逐级增加, 越级继承是非法的, 应该报错

```arc
# error!
<a>
  [..b]
  c = 1
```



