grammar ARC;
// $antlr-format useTab false ;
// $antlr-format columnLimit 160;
// $antlr-format alignColons trailing;
program   : statement* EOF;
statement : (empty | record | dict_scope | list_scope);
/*====================================================================================================================*/
// $antlr-format alignColons hanging;
record
    : left = key Assign right = atom  # AtomAssign
    | left = key Assign right = list  # ListAssign
    | left = key Assign right = dict  # DictAssign
    | left = key Assign right = cite  # CiteAssign
    | left = key Assign right = macro # MacroAssign;
// $antlr-format alignColons trailing;
empty          : eos # EmptyStatement;
symbol         : (Integer | string | Identifier);
atom           : (integer | decimal | specialID | string);
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
    : [+-]
    | Underline
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
    | StringEmpty         # StringEmpty;
// $antlr-format alignColons trailing;
StringEscapeBlock   : S6 CharLevel1+? S6;
StringEscapeSingle  : S2 CharLevel2+? S2;
StringLiteralBlock  : S3 NonEscape S3;
StringLiteralSingle : S1 ~[']+? S1;
StringEmpty         : S6 S6 | S3 S3 | S2 S2 | S1 S1;
NewLine             : ('\r'? '\n' | '\r')+ -> skip;
fragment S6         : '"""';
fragment S3         : '\'\'\'';
fragment S2         : '"';
fragment S1         : '\'';
fragment CharLevel1 : '\\' (["\\/0bfnrt] | UTF8 | UTF16) | ~[\\];
fragment CharLevel2 : '\\' (["\\/0bfnrt] | UTF8 | UTF16) | ~["\\];
fragment UTF8       : 'u' HEX HEX HEX HEX;
fragment UTF16      : 'U' HEX HEX HEX HEX HEX HEX HEX HEX;
fragment NonEscape  : ~[\u0001]+?;
/*====================================================================================================================*/
// $antlr-format alignColons hanging;
macro
    : At apply = Identifier value = StringLiteralBlock # LiteralMacro
    | At apply = Identifier MacroEscape                # SimpleMacro
    | At apply = Identifier '`' '`'                    # EmptyMacro;
// $antlr-format alignColons trailing;
cite        : Reference key;
Reference   : '$';
Star        : '*';
At          : '@';
E1          : '`';
E3          : '```';
MacroEscape : '`' ('\\' [`] | ~[`])+? '`';
/*====================================================================================================================*/
data : (integer | decimal | specialID | string | list | dict | cite | macro);
list : '[' empty* ']' # ListEmpty | '[' (data eos?)* ']' # ListStatement;
dict : '{' empty* '}' # DictEmpty | '{' statement* '}' # DictStatement;
/*====================================================================================================================*/
dict_scope   : '(' header = key ')' (record | dict_inherit | list_inherit empty*)* # DictScope;
dict_inherit : '(' '/' header = key ')' (record empty*)+ # DictInherit;
list_scope   : '<' header = key '>' (group empty*)+ # ListScope;
list_inherit : '<' '/' header = key '>' (group empty*)+ # ListInherit;
group        : Star (record empty*)+ # DictGroup | '&' data+ # DataGroup;
/*====================================================================================================================*/
LineComment                : Sharp ~[\r\n]* -> channel(HIDDEN);
PartComment                : Comment .*? Comment -> channel(HIDDEN);
WhiteSpace                 : UnicodeWhiteSpace+ -> skip;
fragment Sharp             : '%';
fragment Comment           : '%%%';
fragment UnicodeWhiteSpace : [\p{White_Space}];
