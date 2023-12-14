%{
   extern int yylex(void);
 void yyerror(const char *s);
int nb_ligne = 1
%}
%token const_lex aff pvg idf conste  constr varint varfloat  float_lex  int_lex bool_lex false_lex true_lex begin_lex end_lex err  add minus mult div vg
equal acolovr acolfermt parovt parfrt cndtinst elseinst bigger_lex biggereq_lex less_lex  lessreq_lex noeql_lex

%%
S:H  begin_lex  INST end_lex      {printf("syntaxe correct");
  YYACCEPT;}

H:C V|V
C:const_lex TC  idf  aff NC pvg C  | const_lex TC aff NC pvg
V: INITV | DCLRV
INITV: TV IDF aff NV pvg  V|TV IDF aff NV pvg 
DCLRV: TV IDF pvg V|TV IDF pvg
IDF: idf vg IDF | idf
TC: int_lex | float_lex
TV: int_lex| float_lex|bool_lex
NC:conste |constr
NV:varfloat|varint|BV
BV:false_lex |true_lex 
INST: BOUCLE|COND|AFF 
BOUCLE:FOR INST|FOR
COND:IF INST |IF
AFF:OPT INST | OPT
OPT: idf  aff GP pvg | idf aff NV pvg
GP: idf OPART GP|idf
OPRAT: add | minus | mult | div 
IF:


%%
main ()
{
   yyparse(); 
}
yywrap ()
{}

