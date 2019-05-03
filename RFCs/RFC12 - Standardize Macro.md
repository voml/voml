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
`macro!raw_text`
^raw_text?macro^
#macro!raw_text!
```

考虑 macro 前置还是后置, 外置还是内置.

raw_text 用什么分割, 使用成对括号还是相同符号.

或者考虑使用 Rust 的方式, `macro!(raw_text)` 或者 `#[some_attribute]`.

这样很难解析, 还是需要一个前置引导符.