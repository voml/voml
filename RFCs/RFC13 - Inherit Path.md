RFC13: Inherit Path
===================


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
