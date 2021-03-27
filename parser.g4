primary
    : LP expression RP                    # precedence
    | ( OCTAL | HEX | INTEGER | DECIMAL ) # numeric
    | TRUE                                # true
    | FALSE                               # false
    | NULL                                # null
    | STRING                              # string
    | REGEX                               # regex
    | listinitializer                     # listinit
    | mapinitializer                      # mapinit
    | ID                                  # variable
    | ID arguments                        # calllocal
    | NEW type arguments                  # newobject
    ;

postfix
    : callinvoke
    | fieldaccess
    | braceaccess
    ;

postdot
    : callinvoke
    | fieldaccess
    ;

callinvoke
    : ( DOT | NSDOT ) DOTID arguments
    ;

fieldaccess
    : ( DOT | NSDOT ) ( DOTID | DOTINTEGER )
    ;

braceaccess
    : LBRACE expression RBRACE
    ;

arrayinitializer
    : NEW type ( LBRACE expression RBRACE )+ ( postdot postfix* )?                        # newstandardarray
    | NEW type LBRACE RBRACE LBRACK ( expression ( COMMA expression )* )? RBRACK postfix* # newinitializedarray
    ;

listinitializer
    : LBRACE expression ( COMMA expression)* RBRACE
    | LBRACE RBRACE
    ;

mapinitializer
    : LBRACE maptoken ( COMMA maptoken )* RBRACE
    | LBRACE COLON RBRACE
    ;

maptoken
    : expression COLON expression
    ;

arguments
    : ( LP ( argument ( COMMA argument )* )? RP )
    ;

argument
    : expression
    | lambda
    | funcref
    ;

lambda
    : ( lamtype | LP ( lamtype ( COMMA lamtype )* )? RP ) ARROW ( block | expression )
    ;

lamtype
    : decltype? ID
    ;

funcref
    : decltype REF ID  # classfuncref
    | decltype REF NEW # constructorfuncref
    | THIS REF ID      # localfuncref
    ;
