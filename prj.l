%{
#include <stdio.h>
#include "prj.tab.h"
main(){int nb_ligne = 1, nb_colonne = 1;}

%}

idf_lex [A-Z]"_"?[a-zA-Z0-9]*
conste_lex "-"?[0-9]+
constr_lex "-"?[0-9]+\.[0-9]+
varint_lex "-"?[0-9]+
varfloat_lex "-"?[0-9]+\.[0-9]+

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
{conste_lex}  { nb_colonne ++; return conste; };
{constr_lex}  { nb_colonne ++; return constr; };
{varint_lex}  { nb_colonne ++; return varint; };
{varfloat_lex}  { nb_colonne ++; return varfloat; };
>      { nb_colonne ++; return  bigger_lex;}; 
>=     { nb_colonne ++; return  biggereq_lex;}; 
<      { nb_colonne ++; return less_lex;};
<=     { nb_colonne ++; return lessreq_lex;}; 
==     { nb_colonne ++; return eq_lex;} ;
<>      { nb_colonne ++; return noteq_lex;} ;
\n nb_ligne++;
. printf("erreur lexical dans la ligne %d et la colonne %d\n",nb_ligne,nb_colonne);
