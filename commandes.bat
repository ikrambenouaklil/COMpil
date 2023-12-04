flex prj.l
bison -d prj.y
gcc lex.yy.c prj.tab.c  -ly -lfl   -o prj.exe
