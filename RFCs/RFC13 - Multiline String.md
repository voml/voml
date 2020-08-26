RFC14: Multiline String
=======================


Arc 中有两种字符串

共有四种方式来表示字符串：基本字符串、多行基本字符串、字面量和多行字面量。  
所有字符串都只能包含有效的 UTF-8 字符。

**基本字符串**（Basic strings）由引号包裹。  
任何 Unicode 字符都可以使用，除了那些必须转义的：引号，反斜杠，以及控制字符（U+0000 至 U+001F，U+007F）。

```arc
str = "我是一个字符串。\"你可以把我引起来\"。姓名\tJos\u00E9\n位置\t旧金山。"
```

为了方便，一些流行的字符有其简便转义写法。

```
\b         - backspace       (U+0008)
\t         - tab             (U+0009)
\n         - linefeed        (U+000A)
\f         - form feed       (U+000C)
\r         - carriage return (U+000D)
\"         - quote           (U+0022)
\\         - backslash       (U+005C)
\uXXXX     - unicode         (U+XXXX)
\UXXXXXXXX - unicode         (U+XXXXXXXX)
```

任何 Unicode 字符都可以用 `\uXXXX` 或 `\UXXXXXXXX` 的形式来转义。  
转义码必须是有效的 Unicode [标量值](http://unicode.org/glossary/#unicode_scalar_value)。

所有上面未列出的其它转义序列都是保留的，如果被用了，TOML 应当生成一个错误。

有时你需要表示一小篇文本（例如译文）或者想要对非常长的字符串进行折行。  
TOML 对此进行了简化。

**多行基本字符串**（Multi-line basic strings）由三个引号包裹，允许折行。  
紧随开头引号的那个换行会被去除。  
其它空白和换行符会被原样保留。

```arc
str1 = """
Roses are red
Violets are blue"""
```

TOML 解析器可以相对灵活地解析成对所在平台有效的换行字符。

```arc
# 在 Unix 系统，上面的多行字符串可能等同于：
str2 = "Roses are red\nViolets are blue"

# 在 Windows 系统，它可能等价于：
str3 = "Roses are red\r\nViolets are blue"
```

想书写长字符串却不想引入无关空白，可以用“行末反斜杠”。  
当一行的最后一个非空白字符是 `\` 时，它会连同它后面的所有空白（包括换行）一起被去除，直到下一个非空白字符或结束引号为止。  
所有对基本字符串有效的转义序列，对多行基本字符串也同样适用。

```arc
# 下列字符串的每一个字节都完全相同：
str1 = "The quick brown fox jumps over the lazy dog."

str2 = """
The quick brown \


  fox jumps over \
    the lazy dog."""

str3 = """\
       The quick brown \
       fox jumps over \
       the lazy dog.\
       """
```

任何 Unicode 字符都可以使用，除了那些必须被转义的：反斜杠和控制字符（U+0000 至 U+001F，U+007F）。  
引号不需要转义，除非它们的存在会造成一个比预期提前的结束标记。

如果你常常要指定 Windows 路径或正则表达式，那么必须转义反斜杠就马上成为啰嗦而易错的了。  
为了帮助搞定这点，TOML 支持字面量字符串，它完全不允许转义。

**字面量字符串**（Literal strings）由单引号包裹。  
类似于基本字符串，他们只能表现为单行：

```arc
# 所见即所得。
winpath  = 'C:\Users\nodejs\templates'
winpath2 = '\\ServerX\admin$\system32\'
quoted   = 'Tom "Dubs" Preston-Werner'
regex    = '<\i\c*\s*>'
```

由于没有转义，无法在由单引号包裹的字面量字符串中写入单引号。  
万幸，TOML 支持一种多行版本的字面量字符串来解决这个问题。

**多行字面量字符串**（Multi-line literal strings）两侧各有三个单引号来包裹，允许换行。  
类似于字面量字符串，无论任何转义都不存在。  
紧随开始标记的那个换行会被剔除。  
开始结束标记之间的所有其它内容会原样对待。

```arc
regex2 = '''I [dw]on't need \d{2} apples'''
lines  = '''
原始字符串中的
第一个换行被剔除了。
   所有其它空白
   都保留了。
'''
```

除 tab 以外的所有控制字符都不允许出现在字面量字符串中。  
因此，对于二进制数据，建议你使用 Base64 或其它合适的 ASCII 或 UTF-8 编码。  
对那些编码的处理方式，将交由应用程序自己来确定。
