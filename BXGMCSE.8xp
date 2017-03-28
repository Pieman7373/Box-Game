AxesOff
ZStandard
ZSquare
ZDecimal
GridDot
BorderColor 1
1->P:1->F
0->X:0->Y:0->N

Lbl 00
Pt-On(X,Y,2,Black
If F!=1
Pt-Off(A,B,2
0->F
X->A:Y->B
Lbl 01
getKey->K
If K
Then
If K=45:Stop
X-(K=24)+(K=26)->X
Y+(K=25)-(K=34)->Y
If abs(X)>6
	Then
		If abs(X)>X
		Then
			abs(X)-1->X
			Else
		~X+1->X
	End
	End
	If abs(Y)>4
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
If P=1:Pt-On(X,Y,1,Red
If P=2:Pt-On(X,Y,1
Lbl PL
getKey->K
If K=45:Goto 00

If K=24
Then
	X-1->C
	Y->D
End
If K=25
Then
	X->C
	Y+1->D
End
If K=26
Then
	X+1->C
	Y->D
End
If K=34
Then
	X->C
	Y-1->D
End
If (K=24) or (K=25) or (K=26) or (K=34):Goto DL
Goto PL


Lbl DL
1->F
If P=1
Then
	Pt-On(C,D,Red
	Line(X,Y,C,D,Red
End
If P=2
Then
	Pt-On(C,D
	Line(X,Y,C,D
End
Pt-Off(X,Y,2
C->X
D->Y
//test for box
//draw letter
If P=1
Then
	2->P
	Else
	1->P
End
Goto 00
