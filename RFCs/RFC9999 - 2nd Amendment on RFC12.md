RFC18: Binding Macro
====================

- [2nd Amendment on RFC12][#12]
- 提出时间: 2019-05-05
- 当前状态: 已采纳

## Motivation

废弃 `` ` ``, 统一宏的用法.

## Design

### Part I

废弃以下语法:

```antlr
macro       : At apply = Identifier MacroEscape
MacroEscape : E ('\\' [`] | ~[`])+? E;
fragment E  : '`';
```

改为

```antlr
macro: At apply = Identifier value = string # SimpleMacro;
```

没有必要增加额外的符号 `` ` `` 来规避转义, 字符串模式已经很好的处理了转义问题.

### Part II

如果不带任何参数, 则为空声明, 表示该宏不需要参数.

考虑如下可能歧义, 均能正确解析:

```toml
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

### Part III

由于可能的歧义, 不进一步将宏扩展至字符串和列表以外的情况.

使用字符串以后, 相当于对键绑定一个事件.

可以进一步推广到键的左边

```toml
address = @ip'192.168.0.1'
```

等价于 

```toml
address@ip = '192.168.0.1'
```

[#12]: ./RFC12%20-%20Standardize%20Macro.md