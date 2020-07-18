RFC11: Standardize Special Value
================================

## Motivation

标准化一些各种语言中都有的量.


## Design

ARC 中, 值不能是字母, 除非是此处定义的特殊值.

特殊值不区分大小写

| Name     | State | Name            | State | Name  | State |
|:---------|:------|:----------------|:------|:------|:------|
| True     | ✔️    | False           | ✔️    |       |       |
| Unknown  | ❔     | Undefined       | ❔     |       |       |
| Null     | ✔️    | None            | ❔     |       |       |
| NaN      | ✔️    |                 |       |       |       |
| Infinity | ✔️    | ComplexInfinity | ❔     |       |       |
| Missing  | ❔     | Nothing         | ❌     | Empty | ❌     |

### Boolean Values

| Language    | True | False | Unknown    | Undefined |
|:------------|:-----|:------|:----------|:----------|
| Typescript  | true | false | undefined | undefined |
| Python      | True | False | None      | None      |
| CSharp      |      |       |           |           |
| Mathematica | True | False | Missing   | Missing   |


### Null

null/none/nil

| Language    | Null | None | Nil       |
|:------------|:-----|:-----|:----------|
| Typescript  | null | none | undefined |
| Python      | None | None | None      |
| CSharp      |      |      |           |
| Rust        |      |      |           |
| Mathematica | Null | None | Missing   |


### NaN
IEEE 754


| Language    | NaN  |
| :---------- | :--- |
| Typescript  |      |
| Python      |      |
| CSharp      |      |
| Rust        |      |
| Mathematica |      |

### Infinity
IEEE 754


| Language    | Infinity | ComplexInfinity |
| :---------- | :------- | :-------------- |
| Typescript  |          | undefined       |
| Python      |          | None            |
| CSharp      |          |                 |
| Rust        |          |                 |
| Mathematica | Infinity | ComplexInfinity |



### Missing

| Language    | Missing   |
|:------------|:----------|
| Typescript  | undefined |
| Python      | None      |
| CSharp      |           |
| Rust        |           |
| Mathematica | Missing   |

### Nothing

| Language    | Nothing   | Empty     |
|:------------|:----------|:----------|
| Typescript  | undefined | undefined |
| Python      | None      | None      |
| CSharp      |           |           |
| Rust        |           |           |
| Mathematica | Nothing   | Missing   |
