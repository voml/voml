RFC32: Phantom Space
====================
![](https://img.shields.io/badge/Stage-Proposal-inactive.svg?style=flat-square)

- 提出时间: 2020-07-15
- 最后修改: 2020-07-15

## Motivation
导入一个外部路径

## Design

import "file.arc" as version
version = $root.version

原设计

```js
root = import"./file.arc"
version = $root.version
```

新设计

```js
import "file.arc" as root
version = $root.version
```
