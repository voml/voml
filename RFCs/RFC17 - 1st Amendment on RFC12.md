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

兼容性:

@i[2e7]

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