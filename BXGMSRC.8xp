[i]BOXGAME
Begin
70->X->C
30->Y->D
1->F->P
FillScreen(149
SetColor(224
For(49
	FillCircle(C,D,4
	C+30->C
	If C>250
		D+30->D
		70->C
	End
End
SetTextFGColor(231
PrintStringXY(18,"BOXGAME: ICE VERSION",1,1
SetTextFGColor(24
det(74,2,3
PrintStringXY("1",30,30
PrintStringXY("2",280,30
Lbl 00
If P=1
	SetColor(149
	det(41,277,27,20,27
	SetColor(0
	det(41,27,27,18,27
End
If P=2
	SetColor(149
	det(41,27,27,18,27
	SetColor(0
	det(41,277,27,20,27
End
If F=0
	SetColor(0
	Circle(A,B,5
	Circle(A,B,6
End
0->F
SetColor(0
Circle(X,Y,5
Circle(X,Y,6
X->A
Y->B
Lbl 01
getKey->K
If K=4
	Y-30->Y
End
If K=2
	X-30->X
End
If K=1
	Y+30->Y
End
If K=3
	X+30->X
End
If K=15
	det(1
	Return
End
If K=9 or K=54
	Goto DP
End
If K
	If X<70
		250->X
	End
	If X>250
		70->X
	End
	If Y<30
		210->Y
	End
	If Y>210
		30->Y
	End
Goto 00
End
Goto 01
Return
Lbl DP
SetColor(128
FillCircle(X,Y,4
Lbl PL
getKey->K
If K=1
	X->G
	Y+30->H
	4->L
End
If K=2
	X-30->G
	Y->H
	1->L
End
If K=3
	X+30->G
	Y->H
	3->L
End
If K=4
	X->G
	Y-30->Y
	2->L
End
If K=9 or K=54 or K=15
	SetColor(223
	FillCircle(X,Y,4
	Goto 00
End
If K=1 or K=2 or K=3 or K=4
	Goto DL
End
Goto PL
Lbl DL
If (K=2 and X=70) or (K=1 and Y=210) or (K=3 and X=250) or (K=4 and Y=30)
	SetColor(224
	FillCircle(X,Y,4
	Goto 00
End
SetColor(128
Line(X,Y,G,H
FillCircle(G,H,4
X->A
Y->B
G->X
H->Y
prgmPXLTEST
If P=1
	2+P
Else
	1->P
End
Goto 00
Return
