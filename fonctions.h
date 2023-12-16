#include <string.h>
#include <stdio.h>
#include <stdlib.h>

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
 pos=recherche(entite);
if (pos!=-1)
strcpy(ts[pos].TypeEntite,type);

}
