RFC13: Inherit Scope
====================


## Motivation


## Design


```text
(a)
(/b)
c = true
```

等价于

```ts
module.exports = {
    a: {
        b: {
            c: true
        }
    }
}
```


Inherit Scope 不能是空的, 考虑如下构造

```text
(a)
</b>
c=1
```

若允许空, `</b>` 发现没有匹配于是变成空列表, 下面的 `c = 1` 挂载在 `(a)` 下就不会报错.

这不符合读者直接感受.

禁止以后报错, 要求添加 &

