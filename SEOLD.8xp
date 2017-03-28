AxesOff
ZStandard
ZSquare
ZDecimal
GridOn
Line(~4,3,~4,~3
Line(~4,3,~4,~3,0
Line(4,3,4,~3
Line(4,3,4,~3,0
1->F:1->P
0->X:0->Y:0->N
Lbl 00
//Text(2,4,1
//Text(12,2,"|L
//Text(12,6,G
//Text(20,2,"[p]
//Text(20,6,I
//Text(2,84,2
//Text(12,82,"|L
//Text(12,86,H
//Text(20,82,"[p]
//Text(20,86,J
If E=1
Then
	Pxl-Off(5,82
	Pxl-Off(5,88
	Pxl-On(5,2
	Pxl-On(5,8
End
If E=2
Then
	Pxl-On(5,82
	Pxl-On(5,88
	Pxl-Off(5,2
	Pxl-Off(5,8
End
Pt-On(X,Y,3
If F!=1
Pt-Off(A,B,3
Pt-On(A,B,1
0->F
X->A:Y->B
Lbl 01
getKey->K
If K
Then
If K=45:Stop
X-(K=24)+(K=26)->X
Y+(K=25)-(K=34)->Y
If abs(X)>3
	Then
		If abs(X)>X
		Then
			abs(X)-1->X
			Else
		~X+1->X
	End
	End
	If abs(Y)>3
	Then
		If abs(Y)>Y
		Then
			abs(Y)-1->Y
			Else
		~Y+1->Y
	End
	End
	If (K=21) or (K=105):Goto DP
Goto 00
End
Goto 01

Lbl DP
//"Draw Point"
If N=1 and X=C and Y=D:Goto NA
If N=1 and ((X=C and (Y=D+1 or Y=D-1)) or (Y=D and (X=C+1 or X=C-1))):Goto OK
If N=1:Goto NA
Lbl OK
Pt-On(X,Y,2
X->C:Y->D
If N=0
Then
	C->E
	D->G
End
N+1->N
Lbl NA
//"Not Adjacent"
1->F
If N=1:Goto 00

If N=2:Goto DL



Lbl DL
//"Draw Line"
0->N
Line(E,G,X,Y
//draws line
//test for box
//draw letter
If P=1
Then
	2->P
	Else
	1->P
End
Goto 00
