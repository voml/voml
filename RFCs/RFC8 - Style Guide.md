RFC8: Style Guide for Arc
=========================

## Motivation

为了更好将压缩文件格式化, 需要一个格式化标准

也可以统一代码风格, 统一审美, 增强可读性

## Design

| Order            | Type                   | Default | Details                    |
| :--------------- | :--------------------- | :------ | :------------------------- |
| `@scope-line`    | integer                | 2       | Scope 之间间隔的空行数     |
| `@indent-space`  | integer                | 4       | 缩进使用的空格数           |
| `@align-comment` | boolean                | true    | 是否对齐单行注释           |
| `@align-macro`   | boolean                | false   | 是否对齐宏                 |
| `@align-assign`  | boolean                | false   | 是否对齐绑定               |
| `@record-op`     | [`"="`/`":"`]          | "="     | Record 的绑定符号          |
| `@record-eos`    | [`false`/`";"`/ `","`] | false   | Record 末尾使用的 EOS      |
| `@list-eos`      | [`false`/`";"`/ `","`] | ","     | List 值末尾使用的 EOS      |
| `@dict-eos`      | [`false`/`";"`/ `","`] | ","     | Dict 值末尾使用的 EOS      |
| `@list-end`      | boolean                | true    | 是否需要最后元素末尾的 EOS |
| `@dict-end`      | boolean                | true    | 是否需要最后元素末尾的 EOS |

- 所有 lint 建议使用 space 而不是 tab.

## Details

### record-eos

### list-eos



### list-end

开启时, 分行情况下, 最后一个元素会加上 EOS

```arc
% - @list-eos = ","
% - @list-end = true
a = [2, 3, 5, 7]
a = [
    2,
    3,
    5,
    7,
]
```
