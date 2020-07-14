RFC1: JSON Compatible
=====================
![](https://img.shields.io/badge/State-Adopted-success.svg?style=flat-square)

- 提出时间: 2019-04-15
- 最后修改: 2020-07-15

## Motivation

JSON 是一种广泛采用的数据格式, 如果能几乎不加改动的使用就能获得不错的群众基础.

ARC 必须被解析为 Hashmap, 所以最小化改动就是去掉首尾的 `{ }`.

同时一个 JSON 片段应该预期能无修改的直接插入 ARC 文件中.

### Related

- [#RFC31](RFC31%20-%20Import%20Statement.md): 允许直接导入一个 json 文件.

## Design

### Assign 兼容
新增 `:`, 作为 `=` 的同义词存在.

两者皆可标定键值对, 且可互换.

### EOS 兼容
新增 `,`, 作为 `;` 的同义词存在.

两者都可以用作分割符, 且可互换.

### Array 兼容

List 的正规文法为 `( )`, 同时兼容 `[ ]`.

相应的 List Scope 从 `[ ]` 改为 `( )`.
