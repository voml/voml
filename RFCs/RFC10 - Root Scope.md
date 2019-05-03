RFC10: Root Scope
================

## Motivation


## Design


考虑如下数据结构:

```ts
module.exports = {
    a: 1,
    b: {
        c: 1,
    },
    d: 1,
}
```

### Scheme A

使用三个或三个以上的短横表示重新回到 root 作用域.

```text
a = 1
(b)
c = 1
---
d = 1
```

### Scheme B

使用空 path 表示回到 root 作用域

```text
a = 1
(b)
c = 1
()
d = 1
```
