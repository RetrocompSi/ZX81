 10 FOR N=0 TO 43
 20 PLOT 20,N
 30 PLOT N,21
 40 NEXT N
100 INPUT A$
120 FOR X =-5 TO 5 STEP .25
125 IF X=0 THEN NEXT X
130 LET Y=VAL A$
140 IF Y < 43 AND Y > -43 THEN PLOT X*2+20,Y/2+21
150 NEXT X
160 GOTO 100
