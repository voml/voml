Arc Readable Configuration
==========================
[![Site](https://img.shields.io/badge/ARC-v0.1-%23FF4D5B.svg?style=flat-square)](https://github.com/toml-lang/toml)
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg?style=flat-square)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![LICENSE](https://img.shields.io/badge/license-MPL%202.0-blue.svg?style=flat-square)](https://github.com/GalAster/vscode-toml/blob/master/License.md)

## DataType
| Type     | Example             | Remark           |
| :------- | :------------------ | :--------------- |
| Integer  | `25`                | Atom, BigInteger |
| Decimal  | `1.234`             | Atom, Not Float  |
| String   | `'literal'`         | Atom             |
| Cite     | `$cite.path`        | Atom             |
| Special  | `true`, `null`      | Atom             |
| Macro    | `` @macro`apply` `` | Macro            |
| Record   | `a : 1 `            | Container        |
| List     | `(1, 2, 3) `        | Container        |
| Dict     | `{1: 3}`            | Container        |
| ListMark | `<list.path>`       | Scope            |
| DictMark | `[dict.path]`       | Scope            |

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

**Not Compatible with json!**

I originally supported compatible when I designed it, later I removed this setting.

You can delete the `{ }` at the beginning and ending, then replace `:` with `=` and `[ ]` with `( )`, or use an online conversion tool.

### YAML

**You don't need to buy a vernier caliper!**

You won't confuse whether you should add `-`.

Every symbol in ARC has only one effect.

### XML like

**Forget them!**

## License