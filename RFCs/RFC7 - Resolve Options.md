RFC7: Resolve Options for Arc
=============================


## Motivation

## Design

### Parsing

| Order         | Short | Type      | Default | Details        |
| :------------ | :---- | :-------- | :------ | :------------- |
| `--force-fp`  |       | enumerate | 0       | 小数解析方式   |
| `--force-int` |       | enumerate | 0       | 整数解析方式   |
| `--safe`      |       | boolean   | true    | 必须使用卫生宏 |
| `--strict`    | `-s`  | boolean   | true    | 不能循环引用   |
|               |       |           |         |


### MetaInfo

| Order      | Default | Type      | Details      |
| :--------- | :------ | :-------- | :----------- |
| `$version` |         | enumerate | 特性版本语法 |
| `$safe`    | true    | boolean   | 检查卫生宏   |
| `$strict`  | true    | boolean   | 检查循环引用 |
|            |         |           |              |
