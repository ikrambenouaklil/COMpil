%{
#include <stdio.h>
#include "prj.tab.h"
main(){int nb_ligne = 1, nb_colonne = 1;}

%}

idf_lex [A-Z]"_"?[a-zA-Z0-9]*
nbre_lex "-"?[0-9]+
nbrr_lex "-"?[0-9]+\.[0-9]+


%%
CONST    { nb_colonne ++; return const_lex; };
:=       { nb_colonne ++; return aff; };
;        { nb_colonne++; return pvg; };
INT      { nb_colonne++; return int_lex; };
FLOAT    { nb_colonne++; return float_lex; };
BOOL     { nb_colonne++; return bool_lex; };
FALSE    { nb_colonne++; return false_lex; };
TRUE     { nb_colonne++; return true_lex; };
{idf_lex} { nb_colonne ++; return idf; };
{nbre_lex}  { nb_colonne ++; return nbre; };
{nbrr_lex}  { nb_colonne ++; return nbrr; };
">"      { nb_colonne ++; return  bigger_lex;}; 
">="     { nb_colonne ++; return  biggereq_lex;}; 
"<"      { nb_colonne ++; return less_lex;};
"<="     { nb_colonne ++; return lessreq_lex;}; 
"=="     { nb_colonne ++; return eq_lex;} ;
"<>"      { nb_colonne ++; return noteq_lex;} ;
"+"    { nb_colonne ++; return add;} ;
"-"    { nb_colonne ++; return minus;} ;
"*"    { nb_colonne ++; return mult;} ;
"/"    { nb_colonne ++; return div;} ;
\n { nb_colonne=1;nb_ligne++;};
. printf("erreur lexical dans la ligne %d et la colonne %d\n",nb_ligne,nb_colonne);
