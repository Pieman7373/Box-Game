AxesOff
ZStandard
ZSquare
ZDecimal
GridOn
BorderColor 1
1->P:1->F
0->X:0->Y:0->N
//{9,13}->dim([A]
//Fill(0,[A]

Lbl 00
If P=1:Pt-On(X,Y,2,Red
If P=2:Pt-On(X,Y,2
DispGraph
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
//"Draw Point"
If N=1 and X=C and Y=D:Goto NA
If N=1 and ((X=C and (Y=D+1 or Y=D-1)) or (Y=D and (X=C+1 or X=C-1))):Goto OK
If N=1:Goto NA
Lbl OK
If P=1:Pt-On(X,Y,1,Red
If P=2:Pt-On(X,Y,1
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

If N=2:Goto DB


Lbl DB
//"Draw Box"
0->N
If P=1:Line(E,G,X,Y,Red
If P=2:Line(E,G,X,Y
//test for box
//draw letter
If P=1
Then
	2->P
	Goto 00
End
If P=2
Then
	1->P
	Goto 00
End
