RFC6: Default Export
====================

- 提出时间: 2019-04-20
- 当前状态: 已采纳

## Motivation

进一步支持 `json` 文件, 包括字典和列表.

## Related

- [#RFC1](RFC1%20-%20JSON%20Compatible.md): 提升 json 兼容性

## Design

如果文件的第一个有效字符是 `{` 或 `[`, 则认为这是 json 格式.

添加指令 `--default ${key}`, `key` 表示整个对象要绑定的键名