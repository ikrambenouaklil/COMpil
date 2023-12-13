%{
#include "prj.tab.h" 
extern  nb_ligne ;
%}
idf_lex [A-Z]"_"?[a-zA-Z0-9]*
nbre_lex "-"?[0-9]+
nbrr_lex "-"?[0-9]+\.[0-9]+
%%
CONST      {return const_lex; }
:=        {return aff;}
;       {return pvg;} 
","       return vg;
INT     { return int_lex;} ;
FLOAT      {return float_lex;};
BOOL       {return bool_lex;}; 
FALSE      {return false_lex;}; 
TRUE       {return true_lex;}; 
BEGIN return begin_lex ;
END return end_lex ;
 "+" return add;
  "-" return minus;
  "*" return mult;
 "/" return div;
{idf_lex}  {  if (yyleng <=10) printf("erreur lexical \n ce identifiant tres long") return idf; };
{nbre_lex}   {return nbre;}; 
{nbrr_lex}   {return nbrr; };
[  \t]  
[\n]  {nb_ligne++;};
.   {printf("erreur lexical dans la ligne %d \n dans l'entitè %s",nb_ligne , yytext) return err;}
