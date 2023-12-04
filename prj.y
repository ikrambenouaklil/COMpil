%{
#include <stdio.h>
%} 
%token const_lex aff pvg idf nbre  nbrr  float_lex  int_lex bool_lex false_lex true_lex  
%start S
%% 
S:H      {printf("syntaxe correct"); YYACCEPT; }; 
H:C V |V 
C:const_lex TC  idf  aff VC pvg C  | const_lex TC idf aff VC pvg 
V: TV idf aff VV pvg V |  TV idf aff VV pvg 
TC: int_lex | float_lex 
TV: int_lex| float_lex|bool_lex 
VC:nbre |nbrr 
VV:nbre|nbrr|BV 
BV:false_lex |true_lex  
%% 
int main() 
{ yyparse();} 
 int yywrap()
{}