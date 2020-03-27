Starting with JSON
==================

ARC can gradually transition from JSON!

Let's take the following example of `json` to see how to enhance readability with `arc`.

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

First, remove the `{ }` at the beginning and ending, because `arc` must be the form of the key-value pair.

Now the file already a valid `arc` file, but it doesn't look pretty.

---

Then you can follow the best practices of `arc` for better readability.

You can remove the quotation marks of all keys, unless they contain `/` characters, or consist of pure numbers.

Single quotes are best practices, but double quotes are also available, single quotes do not escaped, while double quotes support escape.

Then you can replace the json style `:` with `=`

Then remove all the `,` at the end of the key-value pair, unless it is a multi-line list or dictionary, each line is separated by `,` at the end.

The IDE can automatically format file for you, you can use `self-lint` to control formatting.

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

Then we have to introduce the concept of routing, which greatly simplifies the input.

The route is split with `/`, just like the file path.

This is the reason why the key contain `/` must be in string mode.

For why numbers also must use strings, the specific reasons will be revealed in the next section.

```arc
engines = {
  vscode = '^1.8.0',
}
```

which is quivalent to:

```arc
engines/vscode = '^1.8.0'
```

The namespace in a programming language is usually separated by `::` or `.`.

The reason why `arc` does not use `.` is that this symbol has been used to split decimals. 

In `arc` one symbol only one meaning, whick is convenient for parsing.

---

Every route has to be too cumbersome to expand, and then we introduce the concept of the scope.

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

The scope indicates that all keys are mounted on this key until the scope switch or file ends.

The dictionary field is represented by `( )`, and the list field is represented by `[ ]`.

The equivalent is written as follows:

```arc
(repository)
type = 'git',
url = 'https://github.com/GalAster/vscode-arc.git',
<categories>
& 'Programming Languages'
& 'Formatters'
```

The list field uses `&` to insert a value, and `*` to insert multiple keys to form a dictionary.

```arc
<dependence>
* name = 'number'
  md5 = '7FF2B2E95569F56D'
* name = 'string'
  md5 = '84DD3D20D928BEE8'
& { name = 'bool', md5 = '4BABDD6E68AB3E63' }
& null
```

which is quivalent to

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

Few scenes need to use `*` and `&` both.

---

Then we consider how to rewrite that complex `contributes` field

We introduce the scope inheritance, consider the following structure

```arc
root = {
  a = {c = true}
  b = {d = false}
}
```

You can write as: 

```arc
root = {
  (a) c = true
  (b) d = false
}
```

or write as: 

```arc
(root)
  (/a) c = true
  (/b) d = false
```

It depends on whether you like braces or not, and the indentation here is not necessary.

Space, indentation, line breaks in `arc` don't have any practical meaning. 

How to typeset is your freedom.

---

Then let's take a look at what is index routing.

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

It seems that it can be written as:

```arc
<contributes/languages>
* id = 'arc',
  aliases = ['ARC'],
  extensions = ['.arc'],
  filenames = [ ],
  mimetypes = ['text/x-arc'],
  configuration = './syntax/arc.configuration.json',
& { % or manually expand
    id = 'arc',
    aliases = ['ARC'],
    extensions = ['.arc'],
    filenames = [ ],
    mimetypes = ['text/x-arc'],
    configuration = './syntax/arc.configuration.json',
  }
```

But there is a better way to write, here the dictionary expansion mark `*` can be omitted.

Because it is the first element in the list, it can be represented by 1. 

then it is a dictionary, so use `( )`.

```arc
(contributes/languages/1)
id = 'arc'
aliases = ['ARC']
extensions = ['.arc']
filenames = [ ]
mimetypes = ['text/x-arc']
configuration = './syntax/arc.configuration.json'
```

---

The final rewritten file is as follows:

```arc
% https://github.com/GalAster/vscode-arc/blob/master/package.json
name = 'vscode-arc'
displayName = 'Arc Language Support'
description = 'Highlight and formatter for Arc Readable Configiration'
engines/vscode = '^1.8.0'

<categories>
& 'Programming Languages'
& 'Formatters'

(repository)
type = 'git'
url = 'https =//github.com/GalAster/vscode-arc.git'

(scripts)
postinstall = 'node ./node_modules/vscode/bin/install && tsc'
build = 'yarn lint && ts-node syntax/build.ts'
pack = 'yarn build && vsce package'
lint = 'tslint **/*.ts --fix'

(dependencies)
vscode = '^1.1.33'

(devDependencies)
'@types/node' = '^11.13.6'

(contributes)
</languages>
* id = 'arc'
  aliases = ['ARC'],
  extensions = ['.arc']
  filenames = []
  mimetypes = ['text/x-arc']
  configuration = './syntax/arc.configuration.json'
</grammars>
* language = 'arc'
  scopeName = 'source.arc'
  path = './syntax/arc.tmLanguage.json'
* scopeName = 'markdown.arc.codeblock'
  path = './syntax/arc.markdown.json'
  injectTo = [
    'text.html.markdown',
  ]
  embeddedLanguages = {
    'meta.embedded.block.arc' = 'arc',
  }

(__metadata)
id = '6267dad2-7d52-462a-a1ef-7e3da7378a7d'
publisherDisplayName = 'Aster'
publisherId = '3406b78c-f287-4619-8d82-7c97998693e3'
```

Note that all non-character space wraps can be removed, further compressed transmission.

The main elements of the `arc` language are all here.

There is also a reference feature that uses `$` to mark paths, share values like version numbers.

The next step is to familiarize with the using of macros, how to combine the reflection properties of the language, and obtain readable serialization results.
