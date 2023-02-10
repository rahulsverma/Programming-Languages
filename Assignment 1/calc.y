%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern int yylineno;
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
	int int_val;
	float float_val;
}
%token<int_val> TOK_INT
%token<float_val> TOK_FLOAT
%token TOK_ADD TOK_SUB TOK_LEFT TOK_RIGHT TOK_PRINT TOK_SEMICOLON

%left TOK_ADD TOK_SUB

%type<int_val> int_exp
%type<float_val> float_exp

%start stmt

%%

stmt: 
	   | stmt exp
;

exp: TOK_SEMICOLON
    | TOK_PRINT float_exp TOK_SEMICOLON { fprintf(stdout, "%f\n", $2);}
    | TOK_PRINT int_exp TOK_SEMICOLON { fprintf(stdout, "%d\n", $2); } 
;

float_exp: TOK_FLOAT                 		{ $$ = $1; }
	  | float_exp float_exp TOK_ADD	 	    { $$ = $1 + $2; }
	  | float_exp float_exp TOK_SUB	 	    { $$ = $1 - $2; }
	  | TOK_LEFT float_exp TOK_RIGHT		{ $$ = $2; }
	  | int_exp float_exp TOK_ADD	 	 	{ $$ = $1 + $2; }
	  | int_exp float_exp TOK_SUB		 	{ $$ = $1 - $2; }
	  | float_exp int_exp TOK_ADD	 	 	{ $$ = $1 + $2; }
	  | float_exp int_exp TOK_SUB 		 	{ $$ = $1 - $2; }
;

int_exp: TOK_INT							{ $$ = $1; }
	  | int_exp int_exp TOK_ADD				{ $$ = $1 + $2; }
	  | int_exp int_exp TOK_SUB				{ $$ = $1 - $2; }
	  | TOK_LEFT int_exp TOK_RIGHT			{ $$ = $2; }
;

%%

int main() {
	yyin = stdin;
	for(; !feof(yyin); ){yyparse();}
	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parsing error: Line %d\n", yylineno);
	exit(EXIT_FAILURE);
}