RFC11: Standardize Special Value
================================

## Motivation

标准化一些各种语言中都有的量.


## Design

ARC 中, 值不能是字母, 除非是此处定义的特殊值.

特殊值不区分大小写

| Name     | State | Name            | State | Name  | State |
| :------- | :---- | :-------------- | :---- | :---- | :---- |
| True     | ✔️    | False           | ✔️    |
| Unknown  | ❔     | Undefined       | ❔     |
| Null     | ✔️    | None            | ❔     |
| NaN      | ✔️    |
| Infinity | ✔️    | ComplexInfinity | ❔     |
| Missing  | ❔     | Nothing         | ❌     | Empty | ❌     |

### Boolean Values
True
False
Unknown/Undefined

### Null

null

### None
none/nil

### NaN
IEEE 754

### Infinity
IEEE 754

Infinity
ComplexInfinity


### Missing
missing

### Nothing
nothing/empty
