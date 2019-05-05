RFC17: Multiple Parameters Macro
================================

- 1st Amendment on RFC12

## Design

废弃以下语法:

```antlr
macro       : At apply = Identifier MacroEscape
MacroEscape : E ('\\' [`] | ~[`])+? E;
fragment E  : '`';
```

改为

```antlr
macro
    : At apply = Identifier value = string # SimpleMacro
    | At apply = Identifier value = list   # MultipleMacro;
```





## Compatibility:

旧写法 `` @macro`raw_text` `` 被废弃.

考虑如下可能歧义, 均能正确解析:

```arc
(t1)
key = @macro
"value" = 1

(t2)
key = @macro
"path"/value = 2

(t3)
key = @macro
"raw_text"value = 3
```