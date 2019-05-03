Starting with TOML
==================

ARC 和 TOML 在很多地方类似, 不同的地方也有等价语法.

### Number

ARC 的整数和小数可以使用前导零.

与之相对的, ARC 没有 `0x` 开头的特殊进制表示法.

ARC 中需要用宏表示特殊进制

TOML 中整数是 64 bit, 范围

ARC 中整数是大整数, 没有范围, 可以使用解析命令 `--force-int=64` 或宏 `@i64(value)` 等价表示.

TOML 中小数是 64 bit, 范围

ARC 中小数是高精度, 没有范围, 可以使用解析命令 `--force-fp=64` 或宏 `@f64(value)` 等价表示.

数值的详细说明见 [#RFC13](), 数值宏见 [#RFC26]()

### 列表

TOML 可以多次使用 `[[ path ]]` 来向列表中添加元素.

ARC 默认不可以多次声明同一个键, 除非 `--safe-key=false`.

```toml
[[package]]
name = 'number'
md5 = '7FF2B2E95569F56D'
[[package]]
name = 'string'
md5 = '84DD3D20D928BEE8'
```

如果非要找等价操作的话, 那就是

```arc
(dependence/1)
name = 'number'
md5 = '7FF2B2E95569F56D'
(dependence/2)
name = 'string'
md5 = '84DD3D20D928BEE8'
```

注意不是 `<Package/1>`, 记住 `( )` 打开字典, `< >` 打开列表.

不建议这么写, 正常的写法是

```arc
<dependence>
* name = 'number'
  md5 = '7FF2B2E95569F56D'
* name = 'string'
  md5 = '84DD3D20D928BEE8'
```

列表的详细说明见 [#RFC4](), 有多种写法让列表变得简单易读.
