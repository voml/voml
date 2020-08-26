## Character

字符类型 character 使用 `` ` ` `` 包围表示:

```arc
default = ` `
char1 = `c`
```

## String

字符串类型 string 使用 `" "` 或者 `' '` 包围表示:


```arc
default = "";
str1 = "s"
str2 = 's'
str3 = "'"
str4 = "\""
```

当你需要在字符串中使用 `"` 或者 `'` 时该怎么办呢?

你可以通过在引号前面使用反斜杠 `\` 来转义引号, 斜杠是一个转义字符, 转义字符将特殊字符转换为字符串字符:

下表中列举了在字符串中可以使用转义字符转义的特殊字符:

| 代码 | 输出        |
| :--- | :---------- |
| `\'` | 单引号      |
| `\"` | 双引号      |
| `\\` | 反斜杠      |
| `\n` | 换行        |
| `\r` | 回车        |
| `\t` | 制表符(tab) |
| `\b` | 退格符      |
| `\f` | 换页符      |


## Multiline String

多行字符串是字符串的一种, 使用三个或以上 ` ` ` 包围表示:


`````arc
````
this is a multiline string
'this is a string inside multiline string'
"this is another string inside multiline string"
```this is a nested multiline string```
````
`````


## Typed String

字符串的注解类型在前方, 可以添加空格或者回车隔开:

```arc
raw_text = r" "
```

## warning

- 不要使用带**空格或回车**的字符/字符串注解

```arc
warn1 = r"warning"
warn2 = r
"warning"
```

- 不要使用带**空格**的多行字符串注解

```arc
warn1 = r```warning```
```

## deny


- 禁止空的 character

```arc
error = ``
```

- 禁止非法的转义

```arc
error = "\a"
```
