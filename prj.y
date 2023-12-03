%{

%}
%token const_lex aff pvg idf conste  constr varint varfloat  float_lex  int_lex bool_lex false_lex true_lex 
%%
S:H       { printf("syntaxe correct");};
H:C V|V
C:const_lex TC  idf  aff NC pvg C  | const_lex TC aff NC pvg
V: TV idf aff NV pvg
TC: int_lex | float_lex
TV: int_lex| float_lex|bool_lex
NC:conste |constr
NV:varfloat|varint|BV
BV:false_lex |true_lex 
%%
main ()
{ yyparse(); }

yywrap ()
{}
