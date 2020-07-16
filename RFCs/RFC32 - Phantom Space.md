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

覆盖问题

```js
import "file.arc" as root
root = {version: "1.0.0"}
version = $root.version
```

这种情况下

变量会覆盖隐变量


```js
root = {version: "1.0.0"}
import "file.arc" as root
version = $root.version
```


错误

因此 statements 必须在最上方, 禁止隐变量覆盖变量
