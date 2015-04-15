package jflexnetbeans;
import static jflexnetbeans.Token.*;
%%
%class Lexer
%type Token
L = [a-zA-Z_]
D = [0-9]
DOLAR=[$]
AT=[@]
PORCEN=[%]
WHITE=[ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"=" {return ASSIGN;}
"+" {return PLUS;}
"*" {return TIMES;}
"-" {return MINUS;}
"/" {return DIV;}
"my" {return MY;}
"fun" {return FUN;}
"(" {return OPENPARENTESIS;}
")" {return CLOSEPARENTESIS;}
"[" {return OPENBRACKETS;}
"]" {return CLOSEBRACKETS;}
"{" {return OPENLLAVES;}
"}" {return CLOSELLAVES;}
{L}({L}|{D})* {lexeme=yytext(); return ID;}
{DOLAR}({L}|{D})* {lexeme=yytext(); return IDVAR;}
{AT}({L}|{D})* {lexeme=yytext(); return IDARRAY;}
{PORCEN}({L}|{D})* {lexeme=yytext();return IDHASH;}
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return INT;}
. {return ERROR;}