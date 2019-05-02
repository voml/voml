Starting with JSON
==================

ARC 可以渐进的从 JSON 过渡

我们以如下 `json` 为例, 看看如何用 `arc` 改写增强可读性.

```
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
	}
}
```

这取决于你喜不喜欢大括号

`arc` 中空格, 缩进, 换行没有任何的实际意义
