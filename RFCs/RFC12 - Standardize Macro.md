RFC12: Standardize Macro
========================


## Motivation

标准化宏(Macro)的定义.

## Design

当前剩余的符号有``@`!#^|?``

需要用一个符号标记宏, 另一个符号标记作用域.

考虑如下组合

```text
@macro|raw_text|
!macro`raw_text`
?macro^raw_text^
#macro!raw_text!
```