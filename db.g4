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
