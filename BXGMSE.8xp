AxesOff
ZStandard
ZSquare
ZDecimal
GridOn
Lbl GG
Line(~4,3,~4,~3
Line(~4,3,~4,~3,0
Line(4,3,4,~3
Line(4,3,4,~3,0
1->F:1->E
0->X:0->Y:0->A:0->B:0->C:0-D:0->G:0->H:0->I:0->J
//A-X of last position
//B-Y or last position
//C-X of end point
//D-Y of end point
//E-Which player
//F-not erase or erase
//G-P1 lines
//H-P2 lines
//I-P1 initials
//J-P2 initials
//L-Drawn Line orientation 1=left,2=up,3=right,4=down
//M-row(y) of point
//N-column(x) of point
//Q-0=no box 1=box
//X-X of current point
//Y-Y of current point
Lbl 00
Text(2,4,1
Text(12,2,"|L
Text(12,6,G
Text(20,2,"[p]
Text(20,6,I
Text(2,84,2
Text(12,82,"|L
Text(12,86,H
Text(20,82,"[p]
Text(20,86,J
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
Pt-On(X,Y,2
Lbl PL
getKey->K
If (K=45) or (K=21) or (K=105)
Then
	Pt-Off(X,Y,2
	Pt-On(X,Y,3
	Goto 00
End
If K=24
Then
	//left
	X-1->C
	Y->D
	1->L
End
If K=25
Then
	//up
	X->C
	Y+1->D
	2->L
End
If K=26
Then
	//right
	X+1->C
	Y->D
	3->L
End
If K=34
Then
	//down
	X->C
	Y-1->D
	4->L
End
If (K=24) or (K=25) or (K=26) or (K=34):Goto DL
Goto PL
Lbl DL
If (K=24 and X=~3) or (K=25 and Y=3) or (K=26 and X=3) or (K=34 and Y=~3)
Then
	Pt-Off(X,Y,2
	Pt-On(X,Y,3
	Goto 00
End
1->F
0->Q
Line(X,Y,C,D
Pt-Off(X,Y,3
Pt-On(C,D,2
C->X
D->Y
63-int((Y-Ymin)/(Ymax-Ymin)*63)->M
int((X-Xmin)/(Xmax-Xmin)*95)+1->N
If L=1 or L=3
Then
	If L=1:N+4->N
	If L=3:N-6->N
	If M=2 or M=62
	Then
		If M=2
		Then
		If pxl-Test(M+9,N)pxl-Test(M+4,N-5)pxl-Test(M+4,N+5
		Then
			1->Q
			//Text(~1,30,0,"Hv
				If not(pxl-Test(M+4,N
				//if on top row
			Then
			If E=1
			Then
				Text(M+1,N-1,1
						I+1->I
				End
			If E=2
			Then
				Text(M+1,N-1,2
						J+1->J
				End
				End
	End
		End
		If M=62
		Then
			If pxl-Test(M-11,N)pxl-Test(M-6,N-5)pxl-Test(M-6,N+5
			Then
				1->Q
				//Text(~1,30,0,"H^
				If not(pxl-Test(M-6,N
				//if on bottom row
				Then
				If E=1
				Then
					Text(M-9,N-1,1
						I+1->I
				End
				If E=2
				Then
					Text(M-9,N-1,2
						J+1->J
					End
					End
	End
End
Else
	If pxl-Test(M+9,N)pxl-Test(M+4,N-5)pxl-Test(M+4,N+5
		Then
			1->Q
			//Text(~1,30,0,"Hv
			If not(pxl-Test(M+4,N
			//normal vv
			Then
			If E=1
			Then
				Text(M+1,N-1,1
					I+1->I
				End
			If E=2
			Then
				Text(M+1,N-1,2
					J+1->J
				End
				End
	End
	If pxl-Test(M-11,N)pxl-Test(M-6,N-5)pxl-Test(M-6,N+5
		Then
			1->Q
			//Text(~1,30,0,"H^
			If not(pxl-Test(M-6,N
			//normal ^^
			Then
			If E=1
			Then
				Text(M-9,N-1,1
					I+1->I
			End
			If E=2
			Then
				Text(M-9,N-1,2
					J+1->J
				End
				End
	End
End
End

If L=2 or L=4
Then
	If L=2:M+4->M
	If L=4:M-6->M
	If pxl-Test(M,N+9)pxl-Test(M-5,N+4)pxl-Test(M+5,N+4
	Then
		1->Q
		//Text(~1,30,0,"V>
		If not(pxl-Test(M,N+4
		//normal >>
		Then
		If E=1
		Then
			Text(M-3,N+3,1
				I+1->I
		End
		If E=2
		Then
			Text(M-3,N+3,2
				J+1->J
			End
			End
	End
	If pxl-Test(M,N-11)pxl-Test(M-5,N-6)pxl-Test(M+5,N-6
	Then
		1->Q
		//Text(~1,30,0,"V<
		If not(pxl-Test(M,N-6
		//normal <<
		Then
		If E=1
		Then
			Text(M-3,N-7,1
				I+1->I
		End
		If E=2
		Then
			Text(M-3,N-7,2
				J+1->J
			End
			End
	End
End

If Q=1
Then
	If E=1:G+1->G
	If E=2:H+1->H
	Else
	
If E=1
Then
	2->E
	G+1->G
	Else
	1->E
	H+1->H
	End
End
If I+J=36:Goto XX
Goto 00
Lbl XX
ClrDraw
Text(10,26,"The Winner is
If I=J
Then
	Text(~1,20,16,"It's a tie!!
	Else
If I>J
Then
	Text(~1,20,16,"Player 1!!
	Else
	Text(~1,20,16,"Player 2!!
	End
	End
Text(30,30,"1) Play Again"
Text(38,30,"2) Quit
Lbl KK
getKey->K
If K=92:Goto GG
If K=93:Stop
Goto KK
