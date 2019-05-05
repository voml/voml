RFC17: Multiple Parameters Macro
================================

- 1st Amendment on [#RFC12][#12]

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

没有必要增加额外的符号 `` ` `` 来规避转义, 字符串模式已经很好的处理了转义问题.

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

结果为:

```ts
module.exports = {
    t1: {
        key: {
            task: 'error',
            info: 'macro not implement',
            name: 'macro',
            text: '',
        },
        value: 1
    },
    t2: {
        key: {
            task: 'error',
            info: 'macro not implement',
            name: 'macro',
            text: '',
        },
        path: {
            value: 2
        },
    },
    t3: {
        key: {
            task: 'error',
            info: 'macro not implement',
            name: 'macro',
            text: 'raw_text',
        },
        value: 3
    }
}
```

[#12]: ./RFC12%20-%20Standardize%20Macro.md