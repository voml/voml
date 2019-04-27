RFC5: Arc Intermediate Representation
=====================================


## Motivation

定义一种等价的 IR 表示.

以便 Debug 与 Optimization.


## 指令编码

## Insert


定义 Path 为从 `root` 到 `key` 的一个字符串列表.

```text
a = 1
```



```js
module.exports = [
    {
        task: 'insert',
        path: ['a'],
        data: 1,
    }
]
```


对于数组使用 Shadow Path, 用从 1 开始的自然数表示.

```text
a: [1]
```

```js
module.exports = [
    {
        task: 'insert',
        path: ['a', 1],
        data: 1,
    }
]
```

于是 Scope 直接 path 列表拼接即可.

## Reference

```text
a = $a
```


```js
module.exports = [
    {
        task: 'insert',
        path: ['a'],
        data: '$a'
    },
    {
        task: 'cite',
        from: ['a'],
        to: ['a', 'a'],
    },
]
```

寻找并复制 path 为 `path: ['a']` 的节点

缓存中 path 改为 to 指定的值 `to: ['a', 'a']`

最后删除 from 指向的路径 `from: ['a']`.

```js
module.exports = [
    {
        task: 'insert',
        path: ['a', 'a'],
        data: '$a'
    }
]
```
