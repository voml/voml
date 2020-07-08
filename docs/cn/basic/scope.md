# Scope

## allow

域分为列表域和字典域:

- 被 `< >` 包围的是字典域
- 被 `[ ]` 包围的是列表域

scope 等价于 key, key 不能添加类型注解, 只有 value 才有类型注解.

<a>

## dict 


```
[dict]
a = true
b = false
list = (1, 2, 3)
```

## list 

```
<list>
* 1
* 2
^ a = true
  b = false
```

## 

域有继承关系

<first>
<.second>


## warning

- 不要在路由里使用多余的空格

```
< a.b>
```

## deny



