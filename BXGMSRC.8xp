iBOXGAME
det(0
70->X->C
30->Y->D
1->F->P
det(5,149
det(2,224
For(49
	det(40,C,D,4
	C+30->C
	If C>250
		D+30->D
		70->C
	End
End
det(21,231
det(18,"BOXGAME: ICE VERSION",1,1
det(21,24
det(74,2,3
det(18,"1",30,30
det(18,"2",280,30
Lbl 00
If P=1
	det(2,149
	det(41,277,27,20,27
	det(2,0
	det(41,27,27,18,27
End
If P=2
	det(2,149
	det(41,27,27,18,27
	det(2,0
	det(41,277,27,20,27
End
If F=0
	det(2,224
	det(33,A,B,5
	det(33,A,B,6
End
0->F
det(2,0
det(33,X,Y,5
det(33,X,Y,6
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
det(2,128
det(34,X,Y,4
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
	det(2,223
	det(34,X,Y,4
	Goto 00
End
If K=1 or K=2 or K=3 or K=4
	Goto DL
End
Goto PL
Lbl DL
If (K=2 and X=70) or (K=1 and Y=210) or (K=3 and X=250) or (K=4 and Y=30)
	det(2,224
	det(34,X,Y,4
	Goto 00
End
det(2,128
det(30,X,Y,G,H
det(34,G,H,4
X->A
Y->B
G->X
H->Y
If P=1
	2+P
Else
	1->P
End
Goto 00
Return
