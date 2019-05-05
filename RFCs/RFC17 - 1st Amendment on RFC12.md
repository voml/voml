RFC17: Multiple Parameters Macro
================================

- 1st Amendment on [#RFC12][#12]
- 提出时间: 2019-05-05
- 当前状态: 已采纳

## Motivation

支持多参数宏, 允许自定义参数, 扩展更灵活.

## Design

允许宏后面跟一个列表.

```text
@a["arg1","arg2"]
```

这样可以嵌入一些其他格式.

```text
json = @data['json', '''
[true, false, null]
''']
```

类似 markdown 的嵌入格式.

```md
``​`json
[true, false, null]
``​`
```

词法改进:

```antlr
macro: At apply = Identifier value = list   # MultipleMacro;
```