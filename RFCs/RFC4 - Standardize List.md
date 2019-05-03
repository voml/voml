RFC4 - List Nested Scope
========================

- 提出时间: 2019-04-20
- 当前状态: 已采纳

## Motivation
Scope 作为一等公民, 需要允许被嵌入字典中.

## Design

出现歧义

```arc
<a>
& [1,2,3]
  [4,5,6]
* b = true
  c = false
  [7 8 9]
  d = null
```