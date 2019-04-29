RFC8: Style Guide for Arc
=========================

## Motivation



## Design



| Order            | Type               | Default | Details                    |
| :--------------- | :----------------- | :------ | :------------------------- |
| `@scope-line`    | integer            | 2       | Scope 之间的间隔的空行数   |
| `@align-comment` | boolean            | true    | 是否对齐单行注释           |
| `@align-macro`   | boolean            | false   | 是否对齐宏                 |
| `@align-assign`  | boolean            | false   | 是否对齐绑定               |
| `@record-op`     | boolean            | "="     | KeyValue 使用的符号        |
| `@record-eos`    | [`false`/`;`/ `,`] | false   | Record 末尾使用的 EOS      |
| `@list-eos`      | [`false`/`;`/ `,`] | ","     | List 值末尾使用的 EOS      |
| `@dict-eos`      | [`false`/`;`/ `,`] | ","     | Dict 值末尾使用的 EOS      |
| `@list-end`      | boolean            | true    | 是否需要最后元素末尾的 EOS |
| `@dict-end`      | boolean            | true    | 是否需要最后元素末尾的 EOS |

