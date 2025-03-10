   2 CLS
   3 GOSUB 700
   4 PRINT AT 21,0;"BEH0VER DU EN RADAR? (J/N)"
   5 INPUT R$
   6 IF R$="" THEN GOTO 5
   7 IF R$(1)<>"N" AND R$<>"J" THEN GOTO 5
   8 CLS
   9 LET MOV=0
  10 FAST
  20 DIM A(225)
  30 FOR N=1 TO 15
  40 LET A(N)=1
  50 LET A(N+210)=1
  60 LET A(N*15)=1
  70 LET A(N*15-14)=1
  80 NEXT N
  90 FOR N=2 TO 12 STEP 2
 110 LET X=INT (RND*11)+1
 120 FOR M=0 TO 3
 130 LET A(15*N+X+M)=1
 140 NEXT M
 150 NEXT N
 160 FOR N=2 TO 11 STEP 2
 180 LET X=INT (RND*10+2)
 190 FOR M=0 TO 45 STEP 15
 200 LET A(15*X+M+N)=1
 210 NEXT M
 218 NEXT N
 221 PRINT AT 3,0;" F0RFLYTTA: N=NORD, S=SYD,                  O=OST,  V=VAST."
 222 PRINT AT 5,0;" F0R ATT GE UPP: G"
 223 PRINT AT 6,0;" F0R ATT VRIDA ETT HALVT VARV: H"
 224 PRINT AT 1,0;"F0RFLYTTNINGAR:"
 230 LET A(203)=0
 235 LET A(8)=0
 240 LET P=203
 245 LET LM=-15
 250 IF R$(1)="N" THEN GOTO 256
 251 FOR N=1 TO 15
 252 FOR M=48 TO 63
 253 PLOT M,N
 254 NEXT M
 255 NEXT N
 256 SLOW
 257 PRINT AT 0,0;"DU TITTAR I"
 258 IF R$(1)="J" THEN PRINT AT 12,27;"N"
 259 GOTO 260
 260 GOSUB 9890
 261 LET A(P)=2
 265 UNPLOT 55,15
 270 IF LM=-15 THEN GOSUB 9750
 280 IF LM=1 THEN GOSUB 9700
 290 IF LM=15 THEN GOSUB 9650
 300 IF LM=-1 THEN GOSUB 9600
 305 PRINT AT 1,16;MOV
 310 LET Y=INT (P/15)
 320 LET X=P-Y*15
 325 LET Y=15-Y
 330 UNPLOT 47+X,Y
 340 INPUT Z$
 342 IF Z$="H" THEN LET LM=-LM
 345 IF Z$="H" THEN GOTO 260
 346 IF Z$="G" THEN GOTO 500
 360 IF Z$="N" THEN LET LM=-15
 370 IF Z$="S" THEN LET LM=15
 380 IF Z$="O" THEN LET LM=1
 390 IF Z$="V" THEN LET LM=-1
 400 IF Z$<>"N" AND Z$<>"S" AND Z$<>"V" AND Z$<>"O" AND Z$<>"H" AND Z$<>"G" THEN GOTO 340
 405 IF A(P+LM)=1 THEN GOTO 340
 410 LET P=P+LM
 415 IF R$(1)="J" THEN PLOT 47+X,Y
 417 LET MOV=MOV+1
 420 IF P<>8 THEN GOTO 260
 425 CLS
 430 PRINT AT 0,0;"DU AR UTE UR LABYRINTEN,"
 500 IF Z$="G" THEN CLS
 501 PRINT AT 1,0;"EFTER ";MOV;" F0RFLYTTNINGAR."
 503 PRINT 
 505 FOR M=0 TO 210 STEP 15
 510 FOR N=1 TO 15
 520 IF A(N+M)=1 THEN PRINT "\::";
 525 IF A(N+M)=2 THEN PRINT "\@@";
 530 IF A(N+M)=0 THEN PRINT " ";
 540 NEXT N
 550 PRINT 
 560 NEXT M
 570 PRINT AT 21,0;"VILL DU SPELA IGEN? (J/N)"
 580 INPUT Z$
 585 IF Z$="" THEN GOTO 580
 590 IF Z$(1)="J" THEN RUN 
 600 IF Z$(1)<>"N" THEN GOTO 580
 610 STOP
 620 SAVE "3D-LABYRIN%T"
 630 RUN 
 700 LET X=9
 705 PRINT TAB X;" \##\##\##\##\:   \##\##\##\: "
 710 PRINT TAB X;"\##\:    \##\:  \##\:  \##\: "
 720 PRINT TAB X;"  \##\##\##\:   \##\:   \##\: "
 730 PRINT TAB X;"     \##\:  \##\:   \##\: "
 740 PRINT TAB X;"\##\:    \##\:  \##\:  \##\: "
 750 PRINT TAB X;" \##\##\##\##\:   \##\##\##\: "
 760 LET X=3
 770 PRINT 
