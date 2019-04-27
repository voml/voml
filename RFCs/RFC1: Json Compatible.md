RFC1: Json Compatible
=====================

## Motivation

JSON 是一种广泛采用的数据格式, 如果能几乎不加改动的


ARC 必须被解析为 Hashmap, 所以最小化改动就是去掉首尾的 `{ }`

## Reference

None

## Design


### Assign 兼容
新增 `:`, 作为 `=` 的同义词存在.

两者皆可标定键值对, 且可互换.

### EOS 兼容
新增 `,`, 作为 `;` 的同义词存在.

两者都可以用作分割符, 且可互换.

### Array 兼容

List 的文法由 `( )` 改为 `[ ]`.

相应的 ListScope 从 `[ ]` 改为 `( )`.
