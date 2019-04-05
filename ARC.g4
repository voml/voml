grammar ARC;
// $antlr-format useTab false ;
// $antlr-format columnLimit 128;
// $antlr-format alignColons trailing;
program   : statement* EOF;
statement : (empty | record | dict_scope | list_scope);
/*====================================================================================================================*/
empty     : eos # EmptyStatement;
eos       : Semicolon | Comma;
Semicolon : ';';
/*====================================================================================================================*/
// $antlr-format alignColons hanging;
record
    : left = key Assign right = integer # IntegerAssign
    | left = key Assign right = decimal # DecimalAssign
    /*| left = key Assign right = exponent  # ExponentAssign*/
    | left = key Assign right = specialID # SpecialLiteral
    | left = key Assign right = string    # StringAssign
    | left = key Assign right = list      # ListAssign
    | left = key Assign right = dict      # DictAssign
    | left = key Assign right = reference # CiteAssign
    | left = key Assign right = macro     # MacroAssign;
// $antlr-format alignColons trailing;
key    : symbol (Dot symbol)*;
symbol : (Integer | string | Identifier);
Assign : '=';
Dot    : '.';
/*====================================================================================================================*/
/*Exponent Support 
 exponent : signed Exponent signed;
 signed : integer | decimal;
 Exponent : 'e' | 'E';
 */
integer                 : Sign? Integer;
decimal                 : Sign? point;
point                   : Integer Dot Integer?;
specialID               : Sign? Identifier;
Identifier              : NameStartCharacter NameCharacter*;
Integer                 : Digits (Underline Digits)*;
Underline               : '_';
Sign                    : ('+' | '-');
fragment Digit          : [0-9];
fragment Digits         : Digit+;
fragment OctalDigit     : [0-7];
fragment HEX            : [0-9a-fA-F];
fragment Letter         : [a-zA-Z];
fragment EmojiCharacter : [\p{Emoji}];
fragment NameCharacter  : NameStartCharacter | Digit;
// $antlr-format alignColons hanging;
fragment NameStartCharacter
    : Underline
    | [\p{Latin}]
    | [\p{Han}]
    | [\p{Hiragana}]
    | [\p{Katakana}]
    | [\p{Greek}];
/*====================================================================================================================*/
string
    : StringEscapeBlock   # StringEscapeBlock
    | StringEscapeSingle  # StringEscapeSingle
    | StringLiteralBlock  # StringLiteralBlock
    | StringLiteralSingle # StringLiteralSingle
    | '"""' '"""'         # StringEmpty
    | '\'\'\'' '\'\'\''   # StringEmpty
    | '"' '"'             # StringEmpty
    | '\'' '\''           # StringEmpty;
// $antlr-format alignColons trailing;
StringEscapeBlock   : '"""' CharLevel1+? '"""';
StringEscapeSingle  : '"' CharLevel2+? '"';
StringLiteralBlock  : '\'\'\'' NonEscape '\'\'\'';
StringLiteralSingle : '\'' ~[']+? '\'';
NewLine             : ('\r'? '\n' | '\r')+ -> skip;
fragment CharLevel1 : '\\' (["\\/0bfnrt] | UTF8) | ~[\\];
fragment CharLevel2 : '\\' (["\\/0bfnrt] | UTF8) | ~["\\];
fragment UTF8       : 'u' HEX HEX HEX HEX;
fragment NonEscape  : ~[\u0001]+?;
/*====================================================================================================================*/
// $antlr-format alignColons hanging;
macro
    : '@' apply = Identifier value = StringLiteralBlock # LiteralMacro
    | '@' apply = Identifier MacroEscape                # SimpleMacro
    | '@' apply = Identifier '`' '`'                    # EmptyMacro;
// $antlr-format alignColons trailing;
reference   : '$' Identifier;
MacroEscape : '`' ('\\' [`] | ~[`])+? '`';
/*====================================================================================================================*/
data  : (Integer | decimal | string | list | dict | reference | macro);
list  : '(' ')' # EmptyList | '(' data (Comma data)* Comma? ')' # FilledList;
dict  : '{' '}' # EmptyDict | '{' record (Comma record)* Comma? '}' # FilledDict;
Comma : ',';
/*====================================================================================================================*/
// $antlr-format alignColons hanging;
dict_scope
    : '[' header = key ']' record+ # FilledDictScope
    | '[' header = key ']'         # EmptyDictScope;
list_scope
    : '<' header = key '>' group+ # FilledListScope
    | '<' header = key '>'        # EmptyListScope;
group: '*' record+ # DictGroup | '&' data # DataGroup;
/*====================================================================================================================*/
// $antlr-format alignColons trailing;
Sharp                      : '%';
Comment                    : '%%%';
LineComment                : Sharp ~[\r\n]* -> channel(HIDDEN);
PartComment                : Comment .*? Comment -> channel(HIDDEN);
WhiteSpace                 : UnicodeWhiteSpace+ -> skip;
fragment UnicodeWhiteSpace : [\p{White_Space}];