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
COMILLA=[\"]
COMILLASIMPLE=[']
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"=" {return ASIGNACION;}
"==" {return EQUIVALENCIA;}
"!=" {return DIFERENCIA;}
"&" {return AND;}
"&&" {return ANDAND;}
"|" {return OR;}
"||" {return OROR;}
"+" {return MAS;}
"++" {return MASMAS;}
"*" {return MULTI;}
"-" {return MENOS;}
"--" {return MENOSMENOS;}
"/" {return DIV;}
"<" {return MENORQUE;}
"<=" {return MENORIGUALQUE;}
"<" {return MAYORQUE;}
"=>" {return MAYORIGUALQUE;}
"my" {return MY;}
"fun" {return FUN;}
"(" {return OPENPARENTESIS;}
")" {return CLOSEPARENTESIS;}
"[" {return OPENBRACKETS;}
"]" {return CLOSEBRACKETS;}
"{" {return OPENLLAVES;}
"}" {return CLOSELLAVES;}
";" {return PUNTOCOMA;}
"if" {return CONDICIONIF;}
"else" {return CONDICIONELSE;}
"elsif" {return CONDICIONELSIF;}
"switch" {return CONDICIONSWITCH;}
"case" {return CONDICIONCASE;}
"while" {return BUCLEWHILE;}
"for" {return BUCLEFOR;}
"foreach" {return BUCLEFOREACH;}
"return" {return RETORNO;}
"print" {return PRINT;}
"shift" {return SHIFT;}
"unshift" {return UNSHIFT;}
"pop" {return POP;}
"push" {return PUSH;}
"length" {return LARGOLISTA;}
"break" {return BREAK;}
"join" {return JOIN;}
"split" {return SPLIT;}


{L}({L}|{D})* {lexeme=yytext(); return ID;}
{DOLAR}({L}|{D})* {lexeme=yytext(); return IDVAR;}
{AT}({L}|{D})* {lexeme=yytext(); return IDARRAY;}
{PORCEN}({L}|{D})* {lexeme=yytext();return IDHASH;}
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return INT;}
{COMILLA}{L}+{COMILLA} {lexeme=yytext(); return STRING;}
{COMILLASIMPLE}{L}+{COMILLASIMPLE} {lexeme=yytext(); return STRINGSIMPLE;}

. {return ERROR;}