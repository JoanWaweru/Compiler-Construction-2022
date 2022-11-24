%{
#include<stdio.h>
#include<math.h>
%}

%union {float num;char *trig;}
%start line
%token <num> number
%token <trig> cos1
%token <trig> sin1
%token <trig> tan1
%type <num> exp

%%

line     : exp ';'
     | line exp ';'
     ;

exp : number  {$$=$1;}  //10
    | exp '+' number  {$$=$1+$3;printf("\n%f+%f=%f\n",$1,$3,$$);}
    | exp '-' number  {$$=$1-$3;printf("\n%f-%f=%f\n",$1,$3,$$);}
    | exp '*' number  {$$=$1*$3;printf("\n%f*%f=%f\n",$1,$3,$$);}
    | exp '/' number  {$$=$1/$3;printf("\n%f/%f=%f\n",$1,$3,$$);}
    | cos1 number     {printf("%f",cos(($2/180)*3.14));}
    | sin1 number     {printf("%f",sin(($2/180)*3.14));}
    | tan1 number     {printf("%f",tan(($2/180)*3.14));}
    ;

%%

int main(){
printf("Enter an expression : \n");

yyparse();
}
yyerror(){
}

