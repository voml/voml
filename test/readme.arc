% This is a Arc example document.
% Using `%` starts line comment

% import data from other files
import "package.json" as package
import json "package.json" as pkg

[string]
literal = 'This is a string.'
multiline = """
\b     - backspace       (U+0008)
\t     - tab             (U+0009)
\n     - linefeed        (U+000A)
\f     - form feed       (U+000C)
\r     - carriage return (U+000D)
\"     - quote           (U+0022)
\/     - slash           (U+002F)
\\     - backslash       (U+005C)
\u1234 - unicode         (U+1234)
"""










<list.scope.insert>
& 42
& 'string'
& [true, false, null]

<list.scope.string>
& 'Apple'
& 'Banana'
& 'Cherry'

<list.scope.dict>
* name = "Apple"
  color = "red"
* name = "Banana"
  color = "yellow"
* name = "apple"
  color = "red"

% expand above syntax
[list.scope.expand]
insert = [42, 'string', [true, false, null]]
string = ['Apple', 'Banana', 'Cherry']
dict = [
    {name = 'Apple', color = 'red'},
    {name = 'Banana', color = 'yellow'},
    {name = 'apple', color = 'red'}
]







