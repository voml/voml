RFC2: Nested Scope
==================

## Motivation
Scope 作为一等公民, 需要允许被嵌入字典中.

## Design


```text
a: {
	(b)
	c : 0
	<d>
	& [1, 2, 3]
}
```

等价于:

```text
(a/b)
c : 0
<a/d>
& [1, 2, 3]
```