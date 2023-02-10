
%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#define YY_DECL int yylex()

#include "calc.tab.h"

%}
digit		             [0-9]
integer		             {digit}+
real		             ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp		                 ({integer}|{real})[eE]{integer}
exp2		             ({integer}|{real})[eE][+-]{integer}
exp3		             [+-]({integer}|{real})[eE][+-]{integer}
integer2	             [+-]({integer}|{real})
%%

"print"	                 {return(TOK_PRINT);}
";"		                 {return(TOK_SEMICOLON);}
[ \t]	;                // ignore all whitespace
[0-9]+\.[0-9]+           {yylval.float_val = strtof(yytext, NULL); return TOK_FLOAT;}
[0-9]+		             {yylval.int_val = strtol(yytext, NULL, 10); return TOK_INT;}
\n		                 {}
"+"		                 {return TOK_ADD;}
"-"		                 {return TOK_SUB;}
"*"		                 {fprintf(stderr, "Lexical analysis error %s\nParsing error: line %d\n", yytext, yylineno);}
"/"		                 {fprintf(stderr, "Lexical analysis error %s\nParsing error: line %d\n", yytext, yylineno);}
"("		                 {return TOK_LEFT;}
")"		                 {return TOK_RIGHT;}
{exp}		             {yylval.float_val = strtof(yytext, NULL); return TOK_FLOAT;}
{exp2}		             {yylval.float_val = strtof(yytext, NULL); return TOK_FLOAT;}
{exp3}		             {yylval.float_val = strtof(yytext, NULL); return TOK_FLOAT;}
{integer2}	             {yylval.float_val = strtof(yytext, NULL); return TOK_FLOAT;}
.		                 {fprintf(stderr, "Invalid character %s\n", yytext);}

%%
