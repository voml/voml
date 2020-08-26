allow

域分为列表域和字典域:

- 被 `< >` 包围的是字典域
- 被 `[ ]` 包围的是列表域

scope 等价于 key, key 不能添加类型注解, 只有 value 才有类型注解.

### dict 


```arc
[dict]
a = true
b = false
list = (1, 2, 3)
```

### list 

```arc
<list>
* 1
* 2
^ a = true
  b = false
```

### inheritance

域有继承关系


```arc
[first]
[.second]
```

## warning

- 使用多余的空格

```arc
[ a.b]
[a .b]
```

- 使用多余的字符串

```arc
[a."b".c]
```

## error

- 域名中带空格或其他非法符号

```arc
[a b.c]
[a:b.c]
```

- 尝试继承列表域

```arc
<father>
<.node>
```



