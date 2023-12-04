flex prj.l
bison -d prj.y
gcc lex.yy.c prj.tab.c -ltl -ly -o prj.exe