Starting with JSON
==================

Arc 可以渐进的从 Json 过渡!

我们以一个**实际的 `json` 配置文件**为例, 看看如何用 `arc` 改写增强可读性.

```json
{
  "name": "vscode-arc",
  "displayName": "Arc Language Support",
  "description": "Highlight and formatter for Arc Readable Configiration",
  "repository": {
    "type": "git",
    "url": "https://github.com/GalAster/vscode-arc.git"
  },
  "engines": {
    "vscode": "^1.8.0"
  },
  "categories": [
    "Programming Languages",
    "Formatters"
  ],
  "scripts": {
    "postinstall": "node ./node_modules/vscode/bin/install && tsc",
    "build": "yarn lint && ts-node syntax/build.ts",
    "pack": "yarn build && vsce package",
    "lint": "tslint **/*.ts --fix"
  },
  "contributes": {
    "languages": [
      {
        "id": "arc",
        "aliases": [
          "ARC"
        ],
        "extensions": [
          ".arc"
        ],
        "filenames": [],
        "mimetypes": [
          "text/x-arc"
        ],
        "configuration": "./syntax/arc.configuration.json"
      }
    ],
    "grammars": [
      {
        "language": "arc",
        "scopeName": "source.arc",
        "path": "./syntax/arc.tmLanguage.json"
      },
      {
        "scopeName": "markdown.arc.codeblock",
        "path": "./syntax/arc.markdown.json",
        "injectTo": [
          "text.html.markdown"
        ],
        "embeddedLanguages": {
          "meta.embedded.block.arc": "arc"
        }
      }
    ]
  },
  "devDependencies": {
    "@types/node": "^11.13.6",
    "vscode": "^1.1.33"
  },
  "__metadata": {
    "id": "6267dad2-7d52-462a-a1ef-7e3da7378a7d",
    "publisherDisplayName": "Aster",
    "publisherId": "3406b78c-f287-4619-8d82-7c97998693e3"
  },
}
```

首先, 去掉开头末尾的 `{ }`, 因为 `arc` 必须是键值对的形式.

现在得到的文件已经是一个合法的 `arc` 文件了, 但是不怎么好看.

---

接着你可以遵循 `arc` 的最佳实践, 获取更好的阅读效果.

你可以把所有键的引号去掉, 除非他们包含 `.` 字符, 或者由纯数字构成.

单引号是最佳实践, 毕竟单引号不用按 Shift, 但是双引号也可以.

然后你可以把 json 风格的 `:` 换成 `=`, 然后去掉键值对末尾的所有 `,`.

多行列表或者字典, 每行末尾使用 `,` 分隔.

IDE 能自动为你格式化到这一步:

```toml
name = 'vscode-arc'
displayName = 'Arc Language Support'
description = 'Highlight and formatter for Arc Readable Configiration'
repository = {
  type = 'git',
  url = 'https://github.com/GalAster/vscode-arc.git',
}
engines = {
  vscode = '^1.8.0',
}
categories = [
  'Programming Languages',
  'Formatters',
]
scripts = {
  postinstall = 'node ./node_modules/vscode/bin/install && tsc',
  build = 'yarn lint && ts-node syntax/build.ts',
  pack = 'yarn build && vsce package',
  lint = 'tslint **/*.ts --fix',
}
contributes = {
  languages = [
    {
      id = 'arc',
      aliases = ['ARC'],
      extensions = ['.arc'],
      filenames = [ ],
      mimetypes = ['text/x-arc'],
      configuration = './syntax/arc.configuration.json',
    },
  ],
  grammars = [
    {
      language = 'arc',
      scopeName = 'source.arc',
      path = './syntax/arc.tmLanguage.json',
    },
    {
      scopeName = 'markdown.arc.codeblock',
      path = './syntax/arc.markdown.json',
      injectTo = [
        'text.html.markdown',
      ],
      embeddedLanguages = {
        'meta.embedded.block.arc' = 'arc',
      },
    },
  ],
}
devDependencies = {
  '@types/node' = '^11.13.6',
  vscode = '^1.1.33'
}
__metadata = {
  id = '6267dad2-7d52-462a-a1ef-7e3da7378a7d',
  publisherDisplayName = 'Aster',
  publisherId = '3406b78c-f287-4619-8d82-7c97998693e3',
}
```

---

接着我们要引入路由的概念, 这能大大简化输入.

路由用 `.` 分割.

```toml
engines = {
  vscode = '^1.8.0',
}
```

等价于 

```toml
engines.vscode = '^1.8.0'
```

这也是为什么 key 出现 `.` 必须用字符串模式的原因.

至于为什么纯数字也要字符串, 具体原因后面会揭示.

---

