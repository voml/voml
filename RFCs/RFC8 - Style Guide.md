RFC8: Style Guide for Arc
=========================

## Motivation



## Design


| Order            | Default | Details                    | Type               |
| :--------------- | :------ | :------------------------- | :----------------- |
| `@scope-line`    | 2       | Scope 之间的间隔的空行数   | integer            |
| `@align-comment` | true    | 是否对齐单行注释           | boolean            |
| `@align-macro`   | false   | 是否对齐宏                 | boolean            |
| `@align-assign`  | false   | 是否对齐绑定               | boolean            |
| `@record-op`     | "="     | KeyValue 使用的符号        | boolean            |
| `@record-eos`    | false   | Record 末尾使用的 EOS      | [`false`/`;`/ `,`] |
| `@list-eos`      | ","     | List 值末尾使用的 EOS      | [`false`/`;`/ `,`] |
| `@dict-eos`      | ","     | Dict 值末尾使用的 EOS      | [`false`/`;`/ `,`] |
| `@list-end`      | true    | 是否需要最后元素末尾的 EOS | boolean            |
| `@dict-end`      | true    | 是否需要最后元素末尾的 EOS | boolean            |
