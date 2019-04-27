RFC5: Arc IR
============


定义一种等价的 IR 表示.


## Insert


定义 Path 为从 `root1` 到

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
