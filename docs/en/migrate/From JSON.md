Starting with JSON
==================

Arc can gradually transition from Json!

Let's take **an actual json configuration file** as an example, and see how to use `arc` rewriting to enhance readability.

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

First, remove the { } at the beginning and ending, because arc must be the form of the key-value pair.

Now the file already a valid arc file, but it doesn't look pretty.

---

Then you can follow the best practices of `arc` for better readability.

You can remove the quotes for all keys unless they contain `.` characters, or they consist of pure numbers.

Single quotes are the best practice, after all, single quotes don't need to press `Shift`, but double quotes are fine.

Then you can replace the json style `:` with `=`, and then remove all `,` at the end of the key-value pair.

Multi-line lists or dictionaries, separated by `,` at the end of each line.

The IDE can automatically format this step for you:

```arc
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

Then we have to introduce the concept of **routing**, which can greatly simplify the input

Routes are split with `.`.

```arc
engines = {
  vscode = '^1.8.0',
}
```

which quivalent to

```arc
engines.vscode = '^1.8.0'
```

This is why the key appears in `.` must use string mode.

As for why pure numbers are also strings, the specific reasons will be revealed later.

---

It is too cumbersome to expand each route, then introduce the concept of **scope**.

```arc
repository = {
  type = 'git',
  url = 'https://github.com/GalAster/vscode-arc.git',
}
categories = [
  'Programming Languages',
  'Formatters',
]
```

Scope means that it is all mounted on this key until the domain is switched or the file ends

The dictionary field is represented by `[ ]`, and the list field is represented by `< >`.

The equivalent is written as follows:

```arc
[repository]
type = 'git',
url = 'https://github.com/GalAster/vscode-arc.git',
<categories>
& 'Programming Languages'
& 'Formatters'
```

The list scope uses `&` to insert a value, and `*` to insert multiple keys to form a dictionary.

```arc
<dependence>
* name = 'number'
  md5 = '7FF2B2E95569F56D'
* name = 'string'
  md5 = '84DD3D20D928BEE8'
& { name = 'bool', md5 = '4BABDD6E68AB3E63' }
& null
```

which quivalent to

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

There are very few scenes where you need to mix `*` and `&`.

---

Let's consider how to rewrite that big "contributes" field

First introduce **scope inheritance**, consider the following structure:

```arc
root = {
  a = {c = true}
  b = {d = false}
}
```

You can write as:

```arc
root = {
  [a] c = true
  [b] d = false
}
```

And can also be written as:

```arc
[root]
  [.a] c = true
  [.b] d = false
```

It depends on whether you like braces or not, indentation here is not necessary.

Spaces, indents, and newlines in `arc` have no practical meaning. How to typeset is your freedom.

---

Then we understand what is **index routing**.

Back to this structure:

```arc
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

According to what we learned before, it can be written as:

```arc
<contributes.languages>
* id = 'arc'
  aliases = ['ARC']
  extensions = ['.arc']
  filenames = [ ]
  mimetypes = ['text/x-arc']
  configuration = './syntax/arc.configuration.json'
```

But there are other ways of writing, here this dictionary expansion tag `*` can be omitted.

Because the offset from the header is 0, it can be represented by 0. Here the value is a dictionary, so use `[ ]`.

```arc
[contributes.languages.0]
id = 'arc'
aliases = ['ARC']
extensions = ['.arc']
filenames = [ ]
mimetypes = ['text/x-arc']
configuration = './syntax/arc.configuration.json'
```

---

The final rewritten file is as follows, is it clearer?

```arc
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

The main points of the `arc` language are all here.

There is also a reference feature that is not used here, that is, use `$` to mark the path, and share the value such as the version number.