1000 PRINT TAB X;"\:   \ .\''\''\. \:'\''\'.\ '\.  \.'\ :\''\''\. \':\' \:. \ :\ '\':\''"
1010 PRINT TAB X;"\:   \ :\..\..\: \:'\''\'. \ '\.' \ :\..\..\' \ : \: \'.\ : \ :"
1020 PRINT TAB X;"\:.\..\..\ :  \: \:.\..\.'  \:  \ : \ '\. \.:\. \:  \': \ :"
1025 PRINT 
1026 PRINT 
1027 PRINT 
1028 PRINT 
1030 PRINT "DU BEFINNER DIG INNE I EN"
1040 PRINT "LABYRINT.",,"TA DIG UT SA FORT SOM M0JLIGT."
1050 RETURN
9600 IF A(P-1)=1 THEN GOSUB 9790
9610 IF A(P-15)=1 THEN GOSUB 9810
9620 IF A(P+15)=1 THEN GOSUB 9850
9630 PRINT AT 0,12;"VASTLIG RIKTNING "
9640 RETURN
9650 IF A(P+15)=1 THEN GOSUB 9790
9660 IF A(P-1)=1 THEN GOSUB 9810
9670 IF A(P+1)=1 THEN GOSUB 9850
9680 PRINT AT 0,12;"SYDLIG RIKTNING "
9690 RETURN
9700 IF A(P+1)=1 THEN GOSUB 9790
9710 IF A(P+15)=1 THEN GOSUB 9810
9720 IF A(P-15)=1 THEN GOSUB 9850
9730 PRINT AT 0,12;"OSTLIG RIKTNING "
9740 RETURN
9750 IF A(P-15)=1 THEN GOSUB 9790
9760 IF A(P+1)=1 THEN GOSUB 9810
9770 IF A(P-1)=1 THEN GOSUB 9850
9780 PRINT AT 0,12;"NORDLIG RIKTNING "
9785 RETURN
9790 PRINT AT 13,7;"\..\..\..\..\..\..";TAB 7;" ";TAB 12;" ";AT 16,7;" ";TAB 12;" ";TAB 7;"\''\''\''\''\''\''"
9800 RETURN
9810 PRINT AT 13,13;"  \ :";AT 17,13;"  \ :"
9820 PRINT AT 12,14;"\.'\':";AT 13,13;"\:'"
9830 PRINT AT 18,14;"\'.\.:";AT 17,13;"\:."
9840 RETURN
9850 PRINT AT 13,4;"\:   ";AT 17,4;"\:   "
9860 PRINT AT 12,4;"\:'\'.";AT 13,6;"\':"
9870 PRINT AT 18,4;"\:.\.'";AT 17,6;"\.:"
9880 RETURN
9890 PRINT AT 9,0;"\''\.                 \ .\''"
9900 PRINT " \ '\'.              \.'\'  "
9910 PRINT "   \''\.           \ .\''   "
9920 PRINT "    \:           \ :    "
9930 PRINT "    \:.\..\..\.     \ .\..\..\.:    "
9940 PRINT "    \:  \ :\ '    \' \:  \ :    "
9945 PRINT "    \:  \ :      \:  \ :    "
9950 PRINT "    \:  \ :\ .    \. \:  \ :    "
9960 PRINT "    \:'\''\''\'     \ '\''\''\':    "
9970 PRINT "    \:           \ :    "
9980 PRINT "   \..\'           \ '\..   "
9990 PRINT " \ .\.'              \'.\.  "
9995 PRINT "\..\'                 \ '\.."
9997 RETURN