每个路由都要展开太过烦琐了, 接下来引入域的概念.

```toml
repository = {
  type = 'git',
  url = 'https://github.com/GalAster/vscode-arc.git',
}
categories = [
  'Programming Languages',
  'Formatters',
]
```

域表示到域切换或者文件结束为止全部挂载在这个键上.

字典域用 `[ ]` 表示, 列表域用 `< >` 表示.

等价的写法为如下:

```toml
[repository]
type = 'git',
url = 'https://github.com/GalAster/vscode-arc.git',
<categories>
& 'Programming Languages'
& 'Formatters'
```

列表域使用 `&` 表示插入一个值, `*`表示插入多个键构成字典.

```toml
<dependence>
* name = 'number'
  md5 = '7FF2B2E95569F56D'
* name = 'string'
  md5 = '84DD3D20D928BEE8'
& { name = 'bool', md5 = '4BABDD6E68AB3E63' }
& null
```

等价于

```ts
module.exports = [
  {
    name: 'number',
    md5: '7FF2B2E95569F56D'
  },
  {
    name: 'string',
    md5: '84DD3D20D928BEE8'
  },
  {
    name: 'bool',
    md5: '4BABDD6E68AB3E63'
  },
  null
]
```

一般很少有场景需要混写 `*` 和 `&`.

---

我们接着考虑如何改写那个很大的 `contributes` 字段.

先介绍域继承, 考虑如下构造:

```toml
root = {
  a = {c = true}
  b = {d = false}
}
```

你可以写成 

```toml
root = {
  [a] c = true
  [b] d = false
}
```

也可以写成

```toml
[root]
  [.a] c = true
  [.b] d = false
```

这取决于你喜不喜欢大括号, 这里的缩进都不是必须的.

`arc` 中空格, 缩进, 换行没有任何的实际意义如何排版是你的自由.

---

接着我们了解一下什么是索引路由.

回到这个结构

```toml
contributes = {
  languages = [
    {
      id = 'arc',
      aliases = ['ARC'],
      extensions = ['.arc'],
      filenames = [ ],
      mimetypes = ['text/x-arc'],
      configuration = './syntax/arc.configuration.json',
    },
  ],
}
```

按照之前我们学到的, 可以写成:

```toml
<contributes.languages>
* id = 'arc'
  aliases = ['ARC']
  extensions = ['.arc']
  filenames = [ ]
  mimetypes = ['text/x-arc']
  configuration = './syntax/arc.configuration.json'
```

但还有其他的写法, 这里这个字典展开标记 `*` 可以省略.

因为与表头的偏移是0, 所以用 0 表示即可, 此处值是字典, 所以用 `[ ]`.

```toml
[contributes.languages.0]
id = 'arc'
aliases = ['ARC']
extensions = ['.arc']
filenames = [ ]
mimetypes = ['text/x-arc']
configuration = './syntax/arc.configuration.json'
```

---

最终改写的文件如下, 看看这样子是不是清晰了许多?

```toml
# https://github.com/GalAster/vscode-arc/blob/master/package.json
name = 'vscode-arc'
displayName = 'Arc Language Support'
description = 'Highlight and formatter for Arc Readable Configiration'
engines.vscode = '^1.8.0'

<categories>
& 'Programming Languages'
& 'Formatters'

[repository]
type = 'git'
url = 'https://github.com/GalAster/vscode-arc.git'

[scripts]
postinstall = 'node ./node_modules/vscode/bin/install && tsc'
build = 'yarn lint && ts-node syntax/build.ts'
pack = 'yarn build && vsce package'
lint = 'tslint **/*.ts --fix'

[dependencies]
vscode = '^1.1.33'

[devDependencies]
'@types/node' = '^11.13.6'

<contributes.languages>
* id = 'arc'
  aliases = ['ARC'],
  extensions = ['.arc']
  filenames = [ ]
  mimetypes = ['text/x-arc']
  configuration = './syntax/arc.configuration.json'

<contributes.grammars>
* scopeName = 'source.arc'
  language = 'arc'
  path = './syntax/arc.tmLanguage.json'
* scopeName = 'markdown.arc.codeblock'
  path = './syntax/arc.markdown.json'
  injectTo = ['text.html.markdown']
  embeddedLanguages = {'meta.embedded.block.arc' = 'arc'}

[__metadata]
id = '6267dad2-7d52-462a-a1ef-7e3da7378a7d'
publisherDisplayName = 'Aster'
publisherId = '3406b78c-f287-4619-8d82-7c97998693e3'
```

`arc` 语言的主要要点就全部在这了.

还有一个引用特性这里没有用到, 即使用 `$` 标记路径, 共享版本号之类的值.
