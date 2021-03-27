ESCAPE_ESC: ESC_START 'ESCAPE';
FUNCTION_ESC: ESC_START 'FN';
LIMIT_ESC: ESC_START 'LIMIT';
DATE_ESC: ESC_START 'D';
TIME_ESC: ESC_START 'T';
TIMESTAMP_ESC: ESC_START 'TS';
// mapped to string literal
GUID_ESC: ESC_START 'GUID';

ESC_START: '{' (WS)*;
ESC_END: '}';

// Operators
EQ  : '=';
NULLEQ: '<=>';
NEQ : '<>' | '!=';
LT  : '<';
LTE : '<=';
GT  : '>';
GTE : '>=';

PLUS: '+';
MINUS: '-';
ASTERISK: '*';
SLASH: '/';
PERCENT: '%';
CAST_OP: '::';
DOT: '.';
PARAM: '?';

STRING
    : '\'' ( ~'\'' | '\'\'' )* '\''
    ;

INTEGER_VALUE
    : DIGIT+
    ;

DECIMAL_VALUE
    : DIGIT+ DOT DIGIT*
    | DOT DIGIT+
    | DIGIT+ (DOT DIGIT*)? EXPONENT
    | DOT DIGIT+ EXPONENT
    ;

IDENTIFIER
    : (LETTER | '_') (LETTER | DIGIT | '_' | '@' )*
    ;

DIGIT_IDENTIFIER
    : DIGIT (LETTER | DIGIT | '_' | '@')+
    ;

TABLE_IDENTIFIER
    : (LETTER | DIGIT | '_')+
    ;

QUOTED_IDENTIFIER
    : '"' ( ~'"' | '""' )* '"'
    ;

BACKQUOTED_IDENTIFIER
    : '`' ( ~'`' | '``' )* '`'
    ;

fragment EXPONENT
    : 'E' [+-]? DIGIT+
    ;

fragment DIGIT
    : [0-9]
    ;

fragment LETTER
    : [A-Z]
    ;

SIMPLE_COMMENT
    : '--' ~[\r\n]* '\r'? '\n'? -> channel(HIDDEN)
    ;

BRACKETED_COMMENT
    : '/*' (BRACKETED_COMMENT|.)*? '*/' -> channel(HIDDEN)
    ;

WS
    : [ \r\n\t]+ -> channel(HIDDEN)
    ;
