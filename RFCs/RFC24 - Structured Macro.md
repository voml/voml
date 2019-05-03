RFC3: Structured Macro
======================

- 提出时间: 2019-04-25
- 当前状态: 被否决

## Motivation

Macro 作为一等公民.

可以指定结构化的展开方式.


## Design

### Macro Key Bind

Macro 可以写在键上

```arc
path/key@macro = `raw`
```

效果等同于

```arc
path/key = @macro`raw`
```

### Macro Scope Bind

域可以指定 macro 展开

```arc
(path/scope@macro)

<path/scope@macro>
```

最终效果等同于展开完之后作用于整个结构.

## Rejected

引入了额外的解析分支

是否考虑更广义的key-attr


ListScope 中作用于每个元素还是整个列表元素?
