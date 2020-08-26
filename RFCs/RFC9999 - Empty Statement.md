RFC9: Empty Statement
=====================

- 提出时间: 2019-04-30
- 当前状态: 已采纳

## Motivation

当前 EOS 有 `;` 和 `,` 两种.

```antlr
empty: eos # EmptyStatement;
```

该规则允许了 `;;,,` 这类用法, 没有任何意义, 视为空声明.

空语义造成了不必要的额外解析负担, 禁止有利于提升可读性.

## Design

移除空语义, 限定 EOS 出现的场合.

不允许在 Scope 后使用 `EOS`

```arc
(dict/scope);  % ❌
<list/scope>,  % ❌
```

禁止 `&` 列举使用 EOS

```arc
<matrix>
& [1, 2, 3],  % ❌
& [4, 5, 6];  % ❌
& [7, 8, 9]   % ✔️
```

只有键值对能使用 EOS.

```arc
a: 1,      % ✔️
b: [ ],    % ✔️
c: { },    % ✔️
d: "json"  % ✔️
```

允许 `*` 列举使用 EOS

```arc
<servers>
* ip = "192.168.0.1",   % ✔️
  pw = "hello";         % ✔️
* ip = "192.168.0.2",,  % ❌
  pw = "goodbye";;      % ❌ 
```
