Starting with YAML
==================

我得承认这不是一个迁移教程, 这是一个吐槽集合.

yaml 是我见过最邪恶的格式了, 我写过 yaml 的解析器, 简直是炼狱体验.

虽然 ARC 最佳实践使用了缩进提升可读性.

但使用 ARC 可不需要购买游标卡尺.

游标卡尺语言的一个问题就是很难插入编辑.

ARC 中你只要复制就行, 顶多在域前面多加一个 `/` 符号表示继承.



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
| line as key        |


我们来对比一下, JSON 没有多行字符串

ARC 和 YAML 有两种多行字符串, 分别对应转义与否



