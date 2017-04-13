AxesOff
ZStandard
ZSquare
ZDecimal
GridOn
BorderColor 1
Lbl GG
Line(~6,4.5,~6,~4.5,0
Line(~6.05,4.5,~6.05,~4.5,0
Line(6,4.5,6,~4.5,0
Line(5.95,4.5,5.95,~4.5,0
Line(~5,4.5,~5,~4.5,0
Line(~5.05,4.5,~5.05,~4.5,0
Line(5,4.5,5,~4.5,0
Line(4.95,4.5,4.95,~4.5,0

1->E:1->F
0->X:0->Y:0->N

TextColor(Red
Text(~1,5,22,1
TextColor(Blue
Text(~1,5,236,2
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
If abs(X)>4
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
If E=1:Pt-On(X,Y,1,Red
If E=2:Pt-On(X,Y,1
Lbl PL
getKey->K
If K=45 or K=21 or K=105:Goto 00

If K=24
Then
	X-1->C
	Y->D
	1->L
End
If K=25
Then
	X->C
	Y+1->D
	2->L
End
If K=26
Then
	X+1->C
	Y->D
	3->L
End
If K=34
Then
	X->C
	Y-1->D
	4->L
End
If (K=24) or (K=25) or (K=26) or (K=34):Goto DL
Goto PL


Lbl DL
If (K=24 and X=~4) or (K=25 and Y=4) or (K=26 and X=4) or (K=34 and Y=~4)
Then
	Pt-On(X,Y,White
	Pt-On(X,Y,MedGray
	Goto 00
End
1->F
0->Q
If E=1
Then
	Pt-On(C,D,Red
	Line(X,Y,C,D,Red
End
If E=2
Then
	Pt-On(C,D
	Line(X,Y,C,D
End
Pt-Off(X,Y,2
C->X
D->Y
165-int((Y-Ymin)/(Ymax-Ymin)*165)->M
int((X-Xmin)/(Xmax-Xmin)*265)+1->N
Text(~1,30,0,"  
If L=1 or L=3
Then
	If L=1:N+9->N
	If L=3:N-11->N
	If Y=4 or Y=~4
	Then
		If Y=4
		Then
			Text(45,2,"  
			Text(50,2,"  
			Text(65,2,"  
			//Pxl-Change(M+19,N
			//Pxl-Change(M+9,N+10
			//Pxl-Change(M+9,N-10
			Text(15,2,pxl-Test(M+19,N)
			Text(30,2,pxl-Test(M+9,N+10)
			Text(45,2,pxl-Test(M+9,N-10
		If pxl-Test(M+19,N)pxl-Test(M+9,N+10)pxl-Test(M+9,N-10
		Then
				1->Q
				If E=1:TextColor(Red
				If E=2:TextColor(Blue
				Text(~1,30,0,"Hv
				Pxl-Change(M+9,N
				If not(pxl-Test(M+9,N
				//if on top row
			Then
			If E=1
			Then
				Text(M+2,N-1,1
						I+1->I
				End
			If E=2
			Then
				Text(M+2,N-1,2
						J+1->J
				End
				End
	End
		End
		If Y=~4
		Then
			If pxl-Test(M-11,N)pxl-Test(M-6,N-5)pxl-Test(M-6,N+5
			Then
				//1->Q
				//If E=1:TextColor(Red
				//If E=2:TextColor(Blue
				//Text(~1,30,0,"H^
				//If not(pxl-Test(M-6,N
				////if on bottom row
				//Then
				//If E=1
					//Then
						//TextColor(Red
					//Text(M-9,N-1,1
						//I+1->I
				//End
				//If E=2
					//Then
						//TextColor(Blue
					//Text(M-9,N-1,2
						//J+1->J
					//End
					//End
	End
End
Else
	If pxl-Test(M+19,N)pxl-Test(M+9,N+10)pxl-Test(M+9,N-10
		Then
			1->Q
			If E=1:TextColor(Red
				If E=2:TextColor(Blue
				Text(~1,30,0,"Hv
				If not(pxl-Test(M+9,N
			//normal vv
			Then
			If E=1
			Then
				Text(M+2,N+1,1
					I+1->I
				End
			If E=2
			Then
				Text(M+2,N+1,2
					J+1->J
				End
				End
	End
	If pxl-Test(M-11,N)pxl-Test(M-6,N-5)pxl-Test(M-6,N+5
		Then
			//1->Q
				//If E=1:TextColor(Red
				//If E=2:TextColor(Blue
			//Text(~1,30,0,"H^
			//If not(pxl-Test(M-6,N
			////normal ^^
			//Then
			//If E=1
			//Then
				//Text(M-9,N-1,1
					//I+1->I
			//End
			//If E=2
			//Then
				//Text(M-9,N-1,2
					//J+1->J
				//End
				//End
	End
End
End

If L=2 or L=4
Then
	If L=2:M+4->M
	If L=4:M-6->M
	If pxl-Test(M,N+9)pxl-Test(M-5,N+4)pxl-Test(M+5,N+4
	Then
		//1->Q
			//If E=1:TextColor(Red
			//If E=2:TextColor(Blue
		//Text(~1,30,0,"V>
		//If not(pxl-Test(M,N+4
		////normal >>
		//Then
		//If E=1
		//Then
			//Text(M-3,N+3,1
				//I+1->I
		//End
		//If E=2
		//Then
			//Text(M-3,N+3,2
				//J+1->J
			//End
			//End
	End
	If pxl-Test(M,N-11)pxl-Test(M-5,N-6)pxl-Test(M+5,N-6
	Then
		//1->Q
		//Text(~1,30,0,"V<
		//If not(pxl-Test(M,N-6
		////normal <<
		//Then
		//If E=1
		//Then
			//Text(M-3,N-7,1
				//I+1->I
		//End
		//If E=2
		//Then
			//Text(M-3,N-7,2
				//J+1->J
			//End
			//End
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
	Text(~1,16,,"Player 1!!
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
