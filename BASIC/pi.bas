10 REM ADOPTED FROM COMMODORE BASIC
20 N = 100: REM N MAY BE INCREASED, BUT WILL SLOW EXECUTION
30 LN = INT(10*N/3)+16
40 ND = 1
50 DIM A(LN)
60 N9 = 0
70 PD = 0:REM FIRST PRE-DIGIT IS A 0
80 REM
90 FOR J = 1 TO LN
100    A(J-1) = 2:REM START WITH 2S
110 NEXT J
120 REM
130 FOR J = 1 TO N
140     Q = 0
150     FOR I = LN TO 1 STEP -1:REM WORK BACKWARDS
160         X = 10*A(I-1) + Q*I
170         A(I-1) = X - (2*I-1)*INT(X/(2*I-1)):REM X-INT(X/Y)*Y
180         Q = INT(X/(2*I - 1))
190     NEXT I
200     A(0) = Q-10*INT(Q/10)
210     Q = INT(Q/10)
220     IF Q=9 THEN N9 = N9 + 1: GOTO 450
240     IF Q<>10 THEN GOTO 350
250     REM Q == 10
260        D = PD+1: GOSUB 500
270        IF N9 <= 0 THEN GOTO 320
280           FOR K = 1 TO N9
290              D = 0: GOSUB 500
300           NEXT K
310        REM END IF
320        PD = 0
330        N9 = 0
335        GOTO 450
340     REM Q <> 10
350        D = PD: GOSUB 500
360        PD = Q
370        IF N9 = 0 THEN GOTO 450
380           FOR K = 1 TO N9
390              D = 9: GOSUB 500
400           NEXT K
410           N9 = 0
450 NEXT J
460 PRINT PD
470 END
480 REM
490 REM OUTPUT DIGITS
500 IF ND=0 THEN PRINT D;: RETURN
510 IF D=0 THEN RETURN
520  PRINT D;".";
530 ND = 0
550 RETURN