Arc Readable Configuration
==========================
[![Site](https://img.shields.io/badge/ARC-v0.4-%23FF4D5B.svg?style=flat-square)](https://github.com/toml-lang/toml)
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg?style=flat-square)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![LICENSE](https://img.shields.io/badge/license-MPL%202.0-blue.svg?style=flat-square)](https://github.com/GalAster/vscode-toml/blob/master/License.md)

## How to Start [![Netlify Status](https://api.netlify.com/api/v1/badges/fbb30971-c014-4c7e-b268-40540b200a3c/deploy-status)](https://app.netlify.com/sites/arc-lang/deploys)

Just copy json file, then remove `{ }` pair, following [json migration tutorial](https://github.com/Moe-Net/Arc-Language/blob/master/i18n/en/From%20JSON.md).

Try js parser: [Arc - Hive](https://github.com/GalAster/Arc-Hive)

Try vscode support: [VScode - ARC](https://github.com/GalAster/vscode-arc/tree/master)

## DataType

| Type     | Example             | Remark           |
| :------- | :------------------ | :--------------- |
| Integer  | `25`                | Atom, BigInteger |
| Decimal  | `1.234`             | Atom, Not Float  |
| String   | `'literal'`         | Atom             |
| Cite     | `$cite.path`        | Atom             |
| Special  | `true`, `null`      | Atom             |
| List     | `(1, 2, 3)`         | Container        |
| Dict     | `{1: 3}`            | Container        |
| DictMark | `[dict.path]`       | Scope            |
| ListMark | `<list.path>`       | Scope            |

- How to expand a macro is determined by the host language. In most cases, ARC does not mandate how the language handle cases.
- There is also no rule on how to handle special values.
- `$cite` only expand once. This is used to share simple version numbers and constants. **Don't overuse.**

## Comparing
Compare with other readable formats

### HOCON
**No override, No include.**

ARC is designed to be a static single file format.

You must write similar businesses together.

Too many calculation properties make the configuration unreadable.

If you really want to use properties from elsewhere, define something like `@Including`.

### TOML

No exponent type like `2e4`, because it doesn't have a explicit precision.

And `` @f64`2e4` `` works the same like TOML.

### JSON

**Compatible with json!**

You can just delete the `{ }` at the beginning and ending, because ARC must use key-value pair.

### YAML

**You don't need to buy a vernier caliper!**

You won't confuse whether you should add `-`.

Every symbol in ARC has only one effect.

### XML like

**Forget them!**

## License
**Prohibit use during overtime!**