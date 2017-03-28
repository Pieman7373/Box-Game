AxesOff
ZStandard
ZSquare
ZDecimal
GridOn
Line(~4,3,~4,~3
Line(~4,3,~4,~3,0
Line(4,3,4,~3
Line(4,3,4,~3,0
{6,6}->dim([A]
Fill(0,[A]
1->F:1->E
0->X:0->Y:0->A:0->B:0->C:0-D:0->G:0->H:0->I:0->J
//[A]-Position of initials
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
//O-row of matrix
//P-column of matrix
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
If K=45
Then
	Pt-Off(X,Y,2
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
	1->L
End
If K=26
Then
	//right
	X+1->C
	Y->D
	0->L
End
If K=34
Then
	//down
	X->C
	Y-1->D
	1->L
End
If (K=24) or (K=25) or (K=26) or (K=34):Goto DL
Goto PL

Lbl DL
1->F
Line(X,Y,C,D
Pt-Off(X,Y,3
Pt-On(C,D,2
C->X
D->Y
int((Y-Ymin)/(Ymax-Ymin)*62)->M
int((X-Xmin)/(Xmax-Xmin)*94)->N
If L=1 or L=3
//If line is horizontal
Then
	//*/test point is taken from x,y (end of line that was just drawn)/*
	
	If L=1
	Then
		If pxl-Test(M+10,N+5)pxl-Test(M+5,N)pxl-Test(M+5,N+10)not([A](1,1)=1)
		Then
			Text(~1,0,0,"Hooray
			//draw and store shit
			End
		End
	//test up .5 and down .5
	//move test point .5 to the right and test 1 up and 1 down
	//move test point .5 to right and test up .5 and down .5
	//Store yes or no: End
	
	//If L=3 
	//Then
	//test point .5 up and .5 down
	//move point .5 to left and test up 1 and down 1
	//move point .5 to left and test up .5 and down .5
	//store yes or no: End 
	//If yes:
	//Test for upper initial
	//If no initial:goto IU
	//If initial, 
	//test lower initial:
	//If initial: decrement G or H: preserve E:Goto 0:
End



If E=1
Then
	2->E
	G+1->G
	Else
	1->E
	H+1->H
End
Goto 00
