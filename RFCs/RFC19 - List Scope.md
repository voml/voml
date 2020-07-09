RFC19: List Scope
=================



`< >` 开启列表域


```
<list>
* 0
* "string"
* null
```


```js
module.exports = {
    list: [0, "string", null]
}
```


```
<list>
^ a = 1
  b = 2
^ c = 3
```

```js
module.exports = {
    list: [
        { a: 1, b: 2 },
        { c: 3 }
    ]
}
```


```
<list>
^ a = 1
  b = 2
* "string"
```

```js
module.exports = {
    list: [
        { a: 1, b: 2 },
        "string"
    ]
}
```

允许但不推荐 [RFC23]()

```
<list>
^ a = 1
  b = 2
* "string"
  null
```

```js
module.exports = {
    list: [
        { a: 1, b: 2 },
        "string",
        null
    ]
}
```


