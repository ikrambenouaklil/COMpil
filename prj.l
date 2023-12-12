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
BEGIN return begin-lex ;
END return end-lex ;
 "+" return add;
    "-" return minus;
    "*" return mult;
 "/" return div;
{idf_lex}  {return idf; };
{nbre_lex}   {return nbre;}; 
{nbrr_lex}   {return nbrr; };
[  \t]  
[\n]  {nb_ligne++;};
.   {printf("erreur lexical dans la ligne %d \n",nb_ligne) return err;}
