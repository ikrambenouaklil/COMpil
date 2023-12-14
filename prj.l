%{
#include "prj.tab.h" 
extern  nb_ligne ;
extern YYSTYPE yylval;
%}
idf_lex [A-Z]"_"?[a-zA-Z0-9]*
nbre_lex "-"?[0-9]+
nbrr_lex "-"?[0-9]+\.[0-9]+
comment  "\{[^}]\}"
%%
CONST   {yylval.entier=atoi(yytext);return const_lex; }
:=       {return aff;}
;       {return pvg;} 
","       return vg;
INT      { yylval.str=strdup(yytext);return int_lex;} ;
FLOAT    {yylval.str=strdup(yytext);return float_lex;};
BOOL     {yylval.str=strdup(yytext);return bool_lex;};
FALSE      {return false_lex;}; 
TRUE       {return true_lex;}; 
BEGIN return begin_lex ;
END return end_lex ;
"+" return add;
"-" return minus;
 "*" return mult;
"/" return div;
== return equal; 
 "{" return acolovr; 
 "}" return acolfermt;
 "(" return parovt;
  ")" return parfrt;
  If return cndtinst;
  else return elseinst;
  > return bigger_lex ;
   >= return biggereq_lex;
   < return less_lex ;
   <= return lessreq_lex;
   <> return noeql_lex;
For return bocleinst;
{idf_lex}  {  if (yyleng>10)  printf("erreur lexical \n ce identificateur est tres long");
yylval.str=strdup(yytext); inserer(yytext,"idf");return idf };
{nbre_lex}   {return nbre;}; 
{nbrr_lex}   {return nbrr; };
[  \t]
comment
[\n]  {nb_ligne++;};
[+;] {return yytext[0];}
.   {printf("erreur lexical dans la ligne %d \n dans l'entitè %s",nb_ligne , yytext) return err;}
