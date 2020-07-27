Arc Readable Configuration
==========================
[![Site](https://img.shields.io/badge/ARC-v0.4-%23FF4D5B.svg?style=flat-square)](https://github.com/toml-lang/toml)
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg?style=flat-square)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![LICENSE](https://img.shields.io/badge/license-MPL%202.0-blue.svg?style=flat-square)](https://github.com/GalAster/vscode-toml/blob/master/License.md)

## How to Start 

See [arc-lang.org](https://arc-lang.netlify.app/) for details. [![Netlify Status](https://api.netlify.com/api/v1/badges/fbb30971-c014-4c7e-b268-40540b200a3c/deploy-status)](https://app.netlify.com/sites/arc-lang/deploys) 

Try vscode support: [VScode - ARC](https://github.com/GalAster/vscode-arc/tree/master)

Following [json migration tutorial](https://github.com/Moe-Net/Arc-Language/blob/master/i18n/en/From%20JSON.md).

## DataType

| Type     | Example             | Remark           |
| :------- | :------------------ | :--------------- |
| Integer  | `42`                | Atom, BigInteger |
| Decimal  | `1.234`             | Atom, BigDecimal |
| String   | `'literal'`         | Atom             |
| Cite     | `$cite.path`        | Atom             |
| Special  | `true`, `null`      | Atom             |
| List     | `[1, 2, 3]`         | Container        |
| Dict     | `{1: 3}`            | Container        |
| DictMark | `[dict.path]`       | Scope            |
| ListMark | `<list.path>`       | Scope            |

![](./test/showtime.png)

## Comparing
Compare with other readable formats

### JSON

**Compatible with json!**

Any json object is a legal arc fragment.

Just copy and paste, then it works!

### TOML

Basically Arc is an enhanced version of Toml

More functions but stricter in some places

### YAML

**You don't need to buy a vernier caliper!**

YAML is a horrible format, if you really use wrote configurations.

### XML like

**Forget them!**
