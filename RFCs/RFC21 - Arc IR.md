RFC21: Arc Intermediate Representation
======================================

- 提出时间: 2019-04-20
- 当前状态: 已采纳

## Motivation

定义一种等价的 IR 表示.

以便 Debug 与 Optimization.

## Design

Arc IR 由 task 构成一个 stack.

task 是一个带 task 字段的对象.

### Insert
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

于是 Scope 直接用 path 列表拼接即可.

### Macro

```text
a = @some`value`
```

```js
module.exports = [
    {
        task: 'macro',
        path: ['a'],
        with: "some"
        data: "value",
    }
]
```

构建完整个 stack 之后执行 macro expand.

查询 `text: "some"` 对应的 `someHandler` 是否定义, 没有的话用 defaultHandler.

传入 `data: "value"`, 并删除自身.

- Safe 模式

默认情况下, 所有宏任务会先从 stack 移除并缓存执行.

宏不可以访问别的宏的路径.

- Unsafe 模式

使用 `--unsafe` 参数之后, 宏不会被移除还是留在 stack 中.

也就是说先执行的宏可以变动后执行的宏.

### Reference

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

最后删除 from 指向的路径 `from: ['a']` 以及自身.

```js
module.exports = [
    {
        task: 'insert',
        path: ['a', 'a'],
        data: '$a'
    }
]
```

