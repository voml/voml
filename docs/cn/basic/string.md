# String

## allow

### character

字符类型 character 使用 `` ` ` `` 包围表示

```js
default = ` `
char1 = `c`
```

character 没有注解类型

### string

字符串类型 string 使用 `" "` 或者 `' '` 包围表示


```js
default = "";
str1 = "s"
str2 = 's'
str3 = "'"
str4 = "\""
```

### multiline string

多行字符串是字符串的一种, 使用三个或以上 ` ` ` 包围表示

当你定义一个字符串时，你必须以单引号或双引号作为开头和结尾。那么当你需要在字符串中使用一个: " 或者 ' 时该怎么办呢?

在 JavaScript 中，你可以通过在引号前面使用 反斜杠 (\) 来转义引号。

var sampleStr = "Alan said, \"Peter is learning JavaScript\".";

这标志着提示 JavaScript 该单引号或双引号并不是字符串的结尾，而是出现在字符串内的字符。所以，如果你要打印字符串到控制台，你将得到：

Alan said, "Peter is learning JavaScript".

在 JavaScript 中，字符串写在单引号或双引号中。

因为这样，以下实例 JavaScript 无法解析：

 "We are the so-called "Vikings" from the north."
字符串 "We are the so-called " 被截断。

如何解决以上的问题呢？可以使用反斜杠 (\) 来转义 "Vikings" 字符串中的双引号，如下:

 "We are the so-called \"Vikings\" from the north."
 反斜杠是一个转义字符。 转义字符将特殊字符转换为字符串字符：

转义字符 (\) 可以用于转义撇号，换行，引号，等其他特殊字符。

下表中列举了在字符串中可以使用转义字符转义的特殊字符：

| 代码 | 输出        |
| :--- | :---------- |
| `\'` | 单引号      |
| `\"` | 双引号      |
| `\\` | 反斜杠      |
| `\n` | 换行        |
| `\r` | 回车        |
| `\t` | tab(制表符) |
| `\b` | 退格符      |
| `\f` | 换页符      |


`````js

```

```

`````


### typed string

字符串的注解类型在前方, 可以添加空格或者回车

```js
raw_text = r" "
```

## warning

- 空的 character

```js
error = ``
```


## deny



