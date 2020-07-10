Routing & Scope
===============

## allow

域分为列表域和字典域:

- 被 `< >` 包围的是字典域
- 被 `[ ]` 包围的是列表域

scope 等价于 key, key 不能添加类型注解, 只有 value 才有类型注解.

<a>

### dict 


```ini
[dict]
a = true
b = false
list = (1, 2, 3)
```

### list 

```ini
<list>
* 1
* 2
^ a = true
  b = false
```

### inheritance

域有继承关系


```ini
[first]
[.second]
```

## warning

- 使用多余的空格

```ini
< a.b>
<a .b>
```

- 使用多余的字符串

```ini
<a."b".c>
```

## error

- 尝试继承列表域

```ini
<father>
<.node>
```



