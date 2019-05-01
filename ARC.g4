grammar ARC;
// $antlr-format useTab false ;
// $antlr-format columnLimit 128;
// $antlr-format alignColons trailing;
program   : statement* EOF;
statement : (recordEOS | dict_scope | list_scope);
/*====================================================================================================================*/
// $antlr-format alignColons hanging;
record
    : left = key Assign right = integer   # IntegerAssign
    | left = key Assign right = decimal   # DecimalAssign
    | left = key Assign right = specialID # SpecialAssign
    | left = key Assign right = string    # StringAssign
    | left = key Assign right = list      # ListAssign
    | left = key Assign right = dict      # DictAssign
    | left = key Assign right = reference # CiteAssign
    | left = key Assign right = macro     # MacroAssign;
// $antlr-format alignColons trailing;
recordEOS      : record eos? # RecordStatement;
symbol         : (Integer | string | Identifier);
key            : symbol ('/' symbol)*;
eos            : Semicolon | Comma;
Assign         : Equal | Colon;
Semicolon      : ';';
Comma          : ',';
Dot            : '.';
fragment Equal : '=';
fragment Colon : ':';
/*====================================================================================================================*/
integer                 : Sign? Integer # IntegerLiteral;
specialID               : Sign? Identifier;
Identifier              : NameStartCharacter NameCharacter*;
Integer                 : Digits (Underline Digits)*;
Underline               : '_';
Sign                    : ('+' | '-');
fragment Digit          : [0-9];
fragment Digits         : Digit+;
fragment OCT            : [0-7];
fragment HEX            : [0-9a-fA-F];
fragment Letter         : [a-zA-Z];
fragment EmojiCharacter : [\p{Emoji}];
fragment NameCharacter  : NameStartCharacter | Digit;
// $antlr-format alignColons hanging;
decimal
    : Sign? left = Integer Dot right = Integer? # DecimalLiteral
    | Sign? Dot right = Integer                 # DecimalZero;
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
fragment CharLevel1 : '\\' (["\\/0bfnrt] | UTF8 | UTF16) | ~[\\];
fragment CharLevel2 : '\\' (["\\/0bfnrt] | UTF8 | UTF16) | ~["\\];
fragment UTF8       : 'u' HEX HEX HEX HEX;
fragment UTF16      : 'U' HEX HEX HEX HEX HEX HEX HEX HEX;
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
data : (integer | decimal | specialID | string | list | dict | reference | macro);
list : '[' ']' # EmptyList | '[' (data eos?)+ ']' # FilledList;
// $antlr-format alignColons hanging;
dict
    : '{' '}'            # EmptyDict
    | '{' recordEOS+ '}' # FilledDict
    | '{' scopes+ '}'    # NestedDict;
/*====================================================================================================================*/
dict_scope
    : '(' header = key ')' recordEOS+ # FilledDictScope
    | '(' header = key ')'            # EmptyDictScope;
list_scope
    : '<' header = key '>' group+ # FilledListScope
    | '<' header = key '>'        # EmptyListScope;
// $antlr-format alignColons trailing;
scopes : (dict_scope | list_scope);
group  : '*' recordEOS+ # DictGroup | '&' data # DataGroup;
/*====================================================================================================================*/
LineComment                : Sharp ~[\r\n]* -> channel(HIDDEN);
PartComment                : Comment .*? Comment -> channel(HIDDEN);
WhiteSpace                 : UnicodeWhiteSpace+ -> skip;
fragment Sharp             : '%';
fragment Comment           : '%%%';
fragment UnicodeWhiteSpace : [\p{White_Space}];
