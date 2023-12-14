%{
#include "prj.tab.h" 
#include <stdbool.h>
extern  int nb_ligne ;
extern YYSTYPE yylval;

//je vais commencer ma table de symbole
typedef struct
{
char NomEntite[20];
char CodeEntite[20];
char TypeEntite[20];
} TypeTS;

//initiation d'un tab qui contient les elements de ma table

TypeTS ts[100];
//compteur global pour ma table
int CpTabSym=0;
 
//definir une fonction de recherche 
int recherche(char entite[])
{
int i=0;
while(i<CpTabSym)
{
if (strcmp(entite,ts[i].NomEntite)==0) return i;
i++;
}

return -1;
}

//definir une fonction d'insertion

void inserer(char entite[], char code[])
{
if ( recherche(entite)==-1)
{
strcpy(ts[CpTabSym].NomEntite,entite);
strcpy(ts[CpTabSym].CodeEntite,code);
CpTabSym++;
}
}

//definir la fonction afficher

void afficher ()
{
printf("\n/***************Table des symboles ******************/\n");
printf("________________________\n");
printf("\t| NomEntite | CodeEntite |TypeEntite \n");
printf("________________________\n");
int i=0;
while(i<CpTabSym)
{
printf("\t|%10s |%12s |%12s \n",ts[i].NomEntite,ts[i].CodeEntite,ts[i].TypeEntite);
i++;
}
}

//fonction pour inserer le type

void inserertype(char entite[], char type[])
{
int pos;
 pos=recherche(entite)
if (pos!=-1)

strcpy(ts[pos].TypeEntite,type);

}






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
INT      { yylval.str=strdup("Entier");return int_lex;} ;
FLOAT    {yylval.str=strdup("Reel");return float_lex;};
BOOL     {yylval.str=strdup("Boolean");return bool_lex;};
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
  ">" return bigger_lex ;
   ">=" return biggereq_lex;
   "<" return less_lex ;
   "<=" return lessreq_lex;
   "<>" return noeql_lex;
For return bocleinst;
{idf_lex}  {  if (yyleng<=10) {inserer(yytext,"idf");
                                return idf;  }
             else printf("erreur lexical a la ligne %d\n ce identificateur est tres long",nb_ligne);
            };
{nbre_lex}   {return nbre;}; 
{nbrr_lex}   {return nbrr; };
[  \t]
comment
[\n]  {nb_ligne++;};
.   {printf("erreur lexical dans la ligne %d \n dans l'entite %s",nb_ligne , yytext); return err;}
