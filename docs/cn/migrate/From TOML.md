Starting with TOML
==================

ARC 和 TOML 在很多地方类似, 不同的地方也有等价语法对应.

TOML 不兼容 JSON, 而 ARC 兼容, ARC 可以渐进的把 JSON 语法替换成可读性更高的 ARC 语法.

### Number

ARC 的整数和小数可以使用前导零.

与之相对的, ARC 没有 `0x` 开头的特殊进制表示法.

ARC 中需要用宏表示特殊进制, 如 `@h`, `@o`, `@b` 等.

TOML 中整数是 64 bit 整数, 范围 `-2^63 ~ 2^63-1`, 也就是 `-922_3372_0368_5477_5808` 到 `+922_3372_0368_5477_5807`.

ARC 中整数是大整数, 没有范围, 可以使用解析命令 `--force-int=64` 或宏 `@i64(value)` 等价表示.

TOML 中小数是 64 bit 浮点数, 范围绝对值约为 `[2.23*10^-308,1.79*10^308]`.

ARC 中小数是高精度, 没有范围, 可以使用解析命令 `--force-fp=64` 或宏 `@f64(value)` 等价表示.

数值的详细说明见 [#RFC13][#13], 数值宏见 [#RFC26][#26].

### Date

TOML 使用 RFC 3339 格式的日期, 支持类似 `1926-08-17 07:32:00Z` 的值.

ARC 不可能支持带空格的字面量, ARC 是多空格与换行无关的.

ARC 需要用 `@d` 宏表示日期以及时间, 详见 [#RFC27][#27].

### List/Array

TOML 的 Array 实际类似于 Tuple, 必须所有元素具有相同类型.

ARC 的列表可以填装所有元素, 可以使用 `@Tuple` 要求反序列化一个 Tuple.

宏可以与宿主语言的反射特性相结合, 详见 [#RFC18][#18].

TOML 可以多次使用 `[[ path ]]` 来向列表中添加元素.

ARC 默认不可以多次声明同一个键, 除非 `--safe-key=false`.

```arc
[[package]]
name = 'number'
md5 = '7FF2B2E95569F56D'
[[package]]
name = 'string'
md5 = '84DD3D20D928BEE8'
```

上述 TOML 如果非要找 ARC 的等价操作的话, 那就要写成:

```arc
(dependence/1)
name = 'number'
md5 = '7FF2B2E95569F56D'
(dependence/2)
name = 'string'
md5 = '84DD3D20D928BEE8'
```

注意不是 `<Package/1>`, 记住 `( )` 打开字典, `< >` 打开列表.

实际上一般不建议这么写, 正常的写法是:

```arc
<dependence>
* name = 'number'
  md5 = '7FF2B2E95569F56D'
* name = 'string'
  md5 = '84DD3D20D928BEE8'
```

`*` 表示捕捉键值对组成字典加入列表, `&` 表示把值插入列表.

列表的详细说明见 [#RFC4][#4], 有多种写法让列表变得简单易读.

[#4]: https://github.com/Moe-Net/Arc-Language/blob/master/RFCs/RFC4%20-%20Standardize%20List.md
[#13]: https://github.com/Moe-Net/Arc-Language/blob/master/RFCs/RFC13%20-%20Standardize%20Number.md
[#18]: https://github.com/Moe-Net/Arc-Language/blob/master/RFCs/RFC18%20-%20Binding%20Macro.md
[#26]: https://github.com/Moe-Net/Arc-Language/blob/master/RFCs/RFC26%20-%20Numerical%20Macros.md
[#27]: https://github.com/Moe-Net/Arc-Language/blob/master/RFCs/RFC27%20-%20DateTime%20Macros.md
