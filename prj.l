%{
#include "prj.tab.h" 
#include <stdio.h>
int nb_ligne = 1;
int nb_colonne = 1;
%}
idf_lex [A-Z]"_"?[a-zA-Z0-9]*
nbre_lex "-"?[0-9]+
nbrr_lex "-"?[0-9]+\.[0-9]+
%%
CONST      return const_lex; 
":="       return aff;
";"        return pvg; 
INT      return int_lex; ;
FLOAT      return float_lex; 
BOOL       return bool_lex; 
FALSE      return false_lex; 
TRUE       return true_lex; 
{idf_lex}  return idf; 
{nbre_lex}   return nbre; 
{nbrr_lex}   return nbrr; 
[ \t]  nb_colonne++;
[\n]  nb_colonne=1;nb_ligne++;
.   printf("erreur lexical dans la ligne %d et la colonne %d\n",nb_ligne,nb_colonne);
