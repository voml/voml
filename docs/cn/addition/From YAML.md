Starting with YAML
==================

我得承认这不是一个迁移教程, 这是一个吐槽集合, 通过劝退迫使你迁移.

我不是很清楚用 YAML 配置的架构到底是怎么想的, 他们的作者真的读过生成的配置文件吗?

YAML 是我见过最邪恶的格式了, 我写过 YAML 的解析器, 简直是炼狱体验.

几百页的语言规范, 大约有 400 多个概念, 状态机都画不出来, 令人绝望.

我当然没实现完整的语言规范, 不过反正就连 PyYAML 的实现都是错的...

我们来看看 YAML 的宣传:

| Propaganda                            | Truth                                  |
| :------------------------------------ | :------------------------------------- |
| YAML 很容易被人类阅读。               | 人类特指买得起游标卡尺的生物           |
| YAML 数据在编程语言之间是可移植的。   | Python, Ruby, Go 的实现从来没一致过    |
| YAML 匹配敏捷语言的原生数据结构。     | Python/Ruby: 别过来, 我不是敏捷语言    |
| YAML 有一个一致的模型来支持通用工具。 | 请解释一下 `strict mode` & `safe_load` |
| YAML 支持一次性处理。                 | 一次导出, 处处出错                     |
| YAML 具有表现力和可扩展性。           | 可惜我不是能看懂几百页语言规范的超人   |
| YAML 易于实现和使用。                 | 看来 PyYAML 的开发者们编程能力低下     |

我们来对比一下, JSON 甚至只有字符串, 没有扩展.

ARC 只有 5 个原子, 俩数据容器, 扩展统统通过宏实现.

## Python Bloodline

YAML是 "YAML Ain’t Markup Language" 的缩写, 这种语言以数据做为中心，而不是以标记语言为重点, 结果 YAML 符号比谁都复杂.

传说 YAML 的作者从 Python 得到了灵感, 去他的, 我可不信.

他一定是从 Perl 得到了灵感, Python 何时有过组合符号了.

冒号前面不能有空格但后面需要空格, 鬼才设定, Python 老爹一定没教过你这个...

禁止使用 Tab, 你爹说的是禁止混写 space 和 tab 吧, 万年 tab 党当场自杀吗?

ARC 压根无视换行和空格, 这里的空格是指 UDP 规定的所有语言中的不可见字符, tab 在这个定义里也是空格.

你可以自由控制你的格式, 然后配置 lint, 你爱怎么样就怎么样.

## Escape

JSON 固然全引号很烦, 但是 YAML 什么情况下转义? 

`y|Y|yes|Yes|YES|n|N|no|No|NO|true|True|TRUE|false|False|FALSE|on|On|ON|off|Off|OFF|0x....`

鬼知道, 我反正没记过, 不用引号非常危险, 连键都转义.

ARC 你只要键不加 `/` 就行了, 其他有问题就会报错, 不会有奇葩的隐式转义.

## String

YAML 有 63 种多行字符串, 外加鬼知道什么时候转义的特殊字符.

```md
| Behavior           | `>`  | `|`  | ` `  | `"`  | `'`  | `>-` | `>+` | `|-` | `|+` |
| :----------------- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Trailing spaces    | Kept | Kept |      |      |      | Kept | Kept | Kept | Kept |
| Single newline =>  | _    | \n   | _    | _    | _    | _    | _    | \n   | \n   |
| Double newline =>  | \n   | \n\n | \n   | \n   | \n   | \n   | \n   | \n\n | \n\n |
| Final newline  =>  | \n   | \n   |      |      |      |      | \n   |      | \n   |
| Final dbl nl's =>  |      |      |      |      |      |      | Kept |      | Kept |
| In-line newlines   | No   | No   | No   | \n   | No   | No   | No   | No   | No   |
| Spaceless newlines | No   | No   | No   | \    | No   | No   | No   | No   | No   |
| Single quote       | '    | '    | '    | '    | ''   | '    | '    | '    | '    |
| Double quote       | "    | "    | "    | \"   | "    | "    | "    | "    | "    |
| Backslash          | \    | \    | \    | \\   | \    | \    | \    | \    | \    |
| " #", ": "         | Ok   | Ok   | No   | Ok   | Ok   | Ok   | Ok   | Ok   | Ok   |
| Can start on same  | No   | No   | Yes  | Yes  | Yes  | No   | No   | No   | No   |
| line as key        |      |      |      |      |      |      |      |      |      |
```

我们来对比一下, JSON 没有多行字符串, ARC 和 YAML 有两种多行字符串, 分别对应转义与否.

## Indentation

虽然 ARC 最佳实践使用了缩进提升可读性.

但使用 ARC 可不需要购买游标卡尺.

游标卡尺语言的一个问题就是很难插入编辑.

ARC 中你只要直接粘贴就行, 顶多在域前面多加一个 `/` 符号表示继承而不是挂载到 `root`.

再次强调, ARC 是换行与空格无关的, 你爱咋地咋地, 怎么看着舒服怎么来.

虽然建议写成:

```arc
a = true
(scope)
b = "value"
c = 0
```

但你就算写成下面这样也没关系:

```arc
a=true(scope)b="value"c=0
```

但是, 这种情况高亮会失效, 因为高亮被设计成该换行不换就失效.

## List

