 10 REM SLALOM GAME
 20 LET X=10
 21 LET Y=0
 22 LET DX=0
 30 PRINT AT Y,X;"*"
 40 LET K$=INKEY$: IF K$="" THEN 40
 50 IF K$="0" THEN END
 60 IF K$="5" THEN LET DX=0
 70 IF K$="6" THEN LET DX=1
 80 IF K$="4" THEN LET DX=-1
 90 LET X=X+DX
100 IF X<1 THEN LET X=1
110 IF X>20 THEN LET X=20
120 IF Y=0 THEN LET Y=1
130 IF Y=1 THEN LET Y=0
140 GOTO 30
