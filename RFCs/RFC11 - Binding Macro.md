RFC11: Binding Macro
====================

## Motivation


由于不同的语言允许的特殊符号不同, 为了兼容考虑宏的模式只能由英文字母组成, 也就是 `[@][a-zA-Z]+`.

## Reference

![RFC3: Structured Macro](./RFC3 - Structured Macro.md)

## Design

```arc
key@macro = 'raw-value'
```

表示将右边的输入交给左边的 Handler.

此特性有助于

```arc
key@List  = [1, "2", "2"]
key@Tuple = [1, 2, 2]
key@Set   = [1, 2, 3]
```


考虑不同的符号

```text
key~Set = [1, 2, 3]
key@Set = [1, 2, 3]
key#Set = [1, 2, 3]
key^Set = [1, 2, 3]
key&Set = [1, 2, 3]
key*Set = [1, 2, 3]
key?Set = [1, 2, 3]
```
