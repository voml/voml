Starting with YAML
==================

我得承认这不是一个迁移教程, 这是一个吐槽集合.

我不是很清楚用 yaml 配置的架构到底是怎么想的, 他们的作者真的读过生成的配置文件吗?

yaml 是我见过最邪恶的格式了, 我写过 yaml 的解析器, 简直是炼狱体验.

几百页的语言规范, 大约有 400 多个概念, 状态机都画不出来, 令人绝望.

我当然没实现完整的语言规范, 不过反正就连 PyYAML 的实现都是错的...

我们来看看 YAML 的宣传:

| Propaganda                            | Truth                                  |
| :------------------------------------ | :------------------------------------- |
| YAML 很容易被人类阅读。               | 人类特指买得起游标卡尺的生物           |
| YAML 数据在编程语言之间是可移植的。   | Pyhon, Ruby, Go 的实现从来没一致过     |
| YAML 匹配敏捷语言的原生数据结构。     | Python/Ruby: 别过来, 我不是敏捷语言    |
| YAML 有一个一致的模型来支持通用工具。 | 一致性, 呵呵, 你听说过 `safe_load` 吗? |
| YAML 支持一次性处理。                 | 一次导出, 处处出错                     |
| YAML 具有表现力和可扩展性。           | 可惜我不是能看懂几百页语言规范的超人   |
| YAML 易于实现和使用。                 | 看来 PyYAML 的开发者们都是傻子         |

ARC 只有 5 个原子, 俩数据容器, 扩展统统通过宏实现.

## Python Bloodline

传说 yaml 的作者从 python 得到了灵感, 去他的, 我可不信.

他一定是从 perl 得到了灵感, python 何时有过组合符号了.

冒号前面不能有空格但后面需要空格, 鬼才设定, python 老爹一定没教过你这个...

禁止使用 tab, 你爹说的是禁止混写 space 和 tab 吧......

## Escape

yaml 什么情况下转义? 鬼知道, 反正不用引号非常危险.

## String

YAML 有 63 种多行字符串, 外加鬼知道什么时候转义的特殊字符.

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
| line as key        | No   | No   | No   | No   | No   | No   | No   | No   | No   |


我们来对比一下, JSON 没有多行字符串.

ARC 和 YAML 有两种多行字符串, 分别对应转义与否


## Indentation

虽然 ARC 最佳实践使用了缩进提升可读性.

但使用 ARC 可不需要购买游标卡尺.

游标卡尺语言的一个问题就是很难插入编辑.

ARC 中你只要直接粘贴就行, 顶多在域前面多加一个 `/` 符号表示继承.
