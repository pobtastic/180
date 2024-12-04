; Copyright Mastertronic 1986, 2024 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @org=$4000
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#ANIMATE(delay,count=$50)(name=$a)*$name-1,$delay;#FOR$02,$count||x|$name-x|;||($name-animation))
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h 180 Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

b $6000 Graphics: Dart Board
@ $6000 label=DartBoard
D $6000 Used by the routine at #R$A7A5.
. #PUSHS #UDGTABLE
. { =h Play Area }
. { #SIM(start=$A7A5,stop=$A7D0)#SCR$02(dart-board) }
. UDGTABLE# #POPS
. #PUSHS #SIM(start=$9195,stop=$919E)
  $6000,$1800,$20 Pixels.

b $7800

b $7B00

b $7C87

b $7D00 Graphics: Hand
@ $7D00 label=Graphics_Hand_01
D $7D00 Graphic data, arranged as.
N $7D00 Frame #N$01:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($7D00-$7E81-$01-$38)(hand-1) }
. UDGTABLE#
  $7D00,$188,$07
@ $7E88 label=Graphics_Hand_02
N $7E88 Frame #N$02:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($7E88-$8009-$01-$38)(hand-2) }
. UDGTABLE#
  $7E88,$188,$07
@ $8010 label=Graphics_Hand_03
N $8010 Frame #N$03:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($8010-$8191-$01-$38)(hand-3) }
. UDGTABLE#
  $8010,$188,$07
@ $8198 label=Graphics_Hand_04
N $8198 Frame #N$03:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($8198-$8319-$01-$38)(hand-4) }
. UDGTABLE#
  $8198,$188,$07

b $8320 Graphics: Hand Mask
@ $8320 label=Graphics_HandMask_01
D $8320 Graphic data, arranged as.
N $8320 Mask #N$01:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($8320-$84A1-$01-$38)(hand-mask-1) }
. UDGTABLE#
  $8320,$188,$07
@ $84A8 label=Graphics_HandMask_02
N $84A8 Mask #N$02:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($84A8-$8629-$01-$38)(hand-mask-2) }
. UDGTABLE#
  $84A8,$188,$07
@ $8630 label=Graphics_HandMask_03
N $8630 Mask #N$03:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($8630-$87B1-$01-$38)(hand-mask-3) }
. UDGTABLE#
  $8630,$188,$07
@ $87B8 label=Graphics_HandMask_04
N $87B8 Mask #N$04:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($87B8-$8939-$01-$38)(hand-mask-4) }
. UDGTABLE#
  $87B8,$188,$07

b $8940 Graphics: Hand (No Dart)
@ $8940 label=Graphics_HandNoDart
D $7D00 Graphic data, arranged as:
N $8940 #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($8940-$8AC1-$01-$38)(hand-no-dart) }
. UDGTABLE#
  $8940,$188,$07
@ $8AC8 label=Graphics_HandMaskNoDart
N $8AC8 Mask:
. #UDGTABLE(default)
. { #UDGARRAY$07,attr=$70,scale=$04,step=$07($8AC8-$8C49-$01-$38)(hand-mask-no-dart) }
. UDGTABLE#
  $8AC8,$188,$07

b $8C50 Graphics: Thrown Dart
@ $8C50 label=Graphics_ThrownDart
D $8C50 Graphic data, arranged as:
N $8C50 #UDGTABLE(default)
. { #UDGARRAY$03,attr=$70,scale=$04,step=$03($8C50-$8CDC-$01-$18)(thrown-dart) }
. UDGTABLE#
  $8C50,$90,$03
@ $8CE0 label=Graphics_Mask_ThrownDart
N $8CE0 Mask:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$70,scale=$04,step=$03($8CE0-$8D6D-$01-$18)(mask-thrown-dart) }
. UDGTABLE#
  $8CE0,$90,$03

u $8D70
B $8D70,$02

c $8D72 Game Entry Point Alias
@ $8D72 label=GameEntryPointAlias
  $8D72,$03 Jump to #R$9183.

b $8D75 Custom Font
@ $8D75 label=CustomFont
S $8D75,$80
  $8DF5,$08 #UDG(#PC,attr=$47)
L $8DF5,$08,$2E

b $8F65
  $8F65,$01
  $8F66,$01
  $8F67,$3F,$03

b $8FA6
  $8FA6,$01
  $8FA7,$01

b $8FC5
b $9000
b $903B
b $906A
b $90A7
b $90D8
b $9101
b $914A

c $9183 Game Entry Point
@ $9183 label=GameEntryPoint
  $9183,$07 Write #N$00 to; #LIST
. { *#R$99F5 }
. { *#R$99F6 }
. LIST#
  $918A,$01 Disable interrupts.
  $918B,$01 Switch to the shadow registers.
  $918C,$01 Stash #REGhl on the stack.
  $918D,$01 Switch back to the normal registers.
  $918E,$04 Write #REGsp to *#R$F827.
  $9192,$03 Call #R$95A9.
N $9195 Clear the screen buffer.
  $9195,$03 Call #R$964C.
B $9198,$01 #R$98CC.
B $9199,$01 #R$97D5(CLEAR SCREEN).
B $919A,$01
W $919B,$02
M $919A,$03 #R$98A8.
B $919D,$01 Terminator.
  $919E,$03 Jump to #R$933F.

c $91A1 Print Score
@ $91A1 label=Print_Score
  $91A1,$03 Call #R$964C.
B $91A4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $91A7,$02 INK: #INK(#PEEK(#PC+$01)).
B $91A9,$02 PAPER: #INK(#PEEK(#PC+$01)).
@ $91AB label=Messaging_Score
T $91AB,$09 #FONT#(:(#STR(#PC,$04,$09)))$8D75,attr=$47(score)
B $91B4,$01 Terminator.
  $91B5,$01 Return.

c $91B6 Set Attribute Buffer INK: WHITE
@ $91B6 label=SetAttributeBuffer_WhiteInk
N $91B6 For administration pages.
  $91B6,$03 #REGhl=#N$5800 (attribute buffer location).
  $91B9,$03 #REGde=#N$5801 (attribute buffer location).
  $91BC,$03 #REGbc=#N$02FF.
  $91BF,$02 Write #COLOUR$47 to *#REGhl.
  $91C1,$01 Halt operation (suspend CPU until the next interrupt).
  $91C2,$02 Copy another #N$02FF bytes from *#N$5800 to the end of the
. attribute buffer.
  $91C4,$01 Return.

c $91C5 Print Key
@ $91C5 label=Print_Key
E $91C5 Continue on to #R$91DD.
  $91C5,$01 Stash #REGaf on the stack.
  $91C6,$03 Call #R$964C.
T $91C9,$01
B $91CA,$01 Terminator.
  $91CB,$01 Restore #REGaf from the stack.
  $91CC,$04 Jump to #R$91F3 if #REGa is equal to #N$0D.
  $91D0,$04 Jump to #R$91FE if #REGa is equal to #N$20.
  $91D4,$05 Jump to #R$9209 if #REGa is greater than #N$04.
  $91D9,$04 Jump to #R$91E9 if #REGa is equal to #N$01.

c $91DD Print "Symbol Shift"
@ $91DD label=Print_SymbolShift
  $91DD,$03 Call #R$964C.
T $91E0,$07 #FONT#(:(#STR#(#PC),$0B($b==$FF)))$8D75,attr=$47(symbol-shift).
B $91E7,$01 Terminator.
  $91E8,$01 Return.

c $91E9 Print "Caps Lock"
@ $91E9 label=Print_CapsLock
  $91E9,$03 Call #R$964C.
T $91EC,$05 #FONT#(:(#STR#(#PC),$0B($b==$FF)))$8D75,attr=$47(caps-lock).
B $91F1,$01 Terminator.
  $91F2,$01 Return.

c $91F3 Print "Enter"
@ $91F3 label=Print_Enter
  $91F3,$03 Call #R$964C.
T $91F6,$06 #FONT#(:(#STR#(#PC),$0B($b==$FF)))$8D75,attr=$47(enter).
B $91FC,$01 Terminator.
  $91FD,$01 Return.

c $91FE Print "Space"
@ $91FE label=Print_Space
  $91FE,$03 Call #R$964C.
T $9201,$06 #FONT#(:(#STR#(#PC),$0B($b==$FF)))$8D75,attr=$47(space).
B $9207,$01 Terminator.
  $9208,$01 Return.

c $9209 Print " " (Space)
@ $9209 label=Print_ASCII_Space
  $9209,$03 Call #R$9736.
  $920C,$02 #REGa=ASCII space character (#N$20).
  $920E,$03 Jump to #R$9736.

c $9211
  $9211,$03 Call #R$965F.
  $9214,$03 Jump to #R$9211 if #REGa is zero.
  $9217,$01 Return.

c $9218 Messaging: Header/ Footer
@ $9218 label=Messaging_HeaderFooter
N $9218 #PUSHS #SIM(start=$9218,stop=$9252)
. #UDGTABLE(default)
.   { #SCR$01(header-footer) }
. UDGTABLE# #POPS
  $9218,$03 Call #R$9736.
B $921B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $921E,$16 #FONT#(:(#STR(#PC,$04,$16)))$8D75,attr=$47(one-hundred-and-eighty).
B $9234,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9237,$01 #FONT#(:(#STR#(#PC,$02,$01)))$8D75,attr=$47(copyright).
B $9238,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $923B,$16 #FONT#(:(#STR#(#PC),$0B($b==$FF)))$8D75,attr=$47(mastertronic).
B $9251,$01 Terminator.
  $9252,$01 Return.

c $9253 Reveal Dartboard
@ $9253 label=RevealDartboard
R $9253 DE Dart pointer co-ordinates
  $9253,$01 Decrease #REGe by one.
  $9254,$04 Write #REGde to *#R$9AB9.
  $9258,$01 Increment #REGd by one.
  $9259,$04 Write #REGde to *#R$9ABB.
  $925D,$04 #REGde=*#R$9AB9.
  $9261,$05 Jump to #R$92A6 if #REGe is less than #N$00.
  $9266,$01 Stash #REGde on the stack.
  $9267,$05 Jump to #R$927C if #REGd is less than #N$00.
  $926C,$05 Write #N$FF to *#R$92C6(#N$92C7).
  $9271,$08 #HTML(Write <code>SRL #REGc</code> (#N$CB+#N$39) to *#R$92CD.)
  $9279,$03 Call #R$92A7.
  $927C,$01 Restore #REGde from the stack.
  $927D,$01 Decrease #REGd by one.
  $927E,$01 Decrease #REGe by one.
  $927F,$04 Write #REGde to *#R$9AB9.
  $9283,$04 #REGde=*#R$9ABB.
  $9287,$05 Jump to #R$92A6 if #REGd is greater than or equal to #N$18.
  $928C,$01 Stash #REGde on the stack.
  $928D,$05 Write #N$01 to *#R$92C6(#N$92C7).
  $9292,$08 #HTML(Write <code>SLL #REGc</code> (#N$CB+#N$31) to *#R$92CD.)
  $929A,$03 Call #R$92A7.
  $929D,$01 Restore #REGde from the stack.
  $929E,$01 Increment #REGd by one.
  $929F,$01 Decrease #REGe by one.
  $92A0,$04 Write #REGde to *#R$9ABB.
  $92A4,$02 Jump to #R$925D.
  $92A6,$01 Return.

  $92A7,$01 Stash #REGde on the stack.
  $92A8,$01 Decrease #REGe by one.
  $92A9,$05 Jump to #R$92B5 if #REGe is greater than or equal to #N$20.
  $92AE,$04 Jump to #R$92B5 if #REGe is less than #N$20.
  $92B2,$03 Call #R$92E2.
  $92B5,$01 Restore #REGde from the stack.
  $92B6,$04 Return if #REGe is greater than #N$20.
  $92BA,$01 Stash #REGde on the stack.
  $92BB,$03 Call #R$A8BD.
  $92BE,$01 #REGd=#REGh.
  $92BF,$01 #REGe=#REGl.
  $92C0,$04 #REGh-=#N$20.
  $92C4,$02 #REGb=#N$08.
  $92C6,$02 #REGc=#N$FF.
  $92C8,$01 #REGa=*#REGde.
  $92C9,$01 Set the bits from #REGc.
  $92CA,$01 Write #REGa to *#REGhl.
  $92CB,$01 Increment #REGh by one.
  $92CC,$01 Increment #REGd by one.
  $92CD,$02 Shift #REGc right.
  $92CF,$02 Decrease counter by one and loop back to #R$92C8 until counter is zero.
  $92D1,$01 Restore #REGhl from the stack.
  $92D2,$03 Compare #REGl with #N$08.
  $92D5,$02 #REGa=#COLOUR$70.
  $92D7,$02 Jump to #R$92DB if #REGl was greater than or equal to #N$70.
  $92D9,$02 #REGa=#COLOUR$00.
  $92DB,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $92DC,$03 Call #R$A862.
  $92DF,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $92E0,$01 Write #REGa to *#REGhl.
  $92E1,$01 Return.

c $92E2
  $92E2,$01 Stash #REGde on the stack.
  $92E3,$03 Call #R$A8BD.
  $92E6,$01 #REGd=#REGh.
  $92E7,$01 #REGe=#REGl.
  $92E8,$01 #REGa=#REGh.
  $92E9,$02 #REGa-=#N$20.
  $92EB,$01 #REGh=#REGa.
  $92EC,$02 #REGb=#N$08.
  $92EE,$01 #REGa=*#REGde.
  $92EF,$01 Write #REGa to *#REGhl.
  $92F0,$01 Increment #REGh by one.
  $92F1,$01 Increment #REGd by one.
  $92F2,$02 Decrease counter by one and loop back to #R$92EE until counter is zero.
  $92F4,$01 Restore #REGhl from the stack.
  $92F5,$03 Compare #REGl with #N$08.
  $92F8,$02 #REGa=#COLOUR$70.
  $92FA,$02 Jump to #R$92FE if #REGl was greater than or equal to #N$08.
  $92FC,$02 #REGa=#COLOUR$47.
  $92FE,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $92FF,$03 Call #R$A862.
  $9302,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $9303,$01 Write #REGa to *#REGhl.
  $9304,$01 Return.

c $9305 Main Menu: Print Dart Pointer
@ $9305 label=MainMenu_PrintDartPointer
R $9305 DE The co-ordinates of the dart
  $9305,$04 Return if #REGe is greater than #N$20.
  $9309,$01 Stash #REGde on the stack.
N $930A On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $930A,$03 Call #R$A8AE.
  $930D,$01 Restore #REGde from the stack.
  $930E,$02 #REGa=#N$20.
  $9310,$01 #REGa-=#REGe.
  $9311,$04 Jump to #R$9317 if #REGa is greater than or equal to #N$06.
  $9315,$02 Jump to #R$9319.

  $9317,$02 #REGa=#N$06.

  $9319,$03 #REGde=#R$AF73.
  $931C,$02 #REGb=#N$0B.
  $931E,$02 Stash #REGbc and #REGhl on the stack.
  $9320,$01 Exchange the #REGde and #REGhl registers.
  $9321,$02 #REGb=#N$00.
  $9323,$01 #REGc=#REGa.
  $9324,$02 LDIR.
  $9326,$04 Jump to #R$9334 if #REGa is equal to #N$06.
  $932A,$01 Stash #REGaf on the stack.
  $932B,$01 #REGc=#REGa.
  $932C,$02 #REGa=#N$06.
  $932E,$01 #REGa-=#REGc.
  $932F,$02 #REGb=#N$00.
  $9331,$01 #REGc=#REGa.
  $9332,$01 Restore #REGaf from the stack.
  $9333,$01 #REGhl+=#REGbc.
  $9334,$01 Exchange the #REGde and #REGhl registers.
  $9335,$01 Restore #REGhl from the stack.
  $9336,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $9337,$03 Call #R$A8CC.
  $933A,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $933B,$01 Restore #REGbc from the stack.
  $933C,$02 Decrease counter by one and loop back to #R$931E until counter is zero.
  $933E,$01 Return.

c $933F Main Menu
@ $933F label=MainMenu
  $933F,$07 Write #N$00 to; #LIST
. { *#R$9B2B }
. { *#R$9AB7 }
. LIST#
N $933F #PUSHS #POKES$91C1,$00#SIM(start=$933F,stop=$93F4)
. #UDGTABLE(default)
.   { #SCR$02(main-menu) }
. UDGTABLE# #POPS
  $9346,$03 Call #R$CB1E.
N $9349 Zero the displayed score.
  $9349,$03 #REGhl=#R$91AB(#N$91AE).
  $934C,$03 #REGde=#R$91AB(#N$91AF).
  $934F,$03 #REGbc=#N($0005,$04,$04).
  $9352,$02 Write "#CHR$30" to the first digit in #R$91AB.
  $9354,$02 Copy the zero to the next five digits.
N $9356 Print the menu options.
N $9356 #PUSHS #POKES$91C1,$00#SIM(start=$9356,stop=$93CB)
. #UDGTABLE(default)
.   { #SCR$02(main-menu-1) }
. UDGTABLE# #POPS
. Note; the bright white doesn't happen until later.
  $9356,$03 Call #R$964C.
B $9359,$01 #R$97D5(CLEAR SCREEN).
B $935A,$02 INK: #INK(#PEEK(#PC+$01)).
B $935C,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $935E,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9361,$0A #FONT#(:(#STR(#PC,$04,$0A)))$8D75,attr=$47(1-keyboard)
B $936B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $936E,$13 #FONT#(:(#STR(#PC,$04,$13)))$8D75,attr=$47(2-kempston-joystick)
B $9381,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9384,$10 #FONT#(:(#STR(#PC,$04,$10)))$8D75,attr=$47(3-interface-two)
B $9394,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9397,$12 #FONT#(:(#STR(#PC,$04,$12)))$8D75,attr=$47(4-cursor-joystick)
B $93A9,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $93AC,$0F #FONT#(:(#STR(#PC,$04,$0F)))$8D75,attr=$47(5-redefine-keys)
B $93BB,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $93BE,$0C #FONT#(:(#STR(#PC,$04,$0C)))$8D75,attr=$47(0-start-game)
B $93CA,$01 Terminator.
N $93CB Display the header and footer messaging.
N $93CB #PUSHS #POKES$91C1,$00#SIM(start=$9356,stop=$93CE)
. #UDGTABLE(default)
.   { #SCR$02(main-menu-2) }
. UDGTABLE# #POPS
  $93CB,$03 Call #R$9218.
N $93CE Set the bright white colouring.
N $93CE #PUSHS #POKES$91C1,$00#SIM(start=$9356,stop=$93D1)
. #UDGTABLE(default)
.   { #SCR$02(main-menu-3) }
. UDGTABLE# #POPS
  $93CE,$03 Call #R$91B6.
N $93D1 Now begin setting up the dart pointer.
  $93D1,$03 Set the initial position of the dart pointer to #REGhl (#N$0501).
  $93D4,$02 Set a counter in #REGb for the width of the dart pointer.
N $93D6 Clear the attributes of all possible positions of the dart pointer.
@ $93D6 label=ClearDartPointerAttributePositions
  $93D6,$02 Stash the dart width counter and dart co-ordinates on the stack.
  $93D8,$03 Call #R$94B8.
  $93DB,$01 Restore the dart co-ordinates from the stack.
  $93DC,$02 Move down two rows (the height of the dart pointer).
  $93DE,$01 Restore the dart width counter from the stack.
  $93DF,$02 Decrease the dart width counter by one and loop back to #R$93D6
. until the counter is zero.
N $93E1 Initialise the dart pointer.
  $93E1,$03 Set the initial position of the dart pointer to #REGde (#N$0500).
  $93E4,$02 Set a counter in #REGb for the width of the dart pointer.
@ $93E6 label=DrawDartPointer_Loop
  $93E6,$02 Stash the dart width counter and dart co-ordinates on the stack.
  $93E8,$03 Call #R$9305.
  $93EB,$02 Restore the dart co-ordinates and dart width counter from the stack.
  $93ED,$02 Increment #REGd by two.
  $93EF,$02 Decrease the dart width counter by one and loop back to #R$93E6
. until the counter is zero.
@ $93F1 label=ColourDartPointerAttributes_Loop
  $93F1,$03 Call #R$944E.
  $93F4,$03 Call #R$965F.
  $93F7,$01 Stash #REGaf on the stack.
  $93F8,$01 Restore #REGaf from the stack.
  $93F9,$02 Jump to #R$93F1 if #REGd is equal to #N$04.
N $93FB Has the player hit "Start Game"?
  $93FB,$04 Jump to #R$9429 if "0" was not pressed (ASCII #N$30 is "0").
N $93FF A game was started...
  $93FF,$03 Call #R$9942.
N $9402 Consolidate the selected configs.
  $9402,$06 Write *#R$99F6 to *#R$99F5.
N $9408 Then play an absolutely stunning reveal animation!
. #PUSHS #POKES$91C1,$00#SIM(start=$933F,stop=$93F4)
. #POKES$9412,$00 #SIM(start=$9402,stop=$9410)
. #FOR$00,$3E||x|
.   #SIM(start=$9410,stop=$9424)#SCR$02(*reveal-dartboard-animation-x)
. ||
. #UDGTABLE { #UDGARRAY#(#ANIMATE$03,$3E(reveal-dartboard-animation)) }
. UDGTABLE# #POPS
N $9408 First calculate the co-ordinates of the selected menu item.
  $9408,$04 #REGd=#N$05+(#REGa*#N$02).
  $940C,$02 #REGe=#N$01.
  $940E,$02 Set a counter in #REGb of the number of loops to complete the
. animation (#N$3E).
@ $9410 label=RevealDartboard_Loop
  $9410,$02 Stash the reveal loop counter and selected item co-ordinates on the
. stack.
  $9412,$01 Halt operation (suspend CPU until the next interrupt).
  $9413,$03 Call #R$9305.
  $9416,$01 Restore #REGhl from the stack.
  $9417,$01 Stash #REGhl on the stack.
  $9418,$01 Increment #REGl by one.
  $9419,$03 Call #R$9457.
  $941C,$01 Restore #REGde from the stack.
  $941D,$01 Stash #REGde on the stack.
  $941E,$03 Call #R$9253.
  $9421,$01 Restore #REGde from the stack.
  $9422,$01 Increment #REGe by one.
  $9423,$01 Restore the reveal loop counter from the stack.
  $9424,$02 Decrease the reveal loop counter by one and loop back to #R$9410
. until the dartboard is fully revealed.
  $9426,$03 Jump to #R$94E6.
@ $9429 label=MainMenu_Next
  $9429,$05 Jump to #R$93F1 if #REGa is greater than (ASCII #N$36 is "6").
  $942E,$05 Jump to #R$93F1 if #REGa is less than (ASCII #N$30 is "0").
  $9433,$02 #REGa-=#N$31.
  $9435,$01 Stash #REGaf on the stack.
  $9436,$03 Call #R$94AF.
  $9439,$03 Call #R$9942.
  $943C,$01 Restore #REGaf from the stack.
  $943D,$03 Write #REGa to *#R$99F6.
  $9440,$05 Jump to #R$93F1 if #REGa is not equal to #N$04.
  $9445,$03 Call #R$94F8.
  $9448,$03 Call #R$94D3.
  $944B,$03 Jump to #R$933F.

c $944E Main Menu: Colour Dart Pointer
@ $944E label=MainMenu_ColourDartPointer
N $944E #PUSHS #SIM(start=$9195,stop=$919E)#SIM(start=$93D1,stop=$94AE)
. #UDGTABLE(default)
. { #SCR$04{$04,$A0,$C0,$2C}(dart-pointer-colour) }
. UDGTABLE# #POPS
  $944E,$03 Fetch *#R$99F6 and store it in #REGa.
  $9451,$01 Double the value as the entries have spacing between them.
  $9452,$02 Add #N$05, as the entries start five rows from the top of the
. screen.
  $9454,$01 Store the result in #REGh as the Y co-ordinate.
  $9455,$02 Store #N$01 in #REGl as the X co-ordinate.
  $9457,$04 Return if #REGl is greater than #N$20.
  $945B,$01 Stash the dart attribute co-ordinates on the stack.
N $945C First colour the flight.
N $945C Convert the co-ordinates to an actual attribute buffer memory location.
  $945C,$03 Call #R$A862.
  $945F,$02 Set the flight colour of #COLOUR$45 in #REGb.
  $9461,$03 Set one row length of #N($0020,$04,$04) in #REGde.
  $9464,$01 Write #COLOUR$45 to the attribute buffer pointer.
  $9465,$01 Move down one row.
  $9466,$01 Write #COLOUR$45 to the attribute buffer pointer.
  $9467,$01 Restore the dart attribute co-ordinates from the stack.
  $9468,$01 Move right one character block.
  $9469,$04 Return if #REGl is greater than #N$20.
  $946D,$01 Stash the dart attribute co-ordinates on the stack.
N $946E Now the shaft.
N $946E Again, convert the co-ordinates to an actual attribute buffer memory
. location.
  $946E,$03 Call #R$A862.
  $9471,$02 Set the shaft colour of #COLOUR$45 in #REGb.
  $9473,$03 Set one row length of #N($0020,$04,$04) in #REGde.
  $9476,$01 Write #COLOUR$45 to the attribute buffer pointer.
  $9477,$01 Move down one row.
  $9478,$01 Write #COLOUR$45 to the attribute buffer pointer.
  $9479,$01 Restore the dart attribute co-ordinates from the stack.
  $947A,$01 Move right one character block.
  $947B,$04 Return if #REGl is greater than #N$20.
  $947F,$01 Stash the dart attribute co-ordinates on the stack.
N $9480 Move onto the barrel.
N $9480 Convert the co-ordinates to an actual attribute buffer memory
. location.
  $9480,$03 Call #R$A862.
  $9483,$02 Set the barrel colour of #COLOUR$46 in #REGb.
  $9485,$03 Set one row length of #N($0020,$04,$04) in #REGde.
  $9488,$01 Write #COLOUR$46 to the attribute buffer pointer.
  $9489,$01 Move down one row.
  $948A,$01 Write #COLOUR$46 to the attribute buffer pointer.
  $948B,$01 Restore the dart attribute co-ordinates from the stack.
  $948C,$01 Move right one character block.
  $948D,$04 Return if #REGl is greater than #N$20.
  $9491,$01 Stash the dart attribute co-ordinates on the stack.
N $9492 Continue on with the barrel.
N $9492 Convert the co-ordinates to an actual attribute buffer memory
. location.
  $9492,$03 Call #R$A862.
  $9495,$02 Set the barrel colour of #COLOUR$46 in #REGb.
  $9497,$03 Set one row length of #N($0020,$04,$04) in #REGde.
  $949A,$01 Write #COLOUR$46 to the attribute buffer pointer.
  $949B,$01 Move down one row.
  $949C,$01 Write #COLOUR$46 to the attribute buffer pointer.
  $949D,$01 Restore the dart attribute co-ordinates from the stack.
  $949E,$01 Move right one character block.
  $949F,$04 Return if #REGl is greater than #N$20.
N $94A3 Lastly, colour the point.
N $94A3 Convert the co-ordinates to an actual attribute buffer memory
. location.
  $94A3,$03 Call #R$A862.
  $94A6,$02 Set the barrel colour of #COLOUR$47 in #REGb.
  $94A8,$03 Set one row length of #N($0020,$04,$04) in #REGde.
  $94AB,$01 Write #COLOUR$47 to the attribute buffer pointer.
  $94AC,$01 Move down one row.
  $94AD,$01 Write #COLOUR$47 to the attribute buffer pointer.
  $94AE,$01 Return.

c $94AF Clear Current Dart Pointer Attributes
@ $94AF label=ClearCurrentDartPointerAttributes
E $94AF Continue on to #R$94B8.
  $94AF,$03 Fetch *#R$99F6 and store it in #REGa.
  $94B2,$01 Double the value as the entries have spacing between them.
  $94B3,$02 Add #N$05, as the entries start five rows from the top of the
. screen.
  $94B5,$01 Store the result in #REGh as the Y co-ordinate.
  $94B6,$02 Store #N$01 in #REGl as the X co-ordinate.

c $94B8 Clear Dart Pointer Attributes
@ $94B8 label=ClearDartPointerAttributes
R $94B8 HL The co-ordinates of the dart
  $94B8,$03 Call #R$A862.
  $94BB,$0A Write #COLOUR$00 to #N$04 character blocks in this attribute row.
N $94C5 Move down one row, and back #N$04 character blocks (the width of the
. dart graphic).
  $94C5,$04 #REGhl+=#N($001C,$04,$04).
  $94C9,$09 Write #COLOUR$00 to #N$04 character blocks in this attribute row.
  $94D2,$01 Return.

c $94D3 Press Any Key To Continue
@ $94D3 label=Debounce_CheckKeys
N $94D3 Read from the keyboard- returns #N$00 when no keys are being pressed.
  $94D3,$03 Call #R$965F.
  $94D6,$03 Jump back to #R$94D3 if any keys are still being pressed.
N $94D9 After the frame delay, return regardless of key presses.
  $94D9,$02 Set a timeout counter in #REGb of #N$32.
@ $94DB label=Debounce_Loop
  $94DB,$01 Halt operation (suspend CPU until the next interrupt).
  $94DC,$01 Reset the flags.
  $94DD,$02 Read from the keyboard port.
N $94DF Mask off the unused bits.
  $94DF,$02,b$01 Set bits 5-7.
N $94E1 If no keys are being pressed, #REGa will become #N$00.
  $94E1,$01 Increment the value by one.
  $94E2,$01 Return if any key has been pressed.
  $94E3,$02 Decrease the timeout counter by one and loop back to #R$94DB until
. the timeout counter is zero.
  $94E5,$01 Return.

c $94E6 Initialise Dartboard Menu
@ $94E6 label=Initialise_DartboardMenu
  $94E6,$03 Call #R$9D33.
  $94E9,$01 #REGa=#N$00.
  $94EA,$02 #REGa=byte from port #N$FE.
  $94EC,$02,b$01 Set bits 5-7.
  $94EE,$01 Increment #REGa by one.
  $94EF,$01 Return.

c $94F0 Back To BASIC
@ $94F0 label=BackToBasic
  $94F0,$02 Set a counter in #REGb of #N$32.
@ $94F2 label=BackToBasic_Loop
  $94F2,$01 Halt operation (suspend CPU until the next interrupt).
  $94F3,$02 Decrease halt counter by one and loop back to #R$94F2 until the
. counter is zero.
  $94F5,$03 #HTML(Jump to <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0000.html">START</a>.)

c $94F8 Messaging: Redefine Keys
@ $94F8 label=Messaging_RedefineKeys
N $94F8 #PUSHS #SIM(start=$94F8,stop=$953A)
. #UDGTABLE(default)
.   { #SCR$02(redefine-keys) }
. UDGTABLE# #POPS
  $94F8,$04 Write #N$00 to *#R$99F6.
  $94FC,$03 Call #R$964C.
B $94FF,$01 #R$97D5(CLEAR SCREEN).
B $9500,$02 INK: #INK(#PEEK(#PC+$01)).
B $9502,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $9504,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9507,$0D #FONT#(:(#STR(#PC,$04,$0D)))$8D75,attr=$47(redefine-keys)
B $9514,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9517,$02 #FONT#(:(#STR(#PC,$04,$02)))$8D75,attr=$47(up)
B $9519,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $951C,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(down)
B $9520,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9523,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(left)
B $9527,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $952A,$05 #FONT#(:(#STR(#PC,$04,$05)))$8D75,attr=$47(right)
B $952F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9532,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(fire)
B $9536,$01 Terminator.
  $9537,$03 Call #R$9218.
  $953A,$03 Call #R$91B6.
N $953D Clear down the existing user-defined key data.
  $953D,$03 #REGhl=#R$9A60.
  $9540,$03 #REGde=#R$9A60+#N$01.
  $9543,$03 #REGbc=#N($000E,$04,$04).
  $9546,$02 Write #N$00 to *#REGhl.
  $9548,$02 Blank the #N($000E,$04,$04) control bytes.
N $954A Get the user-input for filling the control bytes.
N $954A Oddly, start with "UP" even though "FIRE" is first with how the bytes
. are stored.
  $954A,$04 #REGix=#R$9A63.
  $954E,$03 Call #R$964C.
B $9551,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $9554,$01 Terminator.
  $9555,$03 Call #R$9569 for "UP".
  $9558,$03 Call #R$9569 for "DOWN".
  $955B,$03 Call #R$9569 for "LEFT".
  $955E,$03 Call #R$9569 for "RIGHT".
N $9561 Cycle back and collect the input for "FIRE".
  $9561,$04 #REGix=#R$9A60.
  $9565,$03 Call #R$9569 for "FIRE".
  $9568,$01 Return.

c $9569 Redefine Key
@ $9569 label=RedefineKey
  $9569,$03 Call #R$9688.
  $956C,$03 Jump to #R$9569 if #REGa is not equal to zero.
  $956F,$03 Call #R$9688.
  $9572,$03 Jump to #R$956F if #REGa is zero.
  $9575,$05 Jump to #R$9580 if #REGc is less than #N$04.
  $957A,$06 Jump to #R$9569 if *#R$F864 is not equal to zero.
  $9580,$03 #REGhl=#R$9A59.
  $9583,$02 #REGb=#N$08.
  $9585,$04 Jump to #R$9569 if #REGc is equal to *#REGhl.
  $9589,$03 Increment #REGhl by three.
  $958C,$02 Decrease counter by one and loop back to #R$9586 until counter is zero.
  $958E,$03 Write #REGe to *#REGix+#N$00.
  $9591,$03 Write #REGd to *#REGix+#N$01.
  $9594,$03 Write #REGa to *#REGix+#N$02.
  $9597,$06 Increment #REGix by three.
  $959D,$03 Call #R$91C5.
  $95A0,$05 Write #N$12 to *#R$F818.
  $95A5,$03 Increment *#R$F819 by two.
  $95A8,$01 Return.

c $95A9
  $95A9,$01 Disable interrupts.
  $95AA,$04 #REGiy=#R$F800.
  $95AE,$04 Reset bit 7 of *#REGiy+#N$25.
  $95B2,$03 Call #R$95D2.
  $95B5,$03 Call #R$9635.
  $95B8,$01 Enable interrupts.
  $95B9,$04 Write #N$00 to *#R$F815.
  $95BD,$01 Return.

c $95BE
  $95BE,$04 Write #N$00 to *#R$F815.
  $95C2,$01 Disable interrupts.
  $95C3,$04 #REGsp=*#R$F827.
  $95C7,$01 Switch to the shadow registers.
  $95C8,$01 Restore #REGhl from the stack.
  $95C9,$01 Switch back to the normal registers.
  $95CA,$04 #HTML(#REGiy=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3A.html">ERR_NR</a>.)
  $95CE,$02 Set interrupt mode #N$01.
  $95D0,$01 Enable interrupts.
  $95D1,$01 Return.

c $95D2 Create Interrupt Byte Jump Table
@ $95D2 label=CreateInterruptByteJumpTable
  $95D2,$03 #REGhl=#R$FE00.
  $95D5,$03 #REGi=#N$FE.
  $95D8,$01 #REGa=#N$FD.
N $95D9 Write #N$FD from #R$FE00 for #N$100 bytes. All will become clear soon...
@ $95D9 label=CreateInterruptByteJumpTable_Loop
  $95D9,$01 Write #REGa to *#REGhl.
  $95DA,$01 Increment #REGl by one.
  $95DB,$02 Jump to #R$95D9 if #REGl is not equal to #N$00.
  $95DD,$01 Increment #REGh by one.
  $95DE,$01 Write #REGa to *#REGhl.
N $95DF #HTML(Write <code>JP #R$95ED</code> to *#R$FDFD)
  $95DF,$05 #HTML(Write <code>JP</code> (#N$C3) to *#R$FDFD.)
  $95E4,$06 Write #R$95ED to *#R$FDFD(#N$FDFE).
  $95EA,$02 Set interrupt mode #N$02.
  $95EC,$01 Return.

c $95ED Interrupt Routine
@ $95ED label=InterruptRoutine
  $95ED,$06 Stash #REGaf, #REGbc, #REGde, #REGhl and #REGix on the stack.
  $95F3,$03 Call #R$CBF7.
  $95F6,$06 Jump to #R$9626 if *#R$9B2B is not zero.
  $95FC,$03 #REGhl=#R$9AB5.
  $95FF,$01 Decrease *#REGhl by one.
  $9600,$02 Jump to #R$9626 if *#REGhl is not zero.
  $9602,$02 Write "#CHR$32" to *#REGhl.
N $9604 Handle the units digit of #R$A38C.
  $9604,$03 #REGhl=#R$A38C(#N$A38D) (2nd digit of #R$A38C).
  $9607,$01 Decrease *#REGhl by one.
N $9608 Has #R$A38C(#N$A38D) just ticked down from a "0"?
  $9608,$05 Jump to #R$9623 if *#REGhl is not equal to #N$2F ("#CHR$30" minus one).
N $960D Replace the unit digit with a "9".
  $960D,$02 Write "#CHR$39" to *#REGhl.
N $960F Handle the tens digit of #R$A38C.
  $960F,$03 #REGhl=#R$A38C.
  $9612,$01 Decrease *#REGhl by one.
N $9613 Has #R$A38C just ticked down from a "0"?
  $9613,$05 Jump to #R$9623 if *#REGl is not equal to #N$2F ("#CHR$30" minus one).
N $9618 This signifies that the time is now up!
  $9618,$05 Write #N$01 to *#R$9B2A.
  $961D,$04 Write #N$00 to *#R$9B2B.
  $9621,$02 Jump to #R$9626.
N $9623 Print the "Around The Clock" timer.
@ $9623 label=InterruptDrivenTimer
  $9623,$03 Call #R$A380.
@ $9626 label=GetControls
  $9626,$03 Call #R$99F7.
  $9629,$03 Write #REGa to *#R$F821.
  $962C,$06 Restore #REGix, #REGhl, #REGde, #REGbc and #REGaf from the stack.
  $9632,$01 Enable interrupts.
  $9633,$02 Return from the interrupt routine.

c $9635
  $9635,$02 #REGb=#N$80.
  $9637,$03 #REGde=#N$4000.
  $963A,$03 #REGhl=#R$F900.
  $963D,$01 Write #REGe to *#REGhl.
  $963E,$01 Increment #REGl by one.
  $963F,$01 Write #REGd to *#REGhl.
  $9640,$01 Increment #REGl by one.
  $9641,$01 Exchange the #REGde and #REGhl registers.
  $9642,$03 Call #R$A8CC.
  $9645,$03 Call #R$A8CC.
  $9648,$01 Exchange the #REGde and #REGhl registers.
  $9649,$02 Decrease counter by one and loop back to #R$963D until counter is zero.
  $964B,$01 Return.

c $964C Print String
@ $964C label=PrintString_Loop
  $964C,$01 Exchange #REGhl with the address at the top of the stack.
  $964D,$01 Get character from string.
  $964E,$01 Increment the string pointer by one.
  $964F,$01 Update the return address on the stack.
  $9650,$03 Return if the terminator has been reached.
  $9653,$03 Call #R$9736.
  $9656,$02 Jump back to #R$964C.

c $9658
  $9658,$01 Halt operation (suspend CPU until the next interrupt).
  $9659,$01 Decrease #REGbc by one.
  $965A,$04 Jump to #R$9658 until #REGbc is zero.
  $965E,$01 Return.

c $965F
  $965F,$01 Halt operation (suspend CPU until the next interrupt).
  $9660,$03 Call #R$9688.
  $9663,$01 Return if #REGa is zero.
  $9664,$03 Compare #REGa with *#REGiy+#N$65.
  $9667,$02 Jump to #R$967C if #REGbc is equal to #REGc.
  $9669,$01 Set the bits from #REGa.
  $966A,$02 Jump to #R$966F if #REGbc is not equal to #REGa.
  $966C,$03 Write #REGa to *#R$F865.
  $966F,$04 Jump to #R$965F if #REGa is less than #N$04.
  $9673,$03 Write #REGa to *#R$F865.
  $9676,$04 Write #N$0F to *#REGiy+#N$66.
  $967A,$01 Set the bits from #REGa.
  $967B,$01 Return.
  $967C,$03 Decrease *#REGiy+#N$66 by one.
  $967F,$03 Jump to #R$965F if #REGa is greater than or equal to #REGa.
  $9682,$04 Write #N$01 to *#REGiy+#N$66.
  $9686,$01 Set the bits from #REGa.
  $9687,$01 Return.

c $9688
  $9688,$02 Stash #REGbc and #REGhl on the stack.
  $968A,$03 #REGhl=#R$F800.
  $968D,$02 #REGe=#N$FE.
  $968F,$01 #REGa=#REGe.
  $9690,$02 #REGa=byte from port #N$FE.
  $9692,$02,b$01 Set bits 5-7.
  $9694,$01 Invert the bits in #REGa.
  $9695,$01 Write #REGa to *#REGhl.
  $9696,$01 Increment #REGhl by one.
  $9697,$02 Rotate #REGe left (with carry).
  $9699,$02 Jump to #R$968F if #REGhl is less than #REGa.
  $969B,$04 Write #N$00 to *#REGiy+#N$64.
  $969F,$03 #REGhl=#R$F800.
  $96A2,$02 Test bit 0 of *#REGhl.
  $96A4,$02 Jump to #R$96B0 if #REGhl is equal to #REGa.
  $96A6,$04 Set bit 0 of *#REGix+#N$64.
  $96AA,$02 Reset bit 0 of *#REGhl.
  $96AC,$02 #REGe=#N$FE.
  $96AE,$02 #REGd=#N$01.
  $96B0,$03 #REGhl=#R$F807.
  $96B3,$02 Test bit 1 of *#REGhl.
  $96B5,$02 Jump to #R$96C1 if #REGhl is equal to #REGa.
  $96B7,$04 Set bit 1 of *#REGix+#N$64.
  $96BB,$02 Reset bit 1 of *#REGhl.
  $96BD,$02 #REGe=#N$7F.
  $96BF,$02 #REGd=#N$02.
  $96C1,$02 Stash #REGix on the stack.
  $96C3,$04 #REGix=#R$F800.
  $96C7,$03 #REGhl=#R$970D.
  $96CA,$02 #REGb=#N$FE.
  $96CC,$03 #REGa=*#REGix+#N$00.
  $96CF,$01 Set the bits from #REGa.
  $96D0,$02 Jump to #R$96F0 if #REGhl is not equal to #REGa.
  $96D2,$02 Increment #REGix by one.
  $96D4,$04 #REGl+=#N$05.
  $96D8,$02 Jump to #R$96DB if #REGhl is greater than or equal to #REGa.
  $96DA,$01 Increment #REGh by one.
  $96DB,$02 Rotate #REGb left (with carry).
  $96DD,$02 Jump to #R$96CC if #REGh is less than #REGa.
  $96DF,$04 Compare *#R$F864 with itself for the return.
  $96E3,$04 Restore #REGix, #REGhl and #REGbc from the stack.
  $96E7,$01 Return.

b $96E8

c $96F0
  $96F0,$01 #REGd=#REGa.
  $96F1,$01 #REGe=#REGb.
  $96F2,$02 Rotate #REGa right.
  $96F4,$01 Increment #REGhl by one.
  $96F5,$02 Jump to #R$96F2 if #REGhl is greater than or equal to #N$00.
  $96F7,$03 #REGbc=#N($0028,$04,$04).
  $96FA,$03 #REGa=*#R$F864.
  $96FD,$04 Jump to #R$9707 if #REGa has even parity (P flag is set).
  $9701,$01 #REGhl+=#REGbc.
  $9702,$02 Shift #REGa right.
  $9704,$02 Jump to #R$9707 if #REGa is ??.
  $9706,$01 #REGhl+=#REGbc.
  $9707,$01 #REGa=*#REGhl.
  $9708,$01 Set the bits from #REGa.
  $9709,$02 Restore #REGix from the stack.
  $970B,$02 Restore #REGhl and #REGbc from the stack.
  $970D,$01 Return.

t $970E

c $9736 Print Character
@ $9736 label=PrintCharacter
R $9736 A Character to print
  $9736,$02 Stash the string pointer and the character to print on the stack.
N $9738 Check the buffer status.
  $9738,$06 Jump to #R$9754 if *#R$F815 is empty.
N $973E Buffer handling.
  $973E,$01 #REGa=the character to print (from the stack).
  $973F,$01 Keep a copy of the character to print on the stack.
  $9740,$03 #REGhl=*#R$F80A.
  $9743,$01 Write the character to print into the buffer.
  $9744,$01 Increment the character printing buffer pointer by one.
  $9745,$03 Update the *#R$F80A.
N $9748 Update the buffer counter.
  $9748,$03 #REGa=*#R$F815.
  $974B,$01 Decrease the buffer counter by one.
  $974C,$03 Update the *#R$F815.
  $974F,$02 Jump to #R$9776 if the buffer is now empty.
  $9751,$02 Restore the character to print and the string pointer from the stack.
  $9753,$01 Return.

c $9754 Controller: Character Printing
@ $9754 label=Controller_CharacterPrinting
  $9754,$01 #REGa=the character to print (from the stack).
  $9755,$01 Keep a copy of the character to print on the stack.
  $9756,$05 Jump to #R$978B if the character is a "normal" ASCII character
. (#N$20 or higher).
N $975B Else this is a control character.
  $975B,$03 Write the control code to *#R$F814.
  $975E,$03 #REGhl=#R$9965.
  $9761,$02 Add #REGa to #REGl.
  $9763,$02 Jump to #R$9766 if there's no carry.
  $9765,$01 Handle the carry.
@ $9766 label=CharacterPrinting_NoCarry
  $9766,$04 Write *#REGhl to *#R$F815.
  $976A,$03 Jump to #R$9776 if #REGa is zero.
N $976D Reset the buffer pointer.
  $976D,$06 Write #R$F80C to *#R$F80A.
  $9773,$02 Restore #REGaf and #REGhl from the stack.
  $9775,$01 Return.

c $9776 Handler: Control Code
@ $9776 label=Handler_ControlCode
  $9776,$03 Retrieve *#R$F814 and store it in #REGa.
  $9779,$01 Multiply it by #N$02.
  $977A,$03 #REGhl=#R$9985.
  $977D,$02 Calculate the offset.
  $977F,$02 Jump to #R$9782 if there's no carry.
  $9781,$01 Handle the carry.
@ $9782 label=ControlCode_NoCarry
  $9782,$04 Get the referenced address from the jump table.
  $9786,$01 Stash the handler address on the stack.
  $9787,$03 #REGhl=#R$F818.
  $978A,$01 Return.

c $978B Handler: ASCII Character
@ $978B label=Handler_ASCIICharacter
  $978B,$02 Stash #REGbc and #REGde on the stack.
  $978D,$02 #REGa-=#N$20.
  $978F,$03 Create an offset in #REGhl.
  $9792,$03 #REGhl*=#N$08.
  $9795,$05 #REGhl+=*#R$F81A.
  $979A,$01 Stash #REGhl on the stack.
  $979B,$04 Multiply *#R$F819 by #N$02 and store the result in #REGa.
  $979F,$03 #REGhl=#R$99C5.
  $97A2,$02 #REGl+=#REGa.
  $97A4,$02 Jump to #R$97A7 if there's no carry.
  $97A6,$01 Handle carry.
@ $97A7 label=ASCIICharacter_NoCarry
  $97A7,$01 #REGe=*#REGhl.
  $97A8,$01 Increment #REGhl by one.
  $97A9,$01 #REGd=*#REGhl.
  $97AA,$03 #REGa=*#R$F818.
  $97AD,$01 Exchange the #REGde and #REGhl registers.
  $97AE,$01 #REGa+=#REGl.
  $97AF,$01 #REGl=#REGa.
  $97B0,$02 #REGde=#REGhl (using the stack).
  $97B2,$01 Restore #REGhl from the stack.
  $97B3,$01 Stash #REGde on the stack.
  $97B4,$02 #REGb=#N$08.
  $97B6,$02 Write *#REGhl to *#REGde.
  $97B8,$01 Increment #REGd by one.
  $97B9,$01 Increment #REGhl by one.
  $97BA,$02 Decrease counter by one and loop back to #R$97B6 until counter is zero.
  $97BC,$01 Restore #REGhl from the stack.
  $97BD,$01 #REGa=#REGh.
  $97BE,$03 RRA.
  $97C1,$02,b$01 Keep only bits 0-1.
  $97C3,$03 #REGa+=*#REGiy+#N$1D.
  $97C6,$01 #REGh=#REGa.
  $97C7,$03 #REGa=*#R$F81E.
  $97CA,$01 Write #REGa to *#REGhl.
  $97CB,$01 Increment #REGl by one.
  $97CC,$01 Write #REGa to *#REGhl.
  $97CD,$02 Restore #REGde and #REGbc from the stack.
  $97CF,$03 #REGhl=#R$F818.
  $97D2,$03 Jump to #R$9818.

c $97D5 Control Code #N$00: Clear Screen
@ $97D5 label=ControlCode_ClearScreen
  $97D5,$02 Stash #REGbc and #REGde on the stack.
  $97D7,$03 #REGhl=*#R$F81C.
  $97DA,$03 #REGa=*#R$F81E.
  $97DD,$03 #REGbc=#N$02FF.
  $97E0,$03 Call #R$97F0.
  $97E3,$03 #REGhl=*#R$F82B.
  $97E6,$01 #REGa=#N$00.
  $97E7,$03 #REGbc=#N$17FF.
  $97EA,$03 Call #R$97F0.
  $97ED,$03 Jump to #R$9960.

c $97F0 Helper: Copier
@ $97F0 label=Helper_Copier
R $97F0 HL Target address
R $97F0 BC Count of times to copy
R $97F0 A Value to copy
  $97F0,$02 Copy #REGhl into #REGde.
  $97F2,$01 Increment #REGde by one.
  $97F3,$01 Write #REGa to *#REGhl.
  $97F4,$02 Copy #REGa the number of times set in #REGbc.
  $97F6,$01 Return.

c $97F7
  $97F7,$04 Write *#R$F817 to *#REGhl.

c $97FB Control Code #N$0A:
@ $97FB label=ControlCode_10
  $97FB,$01 Increment #REGhl by one.
  $97FC,$01 Increment *#REGhl by one.
  $97FD,$06 Jump to #R$995D if *#REGhl is less than #N$18.
  $9803,$01 Decrease *#REGhl by one.
  $9804,$03 Jump to #R$995D.

c $9807 Control Code #N$0B:
@ $9807 label=ControlCode_11
  $9807,$01 Increment #REGhl by one.
  $9808,$01 Decrease *#REGhl by one.
  $9809,$03 Jump to #R$995D if *#REGhl is greater than or equal to #N$00.
  $980C,$01 Increment *#REGhl by one.
  $980D,$03 Jump to #R$995D.

c $9810 Control Code #N$09:
@ $9810 label=ControlCode_09
  $9810,$01 Decrease *#REGhl by one.
  $9811,$03 Jump to #R$995D if *#REGhl is greater than or equal to #N$00.
  $9814,$01 Increment *#REGhl by one.
  $9815,$03 Jump to #R$995D.

c $9818
  $9818,$01 Increment *#REGhl by one.
  $9819,$06 Jump to #R$995D if *#REGhl is less than #N$20.
  $981F,$02 Jump to #R$97F7.

c $9821
  $9821,$03 #REGhl=#R$F81E.
  $9824,$01 #REGa=*#REGhl.
  $9825,$02,b$01 Keep only bits 0-5, 7.
  $9827,$01 Write #REGa to *#REGhl.
  $9828,$08 Jump to #R$9957 if *#R$F80C is greater than #N$02.
  $9830,$02 RRCA.
  $9832,$01 Set the bits from *#REGhl.
  $9833,$01 Write #REGa to *#REGhl.
  $9834,$03 Jump to #R$995D.

c $9837
  $9837,$03 #REGhl=#R$F81E.
  $983A,$01 #REGa=*#REGhl.
  $983B,$02,b$01 Keep only bits 3-7.
  $983D,$01 Write #REGa to *#REGhl.
  $983E,$08 Jump to #R$9957 if *#R$F80C is greater than #N$08.
  $9846,$01 Set the bits from *#REGhl.
  $9847,$01 Write #REGa to *#REGhl.
  $9848,$03 Jump to #R$995D.

c $984B
  $984B,$03 #REGhl=#R$F81E.
  $984E,$01 #REGa=*#REGhl.
  $984F,$02,b$01 Keep only bits 0-2, 6-7.
  $9851,$01 Write #REGa to *#REGhl.
  $9852,$03 #REGa=*#R$F80C.
  $9855,$05 Jump to #R$9957 if #REGa is greater than #N$08.
  $985A,$03 Multiply #REGa by #N$08.
  $985D,$01 Set the bits from *#REGhl.
  $985E,$01 Write #REGa to *#REGhl.
  $985F,$03 Jump to #R$995D.

c $9862
  $9862,$03 #REGa=*#R$F80D.
  $9865,$05 Jump to #R$9957 if #REGa is greater than #N$20.
  $986A,$01 Write #REGa to *#REGhl.
  $986B,$01 Increment #REGhl by one.
  $986C,$03 #REGa=*#R$F80C.
  $986F,$05 Jump to #R$9957 if #REGa is greater than #N$19.
  $9874,$01 Write #REGa to *#REGhl.
  $9875,$03 Jump to #R$995D.

c $9878 Control Code #N$03: Repeater
@ $9878 label=ControlCode_Repeater
  $9878,$03 #REGhl=*#R$F80C.
@ $987B label=Repeater_Loop
  $987B,$01 #REGa=#REGh.
  $987C,$03 Call #R$9736.
  $987F,$01 Decrease #REGl by one.
  $9880,$02 Jump to #R$987B until #REGl is zero.
  $9882,$03 Jump to #R$995D.

c $9885
  $9885,$08 Jump to #R$9957 if *#R$F80C is greater than #N$20.
  $988D,$03 Write #REGa to *#R$F817.
  $9890,$03 Jump to #R$995D.

c $9893
  $9893,$08 Jump to #R$9957 if *#R$F80C is greater than #N$20.
  $989B,$01 Write #REGa to *#REGhl.
  $989C,$03 Jump to #R$995D.

c $989F
  $989F,$06 Write *#R$F80C to *#R$F82B.
  $98A5,$03 Jump to #R$995D.

c $98A8
  $98A8,$06 Write *#R$F80C to *#R$F81A.
  $98AE,$03 Jump to #R$995D.

c $98B1 Control Code #N$0C:
@ $98B1 label=ControlCode_12
  $98B1,$01 Stash #REGbc on the stack.
  $98B2,$03 #REGhl=#R$F816.
  $98B5,$01 #REGb=*#REGhl.
  $98B6,$02 Write #N$00 to *#REGhl.
  $98B8,$03 Call #R$964C.
B $98BB,$01
T $98BC,$01 "#STR(#PC,$04,$01)".
B $98BD,$01
B $98BE,$01 Terminator.
  $98BF,$01 Write #REGb to *#REGhl.
  $98C0,$03 Jump to #R$9961.

c $98C3
  $98C3,$06 Write *#R$F80C to *#R$F816.
  $98C9,$03 Jump to #R$995D.

c $98CC Control Code #N$01:
@ $98CC label=ControlCode_01
  $98CC,$0A INK: #INK$07.
  $98D6,$05 PAPER: ...
  $98DB,$03 Set border to #INK$00.
  $98DE,$03 Write #N$00 to *#R$F817.
  $98E1,$03 ... PAPER: #INK$00.
  $98E4,$06 Write #N($0000,$04,$04) to *#R$F818.
  $98EA,$04 Write #N$00 to *#R$F816.
  $98EE,$06 Write #N$4000 to *#R$F82B.
  $98F4,$06 Write #R$8D75 to *#R$F81A.
  $98FA,$06 Write #N$5800 to *#R$F81C.
  $9900,$03 Jump to #R$995D.

c $9903 Control Code #N$02:
@ $9903 label=ControlCode_02
  $9903,$02 Stash #REGde and #REGbc on the stack.
  $9905,$03 #REGhl=#N$5800 (attribute buffer location).
  $9908,$03 #REGde=#N$5801.
  $990B,$03 #REGbc=#N$02FF.
  $990E,$01 Halt operation (suspend CPU until the next interrupt).
  $990F,$02 Write #N$00 to *#REGhl.
  $9911,$02 LDIR.
  $9913,$02 #REGb=#N$C0.
  $9915,$03 #REGhl=#N($4000,$04,$04).
  $9918,$01 #REGc=#REGl.
  $9919,$02 #REGa=#N$20.
  $991B,$02 Write #N$00 to *#REGhl.
  $991D,$01 Increment #REGl by one.
  $991E,$01 Decrease #REGa by one.
  $991F,$02 Jump to #R$991B if #REGa is not equal to #N$20.
  $9921,$01 #REGl=#REGc.
  $9922,$03 Call #R$A8CC.
  $9925,$02 Decrease counter by one and loop back to #R$9918 until counter is zero.
  $9927,$03 Jump to #R$995B.

c $992A Control Code #N$07:
@ $992A label=ControlCode_07
N $992A #HTML(#AUDIO(tick.wav)(#INCLUDE(Tick)))
  $992A,$01 Stash #REGbc on the stack.
  $992B,$02 Set initial speaker state in #REGc to OFF.
  $992D,$02 Set the repeat loop counter in #REGb to #N$14.
@ $992F label=ControlCode_07_OuterLoop
  $992F,$03 Set the delay loop in #REGhl to #N($0014,$04,$04).
@ $9932 label=ControlCode_07_DelayLoop
  $9932,$01 Decrease the delay loop by one.
  $9933,$04 Jump back to #R$9932 until the delay loop is zero.
  $9937,$01 Load the current speaker state into #REGa.
  $9938,$02,b$01 Flip the speaker bit.
  $993A,$01 Store the result back to #REGc.
M $9937,$04 Flip the current speaker state.
  $993B,$02 Send it to the speaker.
  $993D,$02 Decrease the repeat loop counter by one and loop back to #R$992F
. until the repeat loop counter is zero.
  $993F,$03 Jump to #R$9961.

c $9942 Sound: Menu Tick
@ $9942 label=Sound_MenuTick
N $9942 #HTML(#AUDIO(menu.wav)(#INCLUDE(Menu)))
  $9942,$02 Set initial speaker state in #REGc to OFF.
  $9944,$02 Set the repeat loop counter in #REGb to #N$3C.
@ $9946 label=MenuTick_OuterLoop
  $9946,$03 Set the delay loop in #REGhl to #N($000A,$04,$04).
@ $9949 label=MenuTick_DelayLoop
  $9949,$01 Decrease the delay loop by one.
  $994A,$04 Jump back to #R$9949 until the delay loop is zero.
  $994E,$01 Load the current speaker state into #REGa.
  $994F,$02,b$01 Flip the speaker bit.
  $9951,$01 Store the result back to #REGc.
M $994E,$04 Flip the current speaker state.
  $9952,$02 Send it to the speaker.
  $9954,$02 Decrease the repeat loop counter by one and loop back to #R$9946
. until the repeat loop counter is zero.
  $9956,$01 Return.

c $9957 Control Code #N$04:
@ $9957 label=ControlCode_04
  $9957,$01 Return.

u $9958
  $9958,$03 Jump to #R$95BE.

c $995B
  $995B,$02 Restore #REGbc and #REGde from the stack.
  $995D,$02 Restore #REGaf and #REGhl from the stack.
  $995F,$01 Return.

c $9960
  $9960,$01 Restore #REGde from the stack.
  $9961,$03 Restore #REGbc, #REGaf and #REGhl from the stack.
  $9964,$01 Return.

g $9965 Table: Control Codes
@ $9965 label=Table_ControlCodes
B $9965,$20

g $9985 Jump Table: Control Codes
@ $9985 label=JumpTable_ControlCodes
W $9985,$02 #N((#PC-$9985)/$02): #R(#PEEK(#PC)+#PEEK(#PC+$01)*$100).
L $9985,$02,$20

w $99C5

g $99F5 Control Type
@ $99F5 label=ControlType
D $99F5 #TABLE(default,centre) { =h Byte | =h Meaning }
. { #N$00 | 1 Keyboard }
. { #N$01 | 2 Kempston Joystick }
. { #N$02 | 3 Interface Two }
. { #N$03 | 4 Cursor Joystick }
. TABLE#
B $99F5,$01

g $99F6 Dart Pointer Position
@ $99F6 label=DartPointer_Position
D $99F6 Holds the number of the menu selection the dart points at in the main
. menu.
. #TABLE(default,centre) { =h Byte | =h Meaning }
. { #N$00 | 1 Keyboard }
. { #N$01 | 2 Kempston Joystick }
. { #N$02 | 3 Interface Two }
. { #N$03 | 4 Cursor Joystick }
. TABLE#
B $99F6,$01

c $99F7 Interrupt Driven Controls
@ $99F7 label=InterruptDrivenControls
  $99F7,$02 #REGc=#N$00.
  $99F9,$03 #REGhl=#R$9A6F.
  $99FC,$01 Stash #REGhl on the stack.
  $99FD,$03 #REGa=*#R$99F5.
  $9A00,$01 Decrease #REGa by one.
  $9A01,$01 Return if *#R$99F5 was set to "keyboard" (#N$00).
  $9A02,$01 Multiply #REGa by #N$02.
  $9A03,$05 #REGhl=#R$9A10+#REGa.
  $9A08,$02 Jump to #R$9A0B if #REGa is greater than or equal to #N$00.
  $9A0A,$01 Increment #REGh by one.
  $9A0B,$01 #REGa=*#REGhl.
  $9A0C,$01 Increment #REGhl by one.
  $9A0D,$01 #REGh=*#REGhl.
  $9A0E,$01 #REGl=#REGa.
  $9A0F,$01 Jump to the address held in *#REGhl.

g $9A10 Jump Table: Control Methods
@ $9A10 label=JumpTable_ControlMethods
W $9A10,$02
L $9A10,$02,$03

c $9A16 Control Method: Kempston Joystick
@ $9A16 label=ControlMethod_Kempston
R $9A16 O:C Control byte
  $9A16,$01 #REGa=#N$00.
  $9A17,$02 #REGa=byte from port #N$1F.
  $9A19,$02,b$01 Keep only bits 0-4.
  $9A1B,$01 Store the result in #REGc.
  $9A1C,$01 Return.

c $9A1D Control Method: Interface Two
@ $9A1D label=ControlMethod_InterfaceTwo
R $9A1D O:B
R $9A1D O:C Control byte
R $9A1D O:HL Pointer to Key Map
  $9A1D,$01 Restore #REGhl from the stack.
  $9A1E,$03 Call #R$9A6F.
  $9A21,$02,b$01 Keep only bits 5-7.
  $9A23,$01 Store the result in #REGc.
  $9A24,$03 #REGhl=#R$9A2B.
  $9A27,$02,b$01 #REGb=#N$08.
  $9A29,$02 Jump to #R$9A74.

g $9A2B Key Map: Interface Two
@ $9A2B label=KeyMap_InterfaceTwo
N $9A2B #MAP((#PC-$9A2B)/$03)(Fire,1:Up,2:Down,3:Left,4:Right).
B $9A2B,$01
B $9A2C,b$01
M $9A2B,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$EF | 0 | 9 | 8 | 7 | 6 }
. TABLE#
B $9A2D,$01 "#CHR(#PEEK(#PC))".
L $9A2B,$03,$05

c $9A3A Control Method: Cursor Joystick
@ $9A3A label=ControlMethod_Cursor
R $9A3A O:B
R $9A3A O:C Control byte
R $9A3A O:HL Pointer to Key Map
  $9A3A,$01 Restore #REGhl from the stack.
  $9A3B,$03 Call #R$9A6F.
  $9A3E,$02,b$01 Keep only bits 5-7.
  $9A40,$01 Store the result in #REGc.
  $9A41,$03 #REGhl=#R$9A48.
  $9A44,$02,b$01 #REGb=#N$08.
  $9A46,$02 Jump to #R$9A74.

g $9A48 Key Map: Cursor Joystick
@ $9A48 label=KeyMap_Cursor
N $9A48 #MAP((#PC-$9A48)/$03)(Fire,1:Up,2:Down,3:Left,4:Right).
B $9A48,$01
B $9A49,b$01
M $9A48,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. #IF(#PEEK(#PC)==$EF)(
. { #N$EF | 0 | 9 | 8 | 7 | 6 },
. { #N$F7 | 1 | 2 | 3 | 4 | 5 })
. TABLE#
B $9A4A,$01 "#CHR(#PEEK(#PC))".
L $9A48,$03,$05

b $9A57

b $9A59

g $9A60 User-Defined Keys
@ $9A60 label=UserDefinedKeys_Fire
B $9A60,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$7F | SPACE | FULL-STOP | M | N | B }
. TABLE#
B $9A62,$01 "#CHR(#PEEK(#PC))".
@ $9A63 label=UserDefinedKeys_Up
B $9A63,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FB | Q | W | E | R | T }
. TABLE#
B $9A65,$01 "#CHR(#PEEK(#PC))".
@ $9A66 label=UserDefinedKeys_Down
B $9A66,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FD | A | S | D | F | G }
. TABLE#
B $9A68,$01 "#CHR(#PEEK(#PC))".
@ $9A69 label=UserDefinedKeys_Left
B $9A69,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$DF | P | O | I | U | Y }
. TABLE#
B $9A6B,$01 "#CHR(#PEEK(#PC))".
@ $9A6C label=UserDefinedKeys_Right
B $9A6C,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$DF | P | O | I | U | Y }
. TABLE#
B $9A6E,$01 "#CHR(#PEEK(#PC))".

c $9A6F Controls
@ $9A6F label=Controls
R $9A6F
  $9A6F,$02 #REGb=#N$01.
  $9A71,$03 #REGhl=#R$9A57.
  $9A74,$01 #REGa=*#REGhl.
  $9A75,$01 Increment #REGhl by one.
  $9A76,$02 #REGa=byte from port #N$FE.
  $9A78,$01 Merge the bits from *#REGhl.
  $9A79,$02 Increment #REGhl by two.
  $9A7B,$02 Jump to #R$9A7E if #REGhl is not equal to *#REGhl.
  $9A7D,$01 Set the carry flag.
  $9A7E,$02 Rotate #REGb left.
  $9A80,$02 Jump to #R$9A74 if #REGhl is greater than or equal to *#REGhl.
  $9A82,$01 #REGa=#REGb.
  $9A83,$01 Set the bits from #REGc.
  $9A84,$01 #REGc=#REGa.
  $9A85,$01 Return.

c $9A86
  $9A86,$01 #REGa=#REGb.
  $9A87,$03 #REGhl=#R$91AB(#N$91AE).
  $9A8A,$01 #REGa+=#REGl.
  $9A8B,$01 #REGl=#REGa.
  $9A8C,$02 Jump to #R$9A8F if ?? is greater than or equal to #N$00.
  $9A8E,$01 Increment #REGh by one.
  $9A8F,$01 #REGa=*#REGhl.
  $9A90,$01 #REGa+=#REGc.
  $9A91,$02 Compare #REGa with #N$3A.
  $9A93,$02 Jump to #R$9A99 if #REGa is greater than or equal to #N$3A.
  $9A95,$01 Write #REGa to *#REGhl.
  $9A96,$03 Jump to #R$91A1.
  $9A99,$02 #REGa-=#N$0A.
  $9A9B,$01 Write #REGa to *#REGhl.
  $9A9C,$01 Decrease #REGb by one.
  $9A9D,$02 #REGc=#N$01.
  $9A9F,$01 #REGa=#REGb.
  $9AA0,$01 Increment #REGa by one.
  $9AA1,$03 Jump to #R$91A1 if #REGa is equal to #N$01.
  $9AA4,$02 Jump to #R$9A86.

b $9AA6

g $9AA6 Player Leg Counts
@ $9AA6 label=Leg_1UP
B $9AA6,$01
@ $9AA7 label=Leg_2UP
B $9AA7,$01

g $9AA8 Bust Counter
@ $9AA8 label=BustCounter
B $9AA8,$01

g $9AA9
  $9AA9,$01
  $9AAA,$01

g $9AAB Current Opponent Portrait
@ $9AAB label=CurrentOpponent_Portrait
W $9AAB,$02

b $9AAD
  $9AAD,$01

g $9AAE Current Opponent Pub Scene
@ $9AAE label=CurrentOpponent_PubScene
W $9AAE,$02

g $9AB0 Player Current Total
@ $9AB0 label=2UP_Total
W $9AB0,$02
@ $9AB2 label=1UP_Total
W $9AB2,$02

b $9AB4
  $9AB5
  $9AB6
  $9AB7

g $9AB8 Active Player
@ $9AB8 label=ActivePlayer
D $9AB8 #TABLE(default,centre,centre)
. { =h Byte | =h Player }
. { #N$00 | Player Two }
. { #N$01 | Player One }
. TABLE#
B $9AB8,$01

g $9AB9
W $9AB9,$02

g $9ABD
W $9ABD,$02

g $9ABF

g $9AC3 Floating Hand Co-ordinates
@ $9AC3 label=FloatingHandCoordinates
B $9AC3,$02,$01

g $9AC5
  $9AC5
  $9AC6

g $9AC7 Floating Hand Frame Number
@ $9AC7 label=FloatingHand_FrameNumber
B $9AC7,$01

g $9AC8 Table: Floating Hand Graphics
@ $9AC8 label=Table_FloatingHandGraphics
N $9AC8 Frame #N($01+(#PC-$9AC8)/$04):
W $9AC8,$02
W $9ACA,$02
L $9AC8,$04,$06

g $9AE0

g $9AEC
B $9AEC,$06

g $9AF2
B $9AF2,$06

g $9AF8
B $9AF8,$06

g $9AFE
B $9AFE,$06

g $9B04
  $9B05
  $9B06
  $9B07

  $9B0F

g $9B10
B $9B10,$01

g $9B11
B $9B11,$01

g $9B12
B $9B12,$01

g $9B13 Floating Hand Graphic Data
@ $9B13 label=FloatingHand_GraphicData
W $9B13,$02

g $9B15 Floating Hand Mask Data
@ $9B15 label=FloatingHand_MaskData
W $9B15,$02

g $9B17
W $9B17,$02

g $9B19
W $9B19,$02

g $9B1B
W $9B1B,$02

g $9B1D
W $9B1D,$02

g $9B1F Score?
@ $9B1F label=Score
B $9B1F,$02

g $9B21 Quarter Finals Opponent Data
@ $9B21 label=QuarterFinals_OpponentData
W $9B21,$02

g $9B23 Semi Finals Opponent Data
@ $9B23 label=SemiFinals_OpponentData
W $9B23,$02

g $9B25
  $9B26
  $9B27
  $9B28
  $9B29
  $9B2A
  $9B2B
  $9B2C
  $9B2D
  $9B2E
  $9B2F
  $9B33
  $9B35

g $9C55
W $9C55,$02

g $9C9F
W $9C9F,$02

g $9CE9
W $9CE9,$02

c $9D33 Initialise New Game
@ $9D33 label=InitialiseNewGame
  $9D33,$03 Call #R$A7A5.
  $9D36,$03 Call #R$A835.
  $9D39,$03 Call #R$A851.
  $9D3C,$03 Call #R$A505.
  $9D3F,$03 Jump to #R$A8F8.

c $9D42
  $9D42,$03 Call #R$CC62.
  $9D45,$03 #REGa=*#R$9B2C.
  $9D48,$03 Jump to #R$9D53 if *#R$9B2C is zero.
  $9D4B,$03 Call #R$A41E.
  $9D4E,$05 Write #N$02 to *#R$9B0F.
  $9D53,$03 Call #R$CC62.
  $9D56,$06 Jump to #R$9D6A if *#R$9B2C is zero.
  $9D5C,$07 Jump to #R$AA0A if *#R$9B2D is zero.
  $9D63,$07 Jump to #R$A9E5 if *#R$9B2A is not equal to zero.
  $9D6A,$0A Write #N$00 to; #LIST
. { *#R$9B06 }
. { *#R$9B04 }
. { *#R$9B05 }
. LIST#
  $9D74,$03 #REGhl=#R$9B25.
  $9D77,$01 Decrease *#REGhl by one.
  $9D78,$03 Jump to #R$9DB3 if *#REGhl is greater than or equal to #REGa.
  $9D7B,$01 Stash #REGhl on the stack.
  $9D7C,$03 #REGhl=#R$9B07.
  $9D7F,$04 #REGe=*#R$9B10.
  $9D83,$02 #REGd=#N$00.
  $9D85,$01 #REGhl+=#REGde.
  $9D86,$01 #REGa=*#REGhl.
  $9D87,$01 Restore #REGhl from the stack.
  $9D88,$01 Write #REGa to *#REGhl.
N $9D89 Increment the floating hand frame number.
  $9D89,$03 #REGa=*#R$9AC7.
  $9D8C,$01 Increment #REGa by one.
  $9D8D,$03 Write the updated frame number back to *#R$9AC7.
N $9D90 Have we gone past the last frame?
  $9D90,$04 Jump to #R$9D98 if the frame number is not equal to #N$06.
N $9D94 The frame count has gone too high, so reset it.
  $9D94,$04 Reset *#R$9AC7 back to #N$00.
N $9D98 Convert the frame count to an offset in #REGde.
@ $9D98 label=CalculateHand_Offset
  $9D98,$03 #REGa=*#R$9AC7.
  $9D9B,$03 Multiply #REGa by #N$04 and store the result in #REGe.
  $9D9E,$02 #REGd=#N$00.
N $9DA0 Now fetch the frame and mask pointers from the table at #R$9AC8.
  $9DA0,$04 Add the offset in #REGde to #R$9AC8.
  $9DA4,$03 Fetch the frame graphic data pointer and store it in #REGde.
  $9DA7,$04 Write #REGde to *#R$9B13.
  $9DAB,$04 Fetch the mask graphic data pointer and store it in #REGde.
  $9DAF,$04 Write #REGde to *#R$9B15.
  $9DB3,$08 Jump to #R$A2AD if bit 4 of *#R$F821 is unset.
  $9DBB,$03 #REGhl=#R$9AA9.
  $9DBE,$01 Increment *#REGhl by one.
  $9DBF,$06 Write #N($0001,$04,$04) to *#R$9B1B.
  $9DC5,$06 Write #N($0064,$04,$04) to *#R$9B1D.
  $9DCB,$03 #REGa=*#R$9B11.
  $9DCE,$02 #REGa+=#N$10.
  $9DD0,$03 Write #REGa to *#R$9B12.
  $9DD3,$03 #REGhl=*#R$9AC3.
  $9DD6,$01 Increment #REGl by one.
  $9DD7,$01 #REGa=#REGh.
  $9DD8,$02 #REGa-=#N$05.
  $9DDA,$01 #REGh=#REGa.
  $9DDB,$03 Write #REGhl to *#R$9AC5.
  $9DDE,$03 #REGa=*#R$9B0F.
  $9DE1,$01 Increment #REGa by one.
  $9DE2,$03 Write #REGa to *#R$9B0F.
  $9DE5,$06 Write #R$8940 to *#R$9B13.
  $9DEB,$06 Write #R$8AC8 to *#R$9B15.
  $9DF1,$0B Copy #N$0120 bytes of data from *#R$8C50 to *#R$9B35.
  $9DFC,$03 #REGhl=#R$9B35.
  $9DFF,$02 #REGb=#N$03.
  $9E01,$05 Write #N$A7 to *#R$A641.
  $9E06,$02 Stash #REGbc and #REGhl on the stack.
  $9E08,$03 Call #R$A639.
  $9E0B,$01 Restore #REGhl from the stack.
  $9E0C,$04 #REGhl+=#N($0030,$04,$04).
  $9E10,$01 Restore #REGbc from the stack.
  $9E11,$02 Decrease counter by one and loop back to #R$9E06 until counter is zero.
  $9E13,$02 #REGb=#N$03.
  $9E15,$05 Write #N$37 to *#R$A641.
  $9E1A,$02 Stash #REGbc and #REGhl on the stack.
  $9E1C,$03 Call #R$A639.
  $9E1F,$01 Restore #REGhl from the stack.
  $9E20,$04 #REGhl+=#N($0030,$04,$04).
  $9E24,$01 Restore #REGbc from the stack.
  $9E25,$02 Decrease counter by one and loop back to #R$9E1A until counter is zero.
  $9E27,$06 Write #R$9B35 to *#R$9B17.
  $9E2D,$06 Write #R$9BC5 to *#R$9B19.
  $9E33,$03 #REGhl=#R$9AC4.
  $9E36,$01 Increment *#REGhl by one.
  $9E37,$03 Call #R$A461.
  $9E3A,$03 Call #R$A491.
  $9E3D,$02 #REGb=#N$10.
  $9E3F,$01 Stash #REGbc on the stack.
  $9E40,$04 #REGbc=*#R$9B1B.
  $9E44,$01 Decrease #REGbc by one.
  $9E45,$04 Jump to #R$9E44 until #REGbc is zero.
  $9E49,$03 #REGhl=*#R$9B1B.
  $9E4C,$04 #REGbc=*#R$9B1D.
  $9E50,$01 #REGhl+=#REGbc.
  $9E51,$03 Write #REGhl to *#R$9B1B.
  $9E54,$03 #REGhl=#R$9B12.
  $9E57,$01 Decrease *#REGhl by one.
  $9E58,$03 Call #R$A491.
  $9E5B,$01 Restore #REGbc from the stack.
  $9E5C,$02 Decrease counter by one and loop back to #R$9E3F until counter is zero.
N $9E5E Small pause.
  $9E5E,$03 #REGbc=#N($1770,$04,$04).
@ $9E61 label=SmallPause_Loop
  $9E61,$01 Decrease #REGbc by one.
  $9E62,$04 Jump to #R$9E61 until #REGbc is zero.
  $9E66,$02 #REGb=#N$10.
  $9E68,$01 Stash #REGbc on the stack.
  $9E69,$05 Jump to #R$9E7C if #REGb is less than #N$08.
  $9E6E,$06 Write #R$9B65 to *#R$9B17.
  $9E74,$06 Write #R$9BF5 to *#R$9B19.
  $9E7A,$02 Jump to #R$9E88.

  $9E7C,$06 Write #R$9B95 to *#R$9B17.
  $9E82,$06 Write #R$9C25 to *#R$9B19.
  $9E88,$04 #REGbc=*#R$9B1B.
  $9E8C,$01 Decrease #REGbc by one.
  $9E8D,$04 Jump to #R$9E8C until #REGbc is zero.
  $9E91,$03 #REGhl=*#R$9B1B.
  $9E94,$04 #REGbc=*#R$9B1D.
  $9E98,$02 #REGhl-=#REGbc.
  $9E9A,$03 Write #REGhl to *#R$9B1B.
  $9E9D,$03 #REGhl=#R$9B12.
  $9EA0,$01 Increment *#REGhl by one.
  $9EA1,$03 Call #R$A491.
  $9EA4,$01 Restore #REGbc from the stack.
  $9EA5,$02 Decrease counter by one and loop back to #R$9E68 until counter is zero.
  $9EA7,$03 Call #R$A8EA.
  $9EAA,$03 #REGhl=#R$9C55.
  $9EAD,$03 #REGde=#N($004A,$04,$04).
  $9EB0,$03 #REGa=*#R$9B0F.
  $9EB3,$01 Decrease #REGa by one.
  $9EB4,$02 Jump to #R$9EBA if #REGa is equal to #REGc.
  $9EB6,$01 #REGhl+=#REGde.
  $9EB7,$01 Decrease #REGa by one.
  $9EB8,$02 Jump to #R$9EB4.

  $9EBA,$04 #REGde=*#R$9AC5.
  $9EBE,$01 Decrease #REGe by one.
  $9EBF,$01 Write #REGe to *#REGhl.
  $9EC0,$01 Increment #REGhl by one.
  $9EC1,$01 Write #REGd to *#REGhl.
  $9EC2,$01 Increment #REGhl by one.
  $9EC3,$02 Increment #REGd by two.
  $9EC5,$03 Call #R$A4AB.
  $9EC8,$02 #REGb=#N$05.
  $9ECA,$04 #REGde=*#R$9AC5.
  $9ECE,$03 #REGhl=#R$7800.
  $9ED1,$03 Call #R$A774.
  $9ED4,$07 Multiply *#R$9AC5 by #N$08 and store the result in #REGb.
  $9EDB,$03 #REGa=*#R$9B10.
  $9EDE,$01 #REGa+=#REGb.
  $9EDF,$02 #REGb=#N$A0.
  $9EE1,$01 #REGa-=#REGb.
  $9EE2,$02 #REGa+=#N$02.
  $9EE4,$03 Write #REGa to *#R$9B28.
  $9EE7,$01 #REGe=#REGa.
  $9EE8,$02 #REGd=#N$00.
  $9EEA,$03 #REGa=*#R$9AC6.
  $9EED,$02 #REGa+=#N$03.
  $9EEF,$01 #REGa+=#REGa.
  $9EF0,$01 #REGa+=#REGa.
  $9EF1,$01 #REGa+=#REGa.
  $9EF2,$01 #REGb=#REGa.
  $9EF3,$03 #REGa=*#R$9B11.
  $9EF6,$01 #REGa+=#REGb.
  $9EF7,$01 #REGb=#REGa.
  $9EF8,$02 #REGa=#N$C0.
  $9EFA,$01 #REGa-=#REGb.
  $9EFB,$02 #REGb=#N$60.
  $9EFD,$01 #REGa-=#REGb.
  $9EFE,$02 #REGa+=#N$02.
  $9F00,$03 Write #REGa to *#R$9B29.
  $9F03,$01 #REGh=#REGa.
  $9F04,$02 #REGl=#N$00.
  $9F06,$01 #REGa=#REGe.
  $9F07,$04 Jump to #R$9F18 if #REGd is greater than or equal to #REGa.
  $9F0B,$02 NEG.
  $9F0D,$01 #REGe=#REGa.
  $9F0E,$01 #REGa=#REGh.
  $9F0F,$04 Jump to #R$9F27 if #REGd is greater than or equal to #REGa.
  $9F13,$02 NEG.
  $9F15,$01 #REGh=#REGa.
  $9F16,$02 Jump to #R$9F2C.
  $9F18,$01 #REGa=#REGh.
  $9F19,$04 Jump to #R$9F22 if #REGd is greater than or equal to #REGa.
  $9F1D,$02 NEG.
  $9F1F,$01 #REGh=#REGa.
  $9F20,$02 Jump to #R$9F31.

  $9F22,$03 #REGbc=#R$9AEC.
  $9F25,$02 Jump to #R$9F34.

  $9F27,$03 #REGbc=#R$9AF2.
  $9F2A,$02 Jump to #R$9F34.

  $9F2C,$03 #REGbc=#R$9AF8.
  $9F2F,$02 Jump to #R$9F34.

  $9F31,$03 #REGbc=#R$9AFE.
  $9F34,$04 Write #REGbc to *#R$9ABD.
  $9F38,$01 #REGa=#REGe.
  $9F39,$03 Jump to #R$9F41 if #REGd is not equal to #REGa.
  $9F3C,$03 #REGbc=#N($0646,$04,$04).
  $9F3F,$02 Jump to #R$9F4A.

  $9F41,$03 #REGbc=#N($0000,$04,$04).
  $9F44,$02 #REGhl-=#REGde (with carry).
  $9F46,$01 Increment #REGbc by one.
  $9F47,$02 Jump to #R$9F44 if #REGbc is greater than or equal to #REGa.
  $9F49,$01 Decrease #REGbc by one.
  $9F4A,$01 #REGh=#REGb.
  $9F4B,$01 #REGl=#REGc.
  $9F4C,$01 #REGa=#N$00.
  $9F4D,$03 #REGde=#R$9AE0.
  $9F50,$01 Exchange the #REGde and #REGhl registers.
  $9F51,$01 #REGc=*#REGhl.
  $9F52,$01 Increment #REGhl by one.
  $9F53,$01 #REGb=*#REGhl.
  $9F54,$01 Increment #REGhl by one.
  $9F55,$01 Exchange the #REGde and #REGhl registers.
  $9F56,$01 Set flags.
  $9F57,$02 #REGhl-=#REGbc.
  $9F59,$01 #REGhl+=#REGbc.
  $9F5A,$02 Jump to #R$9F5F if #REGhl is greater than or equal to #REGa.
  $9F5C,$01 Increment #REGa by one.
  $9F5D,$02 Jump to #R$9F50.
  $9F5F,$03 #REGhl=*#R$9ABD.
  $9F62,$01 #REGe=#REGa.
  $9F63,$02 #REGd=#N$00.
  $9F65,$01 #REGhl+=#REGde.
  $9F66,$01 #REGa=*#REGhl.
  $9F67,$03 Write #REGa to *#R$AF49.
  $9F6A,$03 Write #REGa to *#R$9B2E.
  $9F6D,$04 Write #N$00 to *#R$AF4A.
  $9F71,$03 #REGa=*#R$9B28.
  $9F74,$04 Jump to #R$9F7A if #REGa is greater than or equal to #REGa.
  $9F78,$02 NEG.
  $9F7A,$01 #REGe=#REGa.
  $9F7B,$02 #REGd=#N$00.
  $9F7D,$03 #REGhl=#N($0000,$04,$04).
  $9F80,$03 Jump to #R$9F87 if #REGa is equal to #REGa.
  $9F83,$01 #REGhl+=#REGde.
  $9F84,$01 Decrease #REGa by one.
  $9F85,$02 Jump to #R$9F80.
  $9F87,$01 Stash #REGhl on the stack.
  $9F88,$03 #REGa=*#R$9B29.
  $9F8B,$04 Jump to #R$9F91 if #REGa is greater than or equal to #REGa.
  $9F8F,$02 NEG.
  $9F91,$01 #REGe=#REGa.
  $9F92,$02 #REGd=#N$00.
  $9F94,$03 #REGhl=#N($0000,$04,$04).
  $9F97,$03 Jump to #R$9F9E if #REGa is equal to #REGa.
  $9F9A,$01 #REGhl+=#REGde.
  $9F9B,$01 Decrease #REGa by one.
  $9F9C,$02 Jump to #R$9F97.
  $9F9E,$01 Exchange the #REGde and #REGhl registers.
  $9F9F,$01 Restore #REGhl from the stack.
  $9FA0,$01 #REGhl+=#REGde.
  $9FA1,$03 #REGbc=#N($000A,$04,$04).
  $9FA4,$01 Set flags.
  $9FA5,$02 #REGhl-=#REGbc.
  $9FA7,$01 #REGhl+=#REGbc.
  $9FA8,$02 Jump to #R$9FB9 if #REGa is greater than or equal to #REGa.
  $9FAA,$02 #REGa=#N$32.
  $9FAC,$03 Write #REGa to *#R$AF49.
  $9FAF,$03 Write #REGa to *#R$9B2E.
  $9FB2,$03 #REGhl=#R$9B05.
  $9FB5,$02 Write #N$01 to *#REGhl.
  $9FB7,$02 Jump to #R$A010.
  $9FB9,$03 #REGbc=#N($003B,$04,$04).
  $9FBC,$01 Set flags.
  $9FBD,$02 #REGhl-=#REGbc.
  $9FBF,$01 #REGhl+=#REGbc.
  $9FC0,$02 Jump to #R$9FCC if #REGa is greater than or equal to #REGa.
  $9FC2,$02 #REGa=#N$19.
  $9FC4,$03 Write #REGa to *#R$AF49.
  $9FC7,$03 Write #REGa to *#R$9B2E.
  $9FCA,$02 Jump to #R$A010.
  $9FCC,$03 #REGbc=#N($0678,$04,$04).
  $9FCF,$01 Set flags.
  $9FD0,$02 #REGhl-=#REGbc.
  $9FD2,$01 #REGhl+=#REGbc.
  $9FD3,$02 Jump to #R$A010 if #REGa is less than #REGa.
  $9FD5,$03 #REGbc=#N($0900,$04,$04).
  $9FD8,$01 Set flags.
  $9FD9,$02 #REGhl-=#REGbc.
  $9FDB,$01 #REGhl+=#REGbc.
  $9FDC,$02 Jump to #R$9FE9 if #REGa is greater than or equal to #REGa.
  $9FDE,$03 #REGa=*#R$AF49.
  $9FE1,$01 #REGb=#REGa.
  $9FE2,$01 #REGa+=#REGa.
  $9FE3,$01 #REGa+=#REGb.
  $9FE4,$03 Write #REGa to *#R$AF49.
  $9FE7,$02 Jump to #R$A010.

  $9FE9,$03 #REGbc=#N($12C2,$04,$04).
  $9FEC,$01 Set flags.
  $9FED,$02 #REGhl-=#REGbc.
  $9FEF,$01 #REGhl+=#REGbc.
  $9FF0,$02 Jump to #R$A010 if #REGa is less than #REGa.
  $9FF2,$03 #REGbc=#N$1690.
  $9FF5,$01 Set flags.
  $9FF6,$02 #REGhl-=#REGbc.
  $9FF8,$01 #REGhl+=#REGbc.
  $9FF9,$02 Jump to #R$A009 if #REGa is greater than or equal to #REGa.
  $9FFB,$03 #REGa=*#R$AF49.
  $9FFE,$01 #REGa+=#REGa.
  $9FFF,$03 Write #REGa to *#R$AF49.
  $A002,$05 Write #N$01 to *#R$9B04.
  $A007,$02 Jump to #R$A010.
  $A009,$07 Write #N$00 to; #LIST { *#R$AF49 } { *#R$9B2E } LIST#
  $A010,$03 #REGa=*#R$9B2C.
  $A013,$03 Jump to #R$A046 if #REGa is equal to #REGa.
  $A016,$03 Call #R$A434.
  $A019,$04 #REGb=*#R$9B2E
  $A01D,$03 #REGa=*#R$9B2D.
  $A020,$04 Jump to #R$A0B9 if #REGa is not equal to #REGb.
  $A024,$01 Decrease #REGa by one.
  $A025,$03 Write #REGa to *#R$9B2D.
  $A028,$03 Call #R$964C.
B $A02B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A02E,$05 "#STR#(#PC,$04,$05)".
L $A02B,$08,$03
B $A043,$01 Terminator.
  $A044,$02 Jump to #R$A0B9.

  $A046,$04 #REGde=*#R$AF49.
  $A04A,$04 #REGb=*#R$AF49.
  $A04E,$03 #REGa=*#R$9AAD.
  $A051,$01 #REGa+=#REGb.
  $A052,$03 Write #REGa to *#R$9AAD.
  $A055,$06 Jump to #R$A06B if *#R$9AB7 is zero.
  $A05B,$06 Jump to #R$A066 if *#R$9AB8 is zero.
  $A061,$03 #REGhl=*#R$9AB0.
  $A064,$02 Jump to #R$A06E.

  $A066,$03 #REGhl=*#R$9AB2.
  $A069,$02 Jump to #R$A06E.

  $A06B,$03 #REGhl=*#R$9B1F.
  $A06E,$02 #REGhl-=#REGde (with carry).
  $A070,$03 Jump to #R$A0D6 if ?? is less than #REGa.
  $A073,$03 Jump to #R$A08F if ?? is not equal to #REGa.
  $A076,$07 Jump to #R$A087 if *#R$9B04 is not equal to zero.
  $A07D,$07 Jump to #R$A087 if *#R$9B05 is not equal to zero.
  $A084,$03 Jump to #R$A0D6.

  $A087,$05 Write #N$01 to *#R$9B06.
  $A08C,$03 Jump to #R$A103.

  $A08F,$01 #REGa=#REGl.
  $A090,$01 Decrease #REGa by one.
  $A091,$01 Set the bits from #REGh.
  $A092,$03 Jump to #R$A0D6 if #REGa is equal to #REGh.
  $A095,$06 Jump to #R$A0AB if *#R$9AB7 is zero.
  $A09B,$06 Jump to #R$A0A6 if *#R$9AB8 is zero.
  $A0A1,$03 Write #REGhl to *#R$9AB0.
  $A0A4,$02 Jump to #R$A0AE.

  $A0A6,$03 Write #REGhl to *#R$9AB2.
  $A0A9,$02 Jump to #R$A0AE.

  $A0AB,$03 Write #REGhl to *#R$9B1F.
  $A0AE,$03 Call #R$AE17.
  $A0B1,$03 #REGa=*#R$AF5D(#N$AF5E).
  $A0B4,$02 #REGa+=#N$02.
  $A0B6,$03 Write #REGa to *#R$AF5D(#N$AF5E).
  $A0B9,$03 Call #R$B77A.
  $A0BC,$06 Write #N$0810 to *#R$9AC3.
  $A0C2,$03 Call #R$A461.
  $A0C5,$07 Jump to #R$9D42 if *#R$9B2C is not equal to zero.
  $A0CC,$07 Jump to #R$A103 if *#R$9B0F is equal to #N$03.
  $A0D3,$03 Jump to #R$A37A.

c $A0D6 Handler: Bust
@ $A0D6 label=Handler_Bust
  $A0D6,$03 Call #R$964C.
B $A0D9,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A0DC,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(bust)
B $A0E2,$01 Terminator.
  $A0E3,$03 #REGhl=#R$9AA8.
  $A0E6,$01 Increment *#REGhl by one.
  $A0E7,$03 #REGhl=*#R$9B33.
  $A0EA,$06 Jump to #R$A100 if *#R$9AB7 is zero.
  $A0F0,$06 Jump to #R$A0FB if *#R$9AB8 is zero.
N $A0F6 Update 2UP total.
  $A0F6,$03 Write #REGhl to *#R$9AB0.
  $A0F9,$02 Jump to #R$A103.
N $A0FB Update 1UP total.
@ $A0FB label=Bust_Update1Up_Total
  $A0FB,$03 Write #REGhl to *#R$9AB2.
  $A0FE,$02 Jump to #R$A103.

N $A100 Update the total for single player games.
@ $A100 label=Bust_UpdateSingleUp_Total
  $A100,$03 Write #REGhl to *#R$9B1F.
  $A103,$06 Write #N$0810 to *#R$9AC3.
  $A109,$06 Jump to #R$A11F if *#R$9AB7 is zero.
  $A10F,$06 Jump to #R$A11A if *#R$9AB8 is zero.

  $A115,$03 #REGhl=*#R$9AB0.
  $A118,$02 Jump to #R$A122.

  $A11A,$03 #REGhl=*#R$9AB2.
  $A11D,$02 Jump to #R$A122.

  $A11F,$06 Write *#R$9B1F to *#R$AF49.
  $A125,$06 Write #N$0C01 to *#R$AF5D.
  $A12B,$03 Call #R$AE17.
  $A12E,$07 Jump to #R$A13E if *#R$9AAD is not equal to #N$B4.
  $A135,$06 Jump to #R$A13E if *#R$9AA8 is not zero.
  $A13B,$03 Call #R$CA7C.
  $A13E,$07 Write #N$00 to; #LIST
. { *#R$9AAD }
. { *#R$9AA8 }
. LIST#
  $A145,$06 Jump to #R$A165 if *#R$9B06 is not zero.
  $A14B,$03 Call #R$AE04.
  $A14E,$06 Jump to #R$A15C if *#R$9AB7 is zero.
  $A154,$03 Call #R$AAA8.
  $A157,$03 Call #R$A7F8.
  $A15A,$02 Jump to #R$A165.

c $9D33

c $A15C Messaging: You Win!
@ $A15C label=Messaging_YouWin
  $A15C,$03 Call #R$A7F8.
  $A15F,$03 Call #R$CBC8.
  $A162,$03 Call #R$AB2E.
  $A165,$04 Write #N$00 to *#R$9B0F.
  $A169,$07 Jump to #R$A272 if *#R$9B06 is zero.
  $A170,$03 Call #R$A7F8.
  $A173,$03 Set the co-ordinates in #REGhl to #N$0F/ #N$01.
  $A176,$03 Set the block dimensions in #REGbc to #N$08/ #N$06.
  $A179,$05 Call #R$B5A6. with #COLOUR$00
  $A17E,$03 Call #R$964C.
B $A181,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A184,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(great)
B $A18A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A18D,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(shot)
B $A193,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A196,$06 "#STR#(#PC,$04,$06)".
B $A19C,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A19F,$06 #FONT#(:(#STR(#PC,$04,$05)))$8D75,attr=$47(you)
B $A1A5,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1A8,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(win)
B $A1AE,$01 Terminator.
  $A1AF,$02 #REGa=#N$01.
  $A1B1,$03 Call #R$CB1E.
  $A1B4,$06 Jump to #R$A1F5 if *#R$9AB7 is zero.
  $A1BA,$03 Call #R$964C.
B $A1BD,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1C0,$01 "#STR#(#PC,$04,$01)".
B $A1C1,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1C4,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(player)
B $A1CA,$01 Terminator.
  $A1CB,$06 Jump to #R$A1DE if *#R$9AB8 is zero.
  $A1D1,$03 Call #R$964C.
B $A1D4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1D7,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(two!)
B $A1DB,$01 Terminator.
  $A1DC,$02 Jump to #R$A1E9.

  $A1DE,$03 Call #R$964C.
B $A1E1,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1E4,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(one!)
B $A1E8,$01 Terminator.
  $A1E9,$03 Call #R$AE04.
  $A1EC,$03 Call #R$AE04.
  $A1EF,$03 Call #R$AE04.
  $A1F2,$03 Jump to #R$933F.

  $A1F5,$03 Call #R$AE04.
  $A1F8,$03 #REGa=*#R$9AB4.
  $A1FB,$05 Jump to #R$AA5A if #REGa is equal to #N$04.
  $A200,$05 Jump to #R$AA7B if #REGa is equal to #N$02.
  $A205,$03 Call #R$964C.
B $A208,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A20A,$02 INK: #INK(#PEEK(#PC+$01)).
B $A20C,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A20E,$01
B $A20F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A212,$12 #FONT#(:(#STR(#PC,$04,$12)))$8D75,attr=$47(beat-jammy-jim)
B $A224,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A227,$0E #FONT#(:(#STR(#PC,$04,$0E)))$8D75,attr=$47(in-the-final)
B $A235,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A238,$13 #FONT#(:(#STR(#PC,$04,$13)))$8D75,attr=$47(should-take-up)
B $A24B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A24E,$17 #FONT#(:(#STR(#PC,$04,$17)))$8D75,attr=$47(professionally)
B $A265,$01 Terminator.
  $A266,$03 Call #R$AE04.
  $A269,$03 Call #R$AE04.
  $A26C,$03 Call #R$AE04.
  $A26F,$03 Jump to #R$933F.

c $A272
  $A272,$07 Jump to #R$933F if *#R$B412 is not equal to #N$00.
  $A279,$03 Call #R$A7A5.
  $A27C,$03 Call #R$A3A4.
  $A27F,$06 Write #N$0201 to *#R$AF5D.
  $A285,$06 Jump to #R$A29B if *#R$9AB7 is zero.
  $A28B,$06 Jump to #R$A296 if *#R$9AB8 is zero.
  $A291,$03 #REGhl=*#R$9AB0.
  $A294,$02 Jump to #R$A29E.

  $A296,$03 #REGhl=*#R$9AB2.
  $A299,$02 Jump to #R$A29E.

  $A29B,$09 Write *#R$9B1F to; #LIST
. { *#R$AF49 }
. { *#R$9B33 }
. LIST#
  $A2A4,$03 Call #R$AE17.
  $A2A7,$06 Write #N$0501 to *#R$AF5D.
  $A2AD,$03 #REGhl=#R$9AB6.
  $A2B0,$03 #REGa=*#R$F821.
  $A2B3,$02 Test bit 1 of #REGa.
  $A2B5,$02 Jump to #R$A2B9 if ?? is equal to #REGa.
  $A2B7,$02 Write #N$01 to *#REGhl.
  $A2B9,$02 Test bit 0 of #REGa.
  $A2BB,$02 Jump to #R$A2BF if ?? is equal to #REGa.
  $A2BD,$02 Write #N$00 to *#REGhl.
  $A2BF,$02 Test bit 3 of #REGa.
  $A2C1,$02 Jump to #R$A2C5 if ?? is equal to #REGa.
  $A2C3,$02 Write #N$03 to *#REGhl.
  $A2C5,$02 Test bit 2 of #REGa.
  $A2C7,$02 Jump to #R$A2CB if ?? is equal to #REGa.
  $A2C9,$02 Write #N$02 to *#REGhl.
  $A2CB,$03 #REGa=*#R$9AB6.
  $A2CE,$04 Jump to #R$A2D8 if #REGa is equal to #N$01.
  $A2D2,$04 Jump to #R$A2D8 if #REGa is equal to #N$03.
  $A2D6,$02 Jump to #R$A2F7.

  $A2D8,$03 #REGa=*#R$9AC3.
  $A2DB,$04 Jump to #R$A2F7 if #REGa is equal to #N$08.
  $A2DF,$06 Write *#R$9B26 to *#R$A2E8(#N$A2E9).
  $A2E5,$03 #REGa=*#R$9B10.
  $A2E8,$02 #REGa-=#N$01.
  $A2EA,$04 Jump to #R$A2F4 if #REGa is less than #N$08.
  $A2EE,$03 #REGhl=#R$9AC3.
  $A2F1,$01 Decrease *#REGhl by one.
  $A2F2,$02 #REGa+=#N$08.
  $A2F4,$03 Write #REGa to *#R$9B10.
  $A2F7,$03 #REGa=*#R$9AB6.
  $A2FA,$04 Jump to #R$A304 if #REGa is equal to #N$00.
  $A2FE,$04 Jump to #R$A304 if #REGa is equal to #N$02.
  $A302,$02 Jump to #R$A323.

  $A304,$07 Jump to #R$A323 if *#R$9AC3 is equal to #N$1D.
  $A30B,$06 Write *#R$9B26 to *#R$A314(#N$A315).
  $A311,$03 #REGa=*#R$9B10.
  $A314,$02 #REGa+=#N$01.
  $A316,$04 Jump to #R$A320 if #REGa is less than #N$08.
  $A31A,$02 #REGa-=#N$08.
  $A31C,$03 #REGhl=#R$9AC3.
  $A31F,$01 Increment *#REGhl by one.
  $A320,$03 Write #REGa to *#R$9B10.
  $A323,$03 #REGa=*#R$9AB6.
  $A326,$04 Jump to #R$A330 if #REGa is equal to #N$00.
  $A32A,$04 Jump to #R$A330 if #REGa is equal to #N$03.
  $A32E,$02 Jump to #R$A34E.

  $A330,$06 Jump to #R$A34E if *#R$9AC4 is zero.
  $A336,$06 Write *#R$9B27 to *#R$A33F(#N$A340).
  $A33C,$03 #REGa=*#R$9B11.
  $A33F,$02 #REGa-=#N$01.
  $A341,$04 Jump to #R$A34B if #REGa is less than #N$08.
  $A345,$03 #REGhl=#R$9AC4.
  $A348,$01 Decrease *#REGhl by one.
  $A349,$02 #REGa+=#N$08.
  $A34B,$03 Write #REGa to *#R$9B11.
  $A34E,$03 #REGa=*#R$9AB6.
  $A351,$04 Jump to #R$A35B if #REGa is equal to #N$01.
  $A355,$04 Jump to #R$A35B if #REGa is equal to #N$02.
  $A359,$02 Jump to #R$A37A.

  $A35B,$07 Jump to #R$A37A if *#R$9AC4 is equal to #N$17.
  $A362,$06 Write *#R$9B27 to *#R$A36B(#N$A36C).
  $A368,$03 #REGa=*#R$9B11.
  $A36B,$02 #REGa+=#N$01.
  $A36D,$04 Jump to #R$A377 if #REGa is less than #N$08.
  $A371,$02 #REGa-=#N$08.
  $A373,$03 #REGhl=#R$9AC4.
  $A376,$01 Increment *#REGhl by one.
  $A377,$03 Write #REGa to *#R$9B11.
  $A37A,$03 Call #R$A461.
  $A37D,$03 Jump to #R$9D53.

c $A380 Messaging: Around The Clock Timer
@ $A380 label=Messaging_AroundTheClock_Timer
N $A380 Print the current timer value.
  $A380,$03 Call #R$964C.
B $A383,$02 INK: #INK(#PEEK(#PC+$01)).
B $A385,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A387,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A389,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $A38C label=AroundTheClock_Timer
T $A38C,$02 "#STR#(#PC,$04,$02)".
B $A38E,$01 Terminator.
N $A38F #HTML(#AUDIO(menu.wav)(#INCLUDE(Menu)))
N $A38F Note; this is identical to #R$9942.
  $A38F,$02 Set initial speaker state in #REGc to OFF.
  $A391,$02 Set the repeat loop counter in #REGb to #N$3C.
@ $A393 label=AroundTheClock_Timer_OuterLoop
  $A393,$03 Set the delay loop in #REGhl to #N($000A,$04,$04).
@ $A396 label=AroundTheClock_Timer_DelayLoop
  $A396,$01 Decrease the delay loop by one.
  $A397,$04 Jump back to #R$A396 until the delay loop is zero.
  $A39B,$01 Load the current speaker state into #REGa.
  $A39C,$02,b$01 Flip the speaker bit.
  $A39E,$01 Store the result back to #REGc.
M $A39B,$04 Flip the current speaker state.
  $A39F,$02 Send it to the speaker.
  $A3A1,$02 Decrease the repeat loop counter by one and loop back to #R$A393
. until the repeat loop counter is zero.
  $A3A3,$01 Return.

c $A3A4 Draw Current Opponent
@ $A3A4 label=DrawCurrentOpponent
N $A3A4 Handles drawing the opponent image on the game screen.
. #PUSHS #POKES$9AAB,$84;$9AAC,$B9
. #SIM(start=$A7A5,stop=$A7D0)#SIM(start=$A3AD,stop=$A3C2)
. #UDGTABLE(default)
.   { #SCR$02(draw-current-opponent) }
. UDGTABLE# #POPS
  $A3A4,$06 Jump to #R$A3C3 if *#R$9AB7 is not zero.
  $A3AA,$03 Call #R$AC9D.
N $A3AD Set up the opponent image area block positioning and attributes.
  $A3AD,$03 Set the X/ Y co-ordinates in #REGhl (#N$01/ #N$01).
  $A3B0,$03 Set the height and width in #REGbc (#N$03/ #N$06).
  $A3B3,$02 The colour: #COLOUR$46.
  $A3B5,$03 Call #R$B5A6.
N $A3B8 Display the opponents image.
  $A3B8,$04 Load *#R$9AAB into #REGbc.
  $A3BC,$03 Set the X/ Y co-ordinates in #REGde (#N$0F/ #N$01).
  $A3BF,$03 Call #R$B742.
  $A3C2,$01 Return.

c $A3C3 Messaging: Print Player Current Total
@ $A3C3 label=Messaging_PrintPlayerCurrentTotal
  $A3C3,$03 Call #R$964C.
B $A3C6,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A3C9,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(player)
B $A3CF,$01 Terminator.
N $A3D0 Who is currently playing?
  $A3D0,$06 Jump to #R$A3F3 if *#R$9AB8 is player two.
N $A3D6 Handle 1UP:
  $A3D6,$03 Call #R$964C.
B $A3D9,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A3DC,$03 #FONT#(:(#STR(#PC,$04,$03)))$8D75,attr=$47(one)
B $A3DF,$01 Terminator.
  $A3E0,$03 #REGhl=*#R$9AB2.
  $A3E3,$03 #REGde=#R$ACF6.
  $A3E6,$03 Call #R$AEF0.
  $A3E9,$03 #REGhl=#R$ACF6.
  $A3EC,$03 Call #R$A410.
  $A3EF,$03 Call #R$AC9D.
  $A3F2,$01 Return.
N $A3F3 Handle 2UP:
@ $A3F3 label=PrintPlayerTwo_CurrentTotal
  $A3F3,$03 Call #R$964C.
B $A3F6,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A3F9,$03 #FONT#(:(#STR(#PC,$04,$03)))$8D75,attr=$47(two)
B $A3FC,$01 Terminator.
  $A3FD,$03 #REGhl=*#R$9AB0.
  $A400,$03 #REGde=#R$ACF6.
  $A403,$03 Call #R$AEF0.
  $A406,$03 #REGhl=#R$ACF6.
  $A409,$03 Call #R$A410.
  $A40C,$03 Call #R$AC9D.
  $A40F,$01 Return.
N $A410 Convert the total to a printable string, and display it.
@ $A410 label=PrintCurrentTotal
  $A410,$02 Set a counter in #REGb for the #N$03 digits of a total value.
@ $A412 label=PrintCurrentTotal_Loop
  $A412,$01 #REGa=*#REGhl.
  $A413,$04 Jump to #R$A41A if #REGa is an ASCII "space" (#N$20).
  $A417,$02 Add #N$30 (ASCII "#CHR$30") to #REGa to "convert" it to ASCII.
  $A419,$01 Write #REGa to *#REGhl.
@ $A41A label=PrintCurrentTotal_Next
  $A41A,$01 Increment #REGhl by one.
  $A41B,$02 Decrease counter by one and loop back to #R$A412 until counter is zero.
  $A41D,$01 Return.

c $A41E
  $A41E,$03 #REGa=*#R$9B2D.
  $A421,$02 Return if *#R$9B2D is zero.
  $A423,$03 Write #REGa to *#R$AF49.
  $A426,$04 Write #N$00 to *#R$AF4A.
  $A42A,$06 Write #N$0500 to *#R$AF5D.
  $A430,$03 Call #R$AE17.
  $A433,$01 Return.

c $A434
  $A434,$03 #REGbc=#N$FFFF.
  $A437,$01 Decrease #REGbc by one.
  $A438,$04 Jump to #R$A437 until #REGbc is zero.
  $A43C,$06 Write #R$A8AE to *#R$A4F1(#N$A4F2).
  $A442,$03 #REGhl=#R$9CE9.
  $A445,$01 #REGe=*#REGhl.
  $A446,$01 Increment #REGhl by one.
  $A447,$01 #REGd=*#REGhl.
  $A448,$01 Increment #REGhl by one.
  $A449,$02 Increment #REGd by two.
  $A44B,$03 Call #R$A4D4.
  $A44E,$06 Write #R$A8BD to *#R$A4F1(#N$A4F2).
  $A454,$03 #REGhl=#R$9CE9.
  $A457,$01 #REGe=*#REGhl.
  $A458,$01 Increment #REGhl by one.
  $A459,$01 #REGd=*#REGhl.
  $A45A,$01 Increment #REGhl by one.
  $A45B,$02 Increment #REGd by two.
  $A45D,$03 Call #R$A4D4.
  $A460,$01 Return.

c $A461 Handler: Floating Hand
@ $A461 label=Handler_FloatingHand
  $A461,$03 Call #R$A50E.
  $A464,$03 #REGhl=*#R$9B15.
  $A467,$03 Call #R$A58F.
  $A46A,$05 Write #N$37 to *#R$A61D.
  $A46F,$03 Call #R$A613.
  $A472,$03 Call #R$A5E1.
  $A475,$03 Call #R$A652.
  $A478,$03 #REGhl=*#R$9B13.
  $A47B,$03 Call #R$A58F.
  $A47E,$05 Write #N$A7 to *#R$A61D.
  $A483,$03 Call #R$A613.
  $A486,$03 Call #R$A5E1.
  $A489,$03 Call #R$A69C.
  $A48C,$01 Halt operation (suspend CPU until the next interrupt).
  $A48D,$03 Call #R$A6E6.
  $A490,$01 Return.

c $A491
  $A491,$03 Call #R$A532.
  $A494,$03 #REGhl=*#R$9B19.
  $A497,$03 Call #R$A5B2.
  $A49A,$03 Call #R$A682.
  $A49D,$03 #REGhl=*#R$9B17.
  $A4A0,$03 Call #R$A5B2.
  $A4A3,$03 Call #R$A6CC.
  $A4A6,$01 Halt operation (suspend CPU until the next interrupt).
  $A4A7,$03 Call #R$A73A.
  $A4AA,$01 Return.

c $A4AB
  $A4AB,$02 #REGb=#N$03.
  $A4AD,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $A4B0,$03 Call #R$A4BE.
  $A4B3,$02 Restore #REGde and #REGhl from the stack.
  $A4B5,$03 #REGbc=#N($0018,$04,$04).
  $A4B8,$01 #REGhl+=#REGbc.
  $A4B9,$01 Increment #REGd by one.
  $A4BA,$01 Restore #REGbc from the stack.
  $A4BB,$02 Decrease counter by one and loop back to #R$A4AD until counter is zero.
  $A4BD,$01 Return.
  $A4BE,$01 Stash #REGhl on the stack.
  $A4BF,$03 Call #R$A8BD.
  $A4C2,$01 Exchange the #REGde and #REGhl registers.
  $A4C3,$01 Restore #REGhl from the stack.
  $A4C4,$01 Exchange the #REGde and #REGhl registers.
  $A4C5,$02 #REGb=#N$08.
  $A4C7,$02 Stash #REGbc and #REGhl on the stack.
  $A4C9,$03 #REGbc=#N($0003,$04,$04).
  $A4CC,$02 LDIR.
  $A4CE,$01 Restore #REGhl from the stack.
  $A4CF,$01 Increment #REGh by one.
  $A4D0,$01 Restore #REGbc from the stack.
  $A4D1,$02 Decrease counter by one and loop back to #R$A4C7 until counter is zero.
  $A4D3,$01 Return.

c $A4D4
  $A4D4,$02 #REGb=#N$03.
  $A4D6,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $A4D9,$01 #REGa=#REGd.
  $A4DA,$04 Jump to #R$A4E5 if #REGa is less than #N$00.
  $A4DE,$04 Jump to #R$A4E5 if #REGa is greater than or equal to #N$18.
  $A4E2,$03 Call #R$A4F0.
  $A4E5,$02 Restore #REGde and #REGhl from the stack.
  $A4E7,$04 #REGhl+=#N($0018,$04,$04).
  $A4EB,$01 Increment #REGd by one.
  $A4EC,$01 Restore #REGbc from the stack.
  $A4ED,$02 Decrease counter by one and loop back to #R$A4D6 until counter is zero.
  $A4EF,$01 Return.

  $A4F0,$01 Stash #REGhl on the stack.
  $A4F1,$03 Call #R$A8BD.
  $A4F4,$01 Exchange the #REGde and #REGhl registers.
  $A4F5,$01 Restore #REGhl from the stack.
  $A4F6,$02 #REGb=#N$08.
  $A4F8,$02 Stash #REGbc and #REGde on the stack.
  $A4FA,$03 #REGbc=#N($0003,$04,$04).
  $A4FD,$02 LDIR.
  $A4FF,$01 Restore #REGde from the stack.
  $A500,$01 Increment #REGd by one.
  $A501,$01 Restore #REGbc from the stack.
  $A502,$02 Decrease counter by one and loop back to #R$A4F8 until counter is zero.
  $A504,$01 Return.

c $A505
  $A505,$08 Write #N$02 to; #LIST { *#R$9B26 } { *#R$9B27 } LIST#
  $A50D,$01 Return.

c $A50E
  $A50E,$04 #REGde=*#R$9AC3.
  $A512,$01 Decrease #REGd by one.
  $A513,$03 #REGhl=#R$7800.
  $A516,$02 #REGb=#N$0A.
  $A518,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $A51B,$01 #REGa=#REGd.
  $A51C,$04 Jump to #R$A527 if #REGa is less than #N$00.
  $A520,$04 Jump to #R$A527 if #REGa is greater than or equal to #N$18.
  $A524,$03 Call #R$A556.
  $A527,$02 Restore #REGde and #REGhl from the stack.
  $A529,$04 #REGhl+=#N($0040,$04,$04).
  $A52D,$01 Increment #REGd by one.
  $A52E,$01 Restore #REGbc from the stack.
  $A52F,$02 Decrease counter by one and loop back to #R$A518 until counter is zero.
  $A531,$01 Return.

c $A532
  $A532,$04 #REGde=*#R$9AC5.
  $A536,$01 Decrease #REGe by one.
  $A537,$03 #REGhl=#R$7800.
  $A53A,$02 #REGb=#N$05.
  $A53C,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $A53F,$01 #REGa=#REGd.
  $A540,$04 Jump to #R$A54B if #REGa is less than #N$00.
  $A544,$04 Jump to #R$A54B if #REGa is greater than or equal to #N$18.
  $A548,$03 Call #R$A578.
  $A54B,$02 Restore #REGde and #REGhl from the stack.
  $A54D,$04 #REGhl+=#N($0018,$04,$04).
  $A551,$01 Increment #REGd by one.
  $A552,$01 Restore #REGbc from the stack.
  $A553,$02 Decrease counter by one and loop back to #R$A53C until counter is zero.
  $A555,$01 Return.

c $A556
  $A556,$01 Stash #REGhl on the stack.
  $A557,$03 Call #R$A8BD.
  $A55A,$01 Exchange the #REGde and #REGhl registers.
  $A55B,$01 Restore #REGhl from the stack.
  $A55C,$01 Decrease #REGe by one.
  $A55D,$01 Exchange the #REGde and #REGhl registers.
  $A55E,$02 #REGb=#N$08.
  $A560,$02 Stash #REGbc and #REGhl on the stack.
  $A562,$02 LDI.
  $A564,$02 LDI.
  $A566,$02 LDI.
  $A568,$02 LDI.
  $A56A,$02 LDI.
  $A56C,$02 LDI.
  $A56E,$02 LDI.
  $A570,$02 LDI.
  $A572,$01 Restore #REGhl from the stack.
  $A573,$01 Increment #REGh by one.
  $A574,$01 Restore #REGbc from the stack.
  $A575,$02 Decrease counter by one and loop back to #R$A560 until counter is zero.
  $A577,$01 Return.

c $A578
  $A578,$01 Stash #REGhl on the stack.
  $A579,$03 Call #R$A8BD.
  $A57C,$01 Exchange the #REGde and #REGhl registers.
  $A57D,$01 Restore #REGhl from the stack.
  $A57E,$01 Exchange the #REGde and #REGhl registers.
  $A57F,$02 #REGb=#N$08.
  $A581,$02 Stash #REGbc and #REGhl on the stack.
  $A583,$02 LDI.
  $A585,$02 LDI.
  $A587,$02 LDI.
  $A589,$01 Restore #REGhl from the stack.
  $A58A,$01 Increment #REGh by one.
  $A58B,$01 Restore #REGbc from the stack.
  $A58C,$02 Decrease counter by one and loop back to #R$A581 until counter is zero.
  $A58E,$01 Return.

c $A58F
  $A58F,$03 #REGde=#R$7B00.
  $A592,$02 #REGa=#N$38.
  $A594,$02 LDI.
  $A596,$02 LDI.
  $A598,$02 LDI.
  $A59A,$02 LDI.
  $A59C,$02 LDI.
  $A59E,$02 LDI.
  $A5A0,$02 LDI.
  $A5A2,$01 Decrease #REGa by one.
  $A5A3,$02 Jump to #R$A594 if #REGa is not equal to #N$38.
  $A5A5,$01 Decrease #REGhl by one.
  $A5A6,$01 #REGa=*#REGhl.
  $A5A7,$01 Increment #REGhl by one.
  $A5A8,$01 #REGh=#REGd.
  $A5A9,$01 #REGl=#REGe.
  $A5AA,$03 #REGbc=#N($0037,$04,$04).
  $A5AD,$01 Write #REGa to *#REGhl.
  $A5AE,$01 Increment #REGde by one.
  $A5AF,$02 LDIR.
  $A5B1,$01 Return.

c $A5B2
  $A5B2,$02 Test bit 7 of *#REGhl.
  $A5B4,$02 #REGa=#N$FF.
  $A5B6,$01 Stash #REGhl on the stack.
  $A5B7,$02 Jump to #R$A5BA if #REGde is not equal to #N$FF.
  $A5B9,$01 #REGa=#N$00.
  $A5BA,$03 #REGhl=#R$7B00.
  $A5BD,$03 #REGde=#R$7B00(#N$7B00+#N$01).
  $A5C0,$01 Write #REGa to *#REGhl.
  $A5C1,$03 #REGbc=#N($0078,$04,$04).
  $A5C4,$02 LDIR.
  $A5C6,$03 #REGde=#R$7B00.
  $A5C9,$03 #REGa=*#R$9B12.
  $A5CC,$01 #REGl=#REGa.
  $A5CD,$01 #REGa+=#REGa.
  $A5CE,$01 #REGa+=#REGl.
  $A5CF,$01 #REGl=#REGa.
  $A5D0,$02 #REGh=#N$00.
  $A5D2,$01 #REGhl+=#REGde.
  $A5D3,$01 Exchange the #REGde and #REGhl registers.
  $A5D4,$01 Restore #REGhl from the stack.
  $A5D5,$02 #REGa=#N$10.
  $A5D7,$02 LDI.
  $A5D9,$02 LDI.
  $A5DB,$02 LDI.
  $A5DD,$01 Decrease #REGa by one.
  $A5DE,$02 Jump to #R$A5D7 if #REGa is not equal to #N$10.
  $A5E0,$01 Return.

c $A5E1
  $A5E1,$03 #REGa=*#R$9B11.
  $A5E4,$02 Return if *#R$9B11 is zero.
  $A5E6,$03 #REGhl=#R$7B00.
  $A5E9,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $A5EA,$01 #REGa=*#REGhl.
  $A5EB,$03 #REGde=#R$7C87.
  $A5EE,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $A5EF,$01 #REGh=#REGd.
  $A5F0,$01 #REGl=#REGe.
  $A5F1,$01 #REGc=#REGa.
  $A5F2,$01 #REGa+=#REGa.
  $A5F3,$01 #REGa+=#REGa.
  $A5F4,$01 #REGa+=#REGa.
  $A5F5,$01 #REGa-=#REGc.
  $A5F6,$01 #REGc=#REGa.
  $A5F7,$02 #REGb=#N$00.
  $A5F9,$01 #REGhl+=#REGbc.
  $A5FA,$01 Exchange the #REGde and #REGhl registers.
  $A5FB,$03 #REGbc=#N($0188,$04,$04).
  $A5FE,$02 LDDR.
  $A600,$03 #REGa=*#R$9B11.
  $A603,$01 #REGb=#REGa.
  $A604,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $A605,$03 #REGhl=#R$7B00.
  $A608,$01 Stash #REGbc on the stack.
  $A609,$02 #REGb=#N$07.
  $A60B,$01 Write #REGa to *#REGhl.
  $A60C,$01 Increment #REGhl by one.
  $A60D,$02 Decrease counter by one and loop back to #R$A60B until counter is zero.
  $A60F,$01 Restore #REGbc from the stack.
  $A610,$02 Decrease counter by one and loop back to #R$A608 until counter is zero.
  $A612,$01 Return.

c $A613
  $A613,$03 #REGa=*#R$9B10.
  $A616,$02 Return if *#R$9B10 is zero.
  $A618,$03 #REGhl=#R$7B00.
  $A61B,$02 #REGb=#N$40.
  $A61D,$01 Set flags.
  $A61E,$02 Rotate *#REGhl right.
  $A620,$01 Increment #REGl by one.
  $A621,$02 Rotate *#REGhl right.
  $A623,$01 Increment #REGl by one.
  $A624,$02 Rotate *#REGhl right.
  $A626,$01 Increment #REGl by one.
  $A627,$02 Rotate *#REGhl right.
  $A629,$01 Increment #REGhl by one.
  $A62A,$02 Rotate *#REGhl right.
  $A62C,$01 Increment #REGl by one.
  $A62D,$02 Rotate *#REGhl right.
  $A62F,$01 Increment #REGl by one.
  $A630,$02 Rotate *#REGhl right.
  $A632,$01 Increment #REGl by one.
  $A633,$02 Decrease counter by one and loop back to #R$A61D until counter is zero.
  $A635,$01 Decrease #REGa by one.
  $A636,$02 Jump to #R$A618 if #REGa is not equal to #REGa.
  $A638,$01 Return.

c $A639
  $A639,$03 #REGa=*#R$9B10.
  $A63C,$02 #REGa+=#N$03.
  $A63E,$01 Stash #REGhl on the stack.
  $A63F,$02 #REGb=#N$10.
  $A641,$01 Set flags.
  $A642,$02 Rotate *#REGhl right.
  $A644,$01 Increment #REGhl by one.
  $A645,$02 Rotate *#REGhl right.
  $A647,$01 Increment #REGhl by one.
  $A648,$02 Rotate *#REGhl right.
  $A64A,$01 Increment #REGhl by one.
  $A64B,$02 Decrease counter by one and loop back to #R$A641 until counter is zero.
  $A64D,$01 Restore #REGhl from the stack.
  $A64E,$01 Decrease #REGa by one.
  $A64F,$02 Jump to #R$A63E if #REGa is not equal to #REGa.
  $A651,$01 Return.

c $A652
  $A652,$03 #REGde=#R$7B00.
  $A655,$03 #REGhl=#R$7840.
  $A658,$01 Increment #REGl by one.
  $A659,$02 #REGb=#N$40.
  $A65B,$01 #REGa=*#REGde.
  $A65C,$01 Merge the bits from *#REGhl.
  $A65D,$01 Write #REGa to *#REGhl.
  $A65E,$01 Increment #REGl by one.
  $A65F,$01 Increment #REGe by one.
  $A660,$01 #REGa=*#REGde.
  $A661,$01 Merge the bits from *#REGhl.
  $A662,$01 Write #REGa to *#REGhl.
  $A663,$01 Increment #REGl by one.
  $A664,$01 Increment #REGe by one.
  $A665,$01 #REGa=*#REGde.
  $A666,$01 Merge the bits from *#REGhl.
  $A667,$01 Write #REGa to *#REGhl.
  $A668,$01 Increment #REGl by one.
  $A669,$01 Increment #REGe by one.
  $A66A,$01 #REGa=*#REGde.
  $A66B,$01 Merge the bits from *#REGhl.
  $A66C,$01 Write #REGa to *#REGhl.
  $A66D,$01 Increment #REGl by one.
  $A66E,$01 Increment #REGde by one.
  $A66F,$01 #REGa=*#REGde.
  $A670,$01 Merge the bits from *#REGhl.
  $A671,$01 Write #REGa to *#REGhl.
  $A672,$01 Increment #REGl by one.
  $A673,$01 Increment #REGe by one.
  $A674,$01 #REGa=*#REGde.
  $A675,$01 Merge the bits from *#REGhl.
  $A676,$01 Write #REGa to *#REGhl.
  $A677,$01 Increment #REGl by one.
  $A678,$01 Increment #REGe by one.
  $A679,$01 #REGa=*#REGde.
  $A67A,$01 Merge the bits from *#REGhl.
  $A67B,$01 Write #REGa to *#REGhl.
  $A67C,$01 Increment #REGhl by one.
  $A67D,$01 Increment #REGl by one.
  $A67E,$01 Increment #REGe by one.
  $A67F,$02 Decrease counter by one and loop back to #R$A65B until counter is zero.
  $A681,$01 Return.

c $A682
  $A682,$03 #REGde=#R$7B00.
  $A685,$03 #REGhl=#R$7800.
  $A688,$02 #REGb=#N$28.
  $A68A,$01 #REGa=*#REGde.
  $A68B,$01 Merge the bits from *#REGhl.
  $A68C,$01 Write #REGa to *#REGhl.
  $A68D,$01 Increment #REGl by one.
  $A68E,$01 Increment #REGe by one.
  $A68F,$01 #REGa=*#REGde.
  $A690,$01 Merge the bits from *#REGhl.
  $A691,$01 Write #REGa to *#REGhl.
  $A692,$01 Increment #REGl by one.
  $A693,$01 Increment #REGe by one.
  $A694,$01 #REGa=*#REGde.
  $A695,$01 Merge the bits from *#REGhl.
  $A696,$01 Write #REGa to *#REGhl.
  $A697,$01 Increment #REGl by one.
  $A698,$01 Increment #REGe by one.
  $A699,$02 Decrease counter by one and loop back to #R$A68A until counter is zero.
  $A69B,$01 Return.

c $A69C
  $A69C,$03 #REGde=#R$7B00.
  $A69F,$03 #REGhl=#R$7840.
  $A6A2,$01 Increment #REGl by one.
  $A6A3,$02 #REGb=#N$40.
  $A6A5,$01 #REGa=*#REGde.
  $A6A6,$01 Set the bits from *#REGhl.
  $A6A7,$01 Write #REGa to *#REGhl.
  $A6A8,$01 Increment #REGl by one.
  $A6A9,$01 Increment #REGe by one.
  $A6AA,$01 #REGa=*#REGde.
  $A6AB,$01 Set the bits from *#REGhl.
  $A6AC,$01 Write #REGa to *#REGhl.
  $A6AD,$01 Increment #REGl by one.
  $A6AE,$01 Increment #REGe by one.
  $A6AF,$01 #REGa=*#REGde.
  $A6B0,$01 Set the bits from *#REGhl.
  $A6B1,$01 Write #REGa to *#REGhl.
  $A6B2,$01 Increment #REGl by one.
  $A6B3,$01 Increment #REGe by one.
  $A6B4,$01 #REGa=*#REGde.
  $A6B5,$01 Set the bits from *#REGhl.
  $A6B6,$01 Write #REGa to *#REGhl.
  $A6B7,$01 Increment #REGl by one.
  $A6B8,$01 Increment #REGde by one.
  $A6B9,$01 #REGa=*#REGde.
  $A6BA,$01 Set the bits from *#REGhl.
  $A6BB,$01 Write #REGa to *#REGhl.
  $A6BC,$01 Increment #REGl by one.
  $A6BD,$01 Increment #REGe by one.
  $A6BE,$01 #REGa=*#REGde.
  $A6BF,$01 Set the bits from *#REGhl.
  $A6C0,$01 Write #REGa to *#REGhl.
  $A6C1,$01 Increment #REGl by one.
  $A6C2,$01 Increment #REGe by one.
  $A6C3,$01 #REGa=*#REGde.
  $A6C4,$01 Set the bits from *#REGhl.
  $A6C5,$01 Write #REGa to *#REGhl.
  $A6C6,$01 Increment #REGhl by one.
  $A6C7,$01 Increment #REGl by one.
  $A6C8,$01 Increment #REGe by one.
  $A6C9,$02 Decrease counter by one and loop back to #R$A6A5 until counter is zero.
  $A6CB,$01 Return.

c $A6CC
  $A6CC,$03 #REGde=#R$7B00.
  $A6CF,$03 #REGhl=#R$7800.
  $A6D2,$02 #REGb=#N$28.
  $A6D4,$01 #REGa=*#REGde.
  $A6D5,$01 Set the bits from *#REGhl.
  $A6D6,$01 Write #REGa to *#REGhl.
  $A6D7,$01 Increment #REGl by one.
  $A6D8,$01 Increment #REGe by one.
  $A6D9,$01 #REGa=*#REGde.
  $A6DA,$01 Set the bits from *#REGhl.
  $A6DB,$01 Write #REGa to *#REGhl.
  $A6DC,$01 Increment #REGl by one.
  $A6DD,$01 Increment #REGe by one.
  $A6DE,$01 #REGa=*#REGde.
  $A6DF,$01 Set the bits from *#REGhl.
  $A6E0,$01 Write #REGa to *#REGhl.
  $A6E1,$01 Increment #REGl by one.
  $A6E2,$01 Increment #REGe by one.
  $A6E3,$02 Decrease counter by one and loop back to #R$A6D4 until counter is zero.
  $A6E5,$01 Return.

c $A6E6 Copy Floating Hand To Screen
@ $A6E6 label=CopyFloatingHandToScreen
  $A6E6,$04 #REGde=*#R$9AC3.
  $A6EA,$01 Adjust the Y position.
  $A6EB,$03 #REGhl=#R$7800.
  $A6EE,$02 Set a counter in #REGb of #N$0A for the height of the graphic.
@ $A6F0 label=CopyFloatingHandToScreen_Loop
  $A6F0,$03 Stash the height counter, buffer pointer and co-ordinates on the
. stack.
N $A6F3 Check if this line is within the screen boundaries.
  $A6F3,$09 Jump to #R$A709 if the Y position is less than #N$00 or  greater
. than/ equal to #N$18.
  $A6FC,$03 Compare #REGe with #N$19.
  $A6FF,$02 #REGa=#N$08.
  $A701,$02 Jump to #R$A706 if #REGe is less than #N$19.
  $A703,$02 #REGa=#N$21.
  $A705,$01 #REGa-=#REGe.
  $A706,$03 Call #R$A714.
  $A709,$02 Restore #REGde and #REGhl from the stack.
  $A70B,$04 #REGhl+=#N($0040,$04,$04).
  $A70F,$01 Increment #REGd by one.
  $A710,$01 Restore #REGbc from the stack.
  $A711,$02 Decrease counter by one and loop back to #R$A6F0 until counter is zero.
  $A713,$01 Return.

c $A714 Draw Floating Hand
@ $A714 label=DrawFloatingHand
  $A714,$01 Stash #REGhl on the stack.
  $A715,$01 Exchange the #REGaf register with the shadow #REGaf register.
N $A716 On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $A716,$03 Call #R$A8AE.
  $A719,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $A71A,$01 Exchange the #REGde and #REGhl registers.
  $A71B,$01 Restore #REGhl from the stack.
  $A71C,$01 Decrease #REGe by one.
  $A71D,$02 #REGb=#N$08.
  $A71F,$02 Stash #REGbc and #REGde on the stack.
  $A721,$01 #REGc=#REGa.
  $A722,$02 #REGb=#N$00.
  $A724,$02 LDIR.
  $A726,$04 Jump to #R$A734 if #REGa is equal to #N$08.
  $A72A,$01 Stash #REGaf on the stack.
  $A72B,$01 #REGc=#REGa.
  $A72C,$02 #REGa=#N$08.
  $A72E,$01 #REGa-=#REGc.
  $A72F,$02 #REGb=#N$00.
  $A731,$01 #REGc=#REGa.
  $A732,$01 Restore #REGaf from the stack.
  $A733,$01 #REGhl+=#REGbc.
  $A734,$01 Restore #REGde from the stack.
  $A735,$01 Increment #REGd by one.
  $A736,$01 Restore #REGbc from the stack.
  $A737,$02 Decrease counter by one and loop back to #R$A71F until counter is zero.
  $A739,$01 Return.

c $A73A
  $A73A,$04 #REGde=*#R$9AC5.
  $A73E,$03 #REGhl=#R$7800.
  $A741,$02 #REGb=#N$05.
  $A743,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $A746,$01 #REGa=#REGd.
  $A747,$04 Jump to #R$A752 if #REGa is less than #N$00.
  $A74B,$04 Jump to #R$A752 if #REGa is greater than or equal to #N$18.
  $A74F,$03 Call #R$A75D.
  $A752,$02 Restore #REGde and #REGhl from the stack.
  $A754,$04 #REGhl+=#N($0018,$04,$04).
  $A758,$01 Increment #REGd by one.
  $A759,$01 Restore #REGbc from the stack.
  $A75A,$02 Decrease counter by one and loop back to #R$A743 until counter is zero.
  $A75C,$01 Return.

  $A75D,$01 Stash #REGhl on the stack.
N $A75E On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $A75E,$03 Call #R$A8AE.
  $A761,$01 Exchange the #REGde and #REGhl registers.
  $A762,$01 Restore #REGhl from the stack.
  $A763,$01 Decrease #REGe by one.
  $A764,$02 #REGb=#N$08.
  $A766,$02 Stash #REGbc and #REGde on the stack.
  $A768,$02 LDI.
  $A76A,$02 LDI.
  $A76C,$02 LDI.
  $A76E,$01 Restore #REGde from the stack.
  $A76F,$01 Increment #REGd by one.
  $A770,$01 Restore #REGbc from the stack.
  $A771,$02 Decrease counter by one and loop back to #R$A766 until counter is zero.
  $A773,$01 Return.

c $A774
  $A774,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $A777,$01 #REGa=#REGd.
  $A778,$02 Compare #REGa with #N$00.
  $A77A,$02 Jump to #R$A783 if #REGa is less than #N$00.
  $A77C,$02 Compare #REGa with #N$18.
  $A77E,$02 Jump to #R$A783 if #REGa is greater than or equal to #N$18.
  $A780,$03 Call #R$A78E.
  $A783,$02 Restore #REGde and #REGhl from the stack.
  $A785,$03 #REGbc=#N($0018,$04,$04).
  $A788,$01 #REGhl+=#REGbc.
  $A789,$01 Increment #REGd by one.
  $A78A,$01 Restore #REGbc from the stack.
  $A78B,$02 Decrease counter by one and loop back to #R$A774 until counter is zero.
  $A78D,$01 Return.
  $A78E,$01 Stash #REGhl on the stack.
  $A78F,$03 Call #R$A8BD.
  $A792,$01 Exchange the #REGde and #REGhl registers.
  $A793,$01 Restore #REGhl from the stack.
  $A794,$01 Decrease #REGe by one.
  $A795,$02 #REGb=#N$08.
  $A797,$02 Stash #REGbc and #REGde on the stack.
  $A799,$02 LDI.
  $A79B,$02 LDI.
  $A79D,$02 LDI.
  $A79F,$01 Restore #REGde from the stack.
  $A7A0,$01 Increment #REGd by one.
  $A7A1,$01 Restore #REGbc from the stack.
  $A7A2,$02 Decrease counter by one and loop back to #R$A797 until counter is zero.
  $A7A4,$01 Return.

c $A7A5 Print Play Area
@ $A7A5 label=Print_PlayArea
  $A7A5,$0B Copy #N$1800 bytes of data from *#R$6000 to #R$4000.
  $A7B0,$02 #REGb=#N$18.
  $A7B2,$03 #REGhl=#N$5800 (screen buffer location).
@ $A7B5 label=Print_PlayArea_Loop
  $A7B5,$02 Stash #REGbc and #REGhl on the stack.
  $A7B7,$03 #REGbc=#N($0008,$04,$04).
  $A7BA,$01 #REGd=#REGh.
  $A7BB,$01 #REGe=#REGl.
  $A7BC,$01 Increment #REGde by one.
  $A7BD,$02 Write #COLOUR$47 to *#REGhl.
  $A7BF,$02 LDIR.
  $A7C1,$03 #REGbc=#N($0017,$04,$04).
  $A7C4,$02 Write #COLOUR$70 to *#REGhl.
  $A7C6,$02 LDIR.
  $A7C8,$03 #REGde=#N($0020,$04,$04).
  $A7CB,$01 Restore #REGhl from the stack.
  $A7CC,$01 #REGhl+=#REGde.
  $A7CD,$01 Restore #REGbc from the stack.
  $A7CE,$02 Decrease counter by one and loop back to #R$A7B5 until counter is zero.
  $A7D0,$05 Return if *#R$9AB7 is not zero.
N $A7D5 Set the 1UP leg count.
  $A7D5,$03 #REGa=*#R$9AA6.
  $A7D8,$05 Add #N$30 (ASCII "#CHR$30") to #REGa to "convert" it to ASCII and
. write #REGa to *#R$A7F1.
N $A7DD Set the 2UP leg count.
  $A7DD,$03 #REGa=*#R$9AA7.
  $A7E0,$05 Add #N$30 (ASCII "#CHR$30") to #REGa to "convert" it to ASCII and
. write it to *#R$A7F5.
  $A7E5,$03 Call #R$964C.
B $A7E8,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A7EA,$02 INK: #INK(#PEEK(#PC+$01)).
B $A7EC,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A7EE,$03,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $A7F1 label=Messaging_LegCount_1UP
T $A7F1,$01 "#STR#(#PC,$04,$01)".
B $A7F2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $A7F5 label=Messaging_LegCount_2UP
T $A7F5,$01 "#STR#(#PC,$04,$01)".
B $A7F6,$01 Terminator.
  $A7F7,$01 Return.

c $A7F8
  $A7F8,$03 #REGhl=#R$9CE9.
  $A7FB,$01 #REGe=*#REGhl.
  $A7FC,$01 Increment #REGhl by one.
  $A7FD,$01 #REGd=*#REGhl.
  $A7FE,$01 Increment #REGhl by one.
  $A7FF,$02 Increment #REGd by two.
  $A801,$03 Call #R$A4D4.
  $A804,$03 #REGhl=#R$9C9F.
  $A807,$01 #REGe=*#REGhl.
  $A808,$01 Increment #REGhl by one.
  $A809,$01 #REGd=*#REGhl.
  $A80A,$01 Increment #REGhl by one.
  $A80B,$02 Increment #REGd by two.
  $A80D,$03 Call #R$A4D4.
  $A810,$03 #REGhl=#R$9C55.
  $A813,$01 #REGe=*#REGhl.
  $A814,$01 Increment #REGhl by one.
  $A815,$01 #REGd=*#REGhl.
  $A816,$01 Increment #REGhl by one.
  $A817,$02 Increment #REGd by two.
  $A819,$03 Call #R$A4D4.
  $A81C,$03 #REGhl=#R$9C55.
  $A81F,$02 Write "#CHR$32" to *#REGhl.
  $A821,$01 Increment #REGhl by one.
  $A822,$02 Write "#CHR$32" to *#REGhl.
  $A824,$03 #REGhl=#R$9C9F.
  $A827,$02 Write "#CHR$32" to *#REGhl.
  $A829,$01 Increment #REGhl by one.
  $A82A,$02 Write "#CHR$32" to *#REGhl.
  $A82C,$03 #REGhl=#R$9CE9.
  $A82F,$02 Write "#CHR$32" to *#REGhl.
  $A831,$01 Increment #REGhl by one.
  $A832,$02 Write "#CHR$32" to *#REGhl.
  $A834,$01 Return.

c $A835 Initialise Floating Hand
@ $A835 label=Initialise_FloatingHand
  $A835,$06 Write #N$0A/ #N$0A to *#R$9AC3.
  $A83B,$04 Write #N$00 to *#R$9B10.
  $A83F,$05 Write #N$02 to *#R$9B25.
  $A844,$06 Write #R$7D00 to *#R$9B13.
  $A84A,$06 Write #R$8320 to *#R$9B15.
  $A850,$01 Return.

c $A851
  $A851,$04 Write #N$00 to *#R$9B12.
  $A855,$06 Write #R$D2A0 to *#R$9B17.
  $A85B,$06 Write #R$D330 to *#R$9B19.
  $A861,$01 Return.

c $A862 Calculate Attribute Buffer
@ $A862 label=CalculateAttributeBuffer
R $A862 H Source Y position
R $A862 L Source X position
R $A862 O:HL Attribute buffer location
N $A862 Example inputs/ outputs:
. #TABLE(default,centre,centre,centre) { =h X Position | =h Y Position | =h Output }
. #FOR$00,$20,$08!!x!
.   #FOR$00,$10,$08(y,
.     { #Nx | #Ny | #SIM(start=$A862,stop=$A86E,hl=x+y*$20)#N({sim[HL]}) }
.   )
. !!
. TABLE#
  $A862,$01 Store the X position in #REGa for now.
  $A863,$01 Move the Y position into #REGl.
  $A864,$02 Set the high byte of #REGhl to #N$03.
  $A866,$02 Multiply #REGhl by #N$04.
N $A868 Small correction.
  $A868,$01 Decrease #REGh by one.
  $A869,$03 Multiply #REGhl by #N$08.
  $A86C,$02 Add the original X position for the low byte of the attribute
. buffer memory location.
  $A86E,$01 Return.

b $A86F

g $A871
W $A871,$02

g $A873
W $A873,$02

c $A875
  $A875,$02 Stash #REGhl and #REGbc on the stack.
  $A877,$01 #REGc=#REGe.
  $A878,$02 #REGb=#N$08.
  $A87A,$04 #REGde=*#R$A871.
  $A87E,$03 #REGhl=*#R$A873.
  $A881,$01 #REGa=#REGe.
  $A882,$02,b$01 Keep only bits 3, 6.
  $A884,$02 #REGa+=#N$38.
  $A886,$02 RLA.
  $A888,$02 Rotate #REGh left.
  $A88A,$02 Rotate #REGl left.
  $A88C,$02 Rotate #REGd left.
  $A88E,$02 Rotate #REGe left.
  $A890,$02 Decrease counter by one and loop back to #R$A881 until counter is zero.
  $A892,$04 Write #REGde to *#R$A871.
  $A896,$03 Write #REGhl to *#R$A873.
  $A899,$01 #REGa=#REGe.
  $A89A,$01 #REGe=#REGc.
  $A89B,$02 #REGd=#N$00.
  $A89D,$03 #REGhl=#N($0000,$04,$04).
  $A8A0,$02 #REGb=#N$08.
  $A8A2,$01 #REGhl+=#REGhl.
  $A8A3,$02 Rotate #REGa left (with carry).
  $A8A5,$02 Jump to #R$A8A8 if the result is greater than or equal to #N$08.
  $A8A7,$01 #REGhl+=#REGde.
  $A8A8,$02 Decrease counter by one and loop back to #R$A8A2 until counter is zero.
  $A8AA,$01 #REGa=#REGh.
  $A8AB,$02 Restore #REGbc and #REGhl from the stack.
  $A8AD,$01 Return.

c $A8AE Calculate Screen Buffer
@ $A8AE label=CalculateScreenBuffer
R $A8AE D Source Y position
R $A8AE E Source X position
R $A8AE O:HL Screen buffer location
M $A8AE,$03 Mask out the bottom 3 bits of the Y position.
  $A8AE,$02,b$01 #REGa=#N$07.
  $A8B1,$03 Rotate the bits right three positions.
  $A8B4,$01 Combine with the X position.
  $A8B5,$01 #REGl=low byte of the screen buffer address.
M $A8B6,$03 Mask out bits 3-4 of the Y position.
  $A8B7,$02,b$01 Keep only bits 3-4.
  $A8B9,$02,b$01 Add the screen buffer memory base address (#N$4000).
  $A8BB,$01 #REGh=high byte of the screen buffer address.
  $A8BC,$01 Return.

c $A8BD Calculate Dart Board Address
@ $A8BD label=CalculateDartBoardAddress
R $A8BD D Source Y position
R $A8BD E Source X position
R $A8BD O:HL Dart Board buffer location
M $A8BD,$03 Mask out the bottom 3 bits of the Y position.
  $A8BD,$02,b$01 #REGa=#N$07.
  $A8C0,$03 Rotate the bits right three positions.
  $A8C3,$01 Combine with the X position.
  $A8C4,$01 #REGl=low byte of the dart board buffer address.
M $A8C5,$03 Mask out bits 3-4 of the Y position.
  $A8C6,$02,b$01 Keep only bits 3-4.
  $A8C8,$02,b$01 Add the dart board buffer memory base address (#N$6000).
  $A8CA,$01 #REGh=high byte of the dart board buffer address.
  $A8CB,$01 Return.

c $A8CC Next Screen Buffer Line
@ $A8CC label=NextScreenBufferLine
R $A8CC HL Current screen buffer location
R $A8CC O:HL Next line down in screen memory
N $A8CC Moves down one pixel line in screen buffer memory, handling all screen
. boundary calculations.
N $A8CC The ZX Spectrum screen buffer is divided into three sections, each
. containing #N$08 character rows of #N$08 pixels each.
  $A8CC,$01 Move down one pixel line.
  $A8CD,$01 #REGa=#REGh.
  $A8CE,$02,b$01 Keep only bits 0-2.
M $A8CD,$03 Check if we've reached a character boundary.
  $A8D0,$01 Return if this is not at a screen boundary.
  $A8D1,$04 Move down one character block line.
  $A8D5,$01 Return if we wrapped.
  $A8D6,$04 Move to the next third of the screen.
  $A8DA,$01 Return.

c $A8DB
  $A8DB,$01 #REGa=#REGh.
  $A8DC,$01 Decrease #REGh by one.
  $A8DD,$02,b$01 Keep only bits 0-2.
  $A8DF,$01 Return if #REGh is not equal to #N$00.
  $A8E0,$04 #REGl-=#N$20.
  $A8E4,$01 Return if #REGl is less than #N$00.
  $A8E5,$04 #REGh+=#N$08.
  $A8E9,$01 Return.

c $A8EA Sounds: Opponent Dart
@ $A8EA label=Sounds_OpponentDart
N $A8EA #AUDIO(opponent-dart.wav)(#INCLUDE(OpponentDart))
  $A8EA,$01 #REGa=#N$00.
  $A8EB,$02 #REGc=#N$96.
@ $A8ED label=Sounds_OpponentDart_OuterLoop
  $A8ED,$01 Copy the delay into #REGb as a counter.
@ $A8EE label=Sounds_OpponentDart_DelayLoop
  $A8EE,$02 Decrease the delay loop counter by one and loop back to #R$A8EE
. until the counter is zero.
  $A8F0,$02,b$01 Flip the current speaker state.
  $A8F2,$02 Send it to the speaker.
  $A8F4,$01 Increment #REGc by one.
  $A8F5,$02 Jump back to #R$A8ED until #REGc is zero.
  $A8F7,$01 Return.

c $A8F8 Start Menu
@ $A8F8 label=StartMenu
N $A8F8 #PUSHS #SIM(start=$9D33,stop=$A95F)
. #UDGTABLE(default)
.   { #SCR$02(start-menu-1) }
. UDGTABLE# #POPS
  $A8F8,$0A Write #N$00 to; #LIST
. { *#R$9B2A }
. { *#R$9B2C }
. { *#R$9B2B }
. LIST#
  $A902,$06 Write #N$0501 to *#R$AF5D.
  $A908,$05 Write #N$14 to *#R$9B2D.
  $A90D,$06 Write #N$01F5 to *#R$9B1F.
  $A913,$03 Call #R$A9C2.
  $A916,$03 Call #R$964C.
B $A919,$02 INK: #INK(#PEEK(#PC+$01)).
B $A91B,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A91D,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A91F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A922,$01 #FONT#(:(#STR(#PC,$04,$01)))$8D75,attr=$47(1)
B $A923,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A926,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(tune)
B $A92A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A92D,$02 #FONT#(:(#STR(#PC,$04,$02)))$8D75,attr=$47(up)
B $A92F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A932,$01 #FONT#(:(#STR(#PC,$04,$01)))$8D75,attr=$47(2)
B $A933,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A936,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(game)
B $A93A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A93D,$02 #FONT#(:(#STR(#PC,$04,$02)))$8D75,attr=$47(on)
B $A93F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A942,$01 #FONT#(:(#STR(#PC,$04,$01)))$8D75,attr=$47(3)
B $A943,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A946,$03 #FONT#(:(#STR(#PC,$04,$03)))$8D75,attr=$47(two)
B $A949,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A94C,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(player)
B $A952,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A955,$01 #FONT#(:(#STR(#PC,$04,$01)))$8D75,attr=$47(4)
B $A956,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A959,$05 #FONT#(:(#STR(#PC,$04,$05)))$8D75,attr=$47(oops)
B $A95E,$01 Terminator.
  $A95F,$03 Call #R$AE04.
@ $A962 label=StartMenu_InputLoop
  $A962,$03 Call #R$965F.
  $A965,$04 Jump to #R$A97A if the player has pressed "#CHR$31".
  $A969,$05 Jump to #R$AA3B if the player has pressed "#CHR$32".
  $A96E,$05 Jump to #R$AA9B if the player has pressed "#CHR$33".
  $A973,$05 Jump back to #R$933F if the player has pressed "#CHR$34".
  $A978,$02 Jump to #R$A962.

c $A97A SubGame: Around The Clock
@ $A97A label=AroundTheClock
N $A97A #PUSHS #SIM(start=$9D33,stop=$A95F)#SIM(start=$A97D,stop=$A9AA)
. #UDGTABLE(default)
.   { #SCR$02(around-the-clock) }
. UDGTABLE# #POPS
  $A97A,$03 Call #R$9942.
  $A97D,$03 Call #R$A9C2.
  $A980,$03 Call #R$964C.
B $A983,$02 INK: #INK(#PEEK(#PC+$01)).
B $A985,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A987,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A989,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A98C,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(around)
B $A992,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A995,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(the)
B $A999,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A99C,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(clock)
B $A9A2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9A5,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(time)
B $A9A9,$01 Terminator.
N $A9AA Set the countdown timer.
  $A9AA,$08 Write "#CHR$39#CHR$39" to *#R$A38C.
  $A9B2,$05 Write "#CHR$32" to *#R$9AB5.
  $A9B7,$08 Write #N$01 to; #LIST { *#R$9B2C } { *#R$9B2B } LIST#
  $A9BF,$03 Jump to #R$9D42.

c $A9C2
  $A9C2,$03 #REGde=#N$0101.
  $A9C5,$02 #REGb=#N$16.
  $A9C7,$02 Stash #REGde and #REGbc on the stack.
N $A9C9 On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $A9C9,$03 Call #R$A8AE.
  $A9CC,$02 #REGb=#N$08.
  $A9CE,$02 Stash #REGbc and #REGhl on the stack.
  $A9D0,$03 #REGbc=#N($0005,$04,$04).
  $A9D3,$01 Stash #REGhl on the stack.
  $A9D4,$01 Restore #REGde from the stack.
  $A9D5,$01 Increment #REGde by one.
  $A9D6,$02 Write #N$00 to *#REGhl.
  $A9D8,$02 LDIR.
  $A9DA,$01 Restore #REGhl from the stack.
  $A9DB,$01 Increment #REGh by one.
  $A9DC,$01 Restore #REGbc from the stack.
  $A9DD,$02 Decrease counter by one and loop back to #R$A9CE until counter is zero.
  $A9DF,$02 Restore #REGbc and #REGde from the stack.
  $A9E1,$01 Increment #REGd by one.
  $A9E2,$02 Decrease counter by one and loop back to #R$A9C7 until counter is zero.
  $A9E4,$01 Return.

c $A9E5 Messaging: Hard Luck
@ $A9E5 label=Messaging_HardLuck
  $A9E5,$03 Call #R$964C.
B $A9E8,$02 INK: #INK(#PEEK(#PC+$01)).
B $A9EA,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A9EC,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A9EE,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9F1,$03 #FONT#(:(#STR(#PC,$00,$03)))$8D75,attr=$47(up)
B $A9F4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9F7,$04  #FONT#(:(#STR(#PC,$00,$04)))$8D75,attr=$47(hard)
B $A9FB,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9FE,$05  #FONT#(:(#STR(#PC,$00,$05)))$8D75,attr=$47(luck)
B $AA03,$01 Terminator.
  $AA04,$03 Call #R$AE04.
  $AA07,$03 Jump to #R$A8F8.

c $AA0A
  $AA0A,$07 Write #N$00 to; #LIST
. { *#R$9B2B }
. { *#R$9B2B(#N$9B2C) }
. LIST#
  $AA11,$03 Call #R$964C.
B $AA14,$02 INK: #INK(#PEEK(#PC+$01)).
B $AA16,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AA18,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $AA1A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AA1D,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(good)
B $AA21,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AA24,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(arrows)
B $AA2A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AA2D,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(game)
B $AA31,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AA34,$03 #FONT#(:(#STR(#PC,$04,$03)))$8D75,attr=$47(on!)
B $AA37,$01 Terminator.
  $AA38,$03 Call #R$AE04.
N $AA3B The entrypoint for a one-player game.
@ $AA3B label=Game_OnePlayer
  $AA3B,$05 Write #N$00 to *#R$9AA7.
  $AA40,$05 Write #N$00 to *#R$9AA6.
  $AA45,$03 Call #R$B517.
  $AA48,$03 Call #R$A7A5.
  $AA4B,$03 Call #R$B5BA.
  $AA4E,$03 Call #R$AE04.
  $AA51,$03 Call #R$AE04.
  $AA54,$03 Call #R$AE04.
  $AA57,$03 Jump to #R$AADC.

c $AA5A Handler: Match
@ $AA5A label=Handler_Match
  $AA5A,$03 #REGhl=#R$9AA6.
  $AA5D,$01 Increment *#REGhl by one.
  $AA5E,$05 Jump to #R$AADC if *#REGhl is not equal to #N$02.
  $AA63,$06 Write #N$00 to *#R$9AA6 and *#R$9AA7.
  $AA69,$03 Call #R$A7A5.
  $AA6C,$03 Call #R$B640.
  $AA6F,$09 Call #R$AE04 three times.
  $AA78,$03 Jump to #R$AADC.

c $AA7B Handler: Semi Final
@ $AA7B label=Handler_SemiFinal
  $AA7B,$03 #REGhl=#R$9AA6.
  $AA7E,$01 Increment *#REGhl by one.
  $AA7F,$05 Jump to #R$AADC if *#REGhl is not equal to #N$02.
  $AA84,$06 Write #N$00 to *#R$9AA6 and *#R$9AA7.
  $AA8A,$03 Call #R$A7A5.
  $AA8D,$03 Call #R$B6C2.
  $AA90,$03 Call #R$AE04.
  $AA93,$03 Call #R$AE04.
  $AA96,$03 Call #R$AE04.
  $AA99,$02 Jump to #R$AADC.

c $AA9B Two Player Game
@ $AA9B label=Game_TwoPlayer
  $AA9B,$08 Write #N$01 to; #LIST
. { *#R$9AB7 }
. { *#R$9AB8 }
. LIST#
  $AAA3,$03 Call #R$AAA8.
  $AAA6,$02 Jump to #R$AADC.

c $AAA8 Print Current Player ID
@ $AAA8 label=Print_CurrentPlayerID
  $AAA8,$03 Call #R$964C.
B $AAAB,$02 INK: #INK(#PEEK(#PC+$01)).
B $AAAD,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AAAF,$01
B $AAB0,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AAB3,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(player)
B $AAB9,$01 Terminator.
N $AABA Flip the current player ID.
  $AABA,$08 Toggle *#R$9AB8 to switch from 1UP to 2UP/ 2UP to 1UP.
  $AAC2,$02 Jump to #R$AAD0 if the current player is 1UP.
N $AAC4 Print "2" (For Player 2).
  $AAC4,$03 Call #R$964C.
B $AAC7,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AACA,$01 #FONT#(:(#STR(#PC,$04,$01)))$8D75,attr=$47(2)
B $AACB,$01 Terminator.
  $AACC,$03 Call #R$AE04.
  $AACF,$01 Return.
N $AAD0 Print "1" (For Player 1).
@ $AAD0 label=Print_1
  $AAD0,$03 Call #R$964C.
B $AAD3,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AAD6,$01 #FONT#(:(#STR(#PC,$04,$01)))$8D75,attr=$47(1)
B $AAD7,$01 Terminator.
  $AAD8,$03 Call #R$AE04.
  $AADB,$01 Return.

c $AADC
  $AADC,$01 #REGa=#N$00.
  $AADD,$03 Call #R$CB1E.
  $AAE0,$03 Call #R$CC62.
  $AAE3,$03 Call #R$A7A5.
  $AAE6,$0F Write #N$01F5 to; #LIST
. { *#R$B40A }
. { *#R$9B1F }
. { *#R$9AB0 }
. { *#R$9AB2 }
. LIST#
N $AAF5 Update the copy of the "current total".
  $AAF5,$0B Write "#CHR$35#CHR$30#CHR$31" to *#R$ACF6.
  $AB00,$03 Call #R$A3A4.
  $AB03,$0D Write #N$00 to; #LIST
. { *#R$B416 }
. { *#R$9B0F }
. { *#R$9AAD }
. { *#R$9AA9 }
. LIST#
  $AB10,$06 Write #N$0201 to *#R$AF5D.
  $AB16,$06 Write *#R$9B1F to *#R$AF49.
  $AB1C,$03 Call #R$AE17.
  $AB1F,$06 Write #N$0501 to *#R$AF5D.
  $AB25,$06 Write #N$01F5 to *#R$B40A.
  $AB2B,$03 Jump to #R$9D42.

c $AB2E Animation: Opponent Throwing
@ $AB2E label=Animation_OpponentThrowing
  $AB2E,$0B Copy #N$1B00 bytes of data from *#R$DD00 to #R$4000.
  $AB39,$04 #REGbc=*#R$9AAE.
  $AB3D,$02 #REGd=#N$06.
  $AB3F,$02 #REGe=#N$16.
  $AB41,$03 Call #R$B761.
N $AB44 Self-modifying code.
  $AB44,$05 Write #N$ED to *#R$B8EA.
  $AB49,$05 Write #N$A0 to *#R$B8EB.
M $AB44,$0A #HTML(Writes an extra <code>LDI</code> to #R$B8EA.)
  $AB4E,$02 #REGe=#N$0A.
  $AB50,$03 Call #R$A875.
  $AB53,$03 Jump to #R$AB64 if #REGa is not equal to #N$0A.
  $AB56,$03 #REGhl=#N$48B0 (screen buffer location).
  $AB59,$03 #REGde=#R$C8BC.
  $AB5C,$03 Call #R$B8D9.
  $AB5F,$05 Write #N$01 to *#R$9AAA.
  $AB64,$0B Copy #N($0003,$04,$04) bytes of data from *#R$ACF6 to *#R$9B2F.
  $AB6F,$03 Call #R$ACD9.
  $AB72,$03 Call #R$AE04.
  $AB75,$03 Call #R$AC52.
  $AB78,$03 Call #R$964C.
B $AB7B,$02 INK: #INK(#PEEK(#PC+$01)).
B $AB7D,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AB7F,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $AB81,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AB84,$08 #FONT#(:(#STR(#PC,$00,$08)))$8D75,attr=$47(1st-dart)
B $AB8C,$01 Terminator.
  $AB8D,$03 Call #R$AC3D.
  $AB90,$03 Call #R$AFB5.
  $AB93,$03 Call #R$ACFB.
  $AB96,$03 Call #R$B7E1.
  $AB99,$03 Call #R$AD5C.
  $AB9C,$03 Call #R$AE04.
  $AB9F,$07 Jump to #R$B16B if *#R$B412 is not equal to zero.
  $ABA6,$07 Jump to #R$AD3B if *#R$B417 is not equal to zero.
  $ABAD,$03 Call #R$AC52.
  $ABB0,$03 Call #R$AFB5.

  $ABB3,$03 Call #R$964C.
B $ABB6,$02 INK: #INK(#PEEK(#PC+$01)).
B $ABB8,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $ABBA,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $ABBC,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ABBF,$08 #FONT#(:(#STR(#PC,$00,$08)))$8D75,attr=$47(2nd-dart)
B $ABC7,$01 Terminator.
  $ABC8,$03 Call #R$AC3D.
  $ABCB,$03 Call #R$ACFB.
  $ABCE,$03 Call #R$B7E1.
  $ABD1,$03 Call #R$AD5C.
  $ABD4,$03 Call #R$AE04.
  $ABD7,$07 Jump to #R$B16B if *#R$B412 is not equal to #N$00.
  $ABDE,$07 Jump to #R$AD3B if *#R$B417 is not equal to #N$00.
  $ABE5,$03 Call #R$AC52.
  $ABE8,$03 Call #R$AFB5.
  $ABEB,$03 Call #R$964C.
B $ABEE,$02 INK: #INK(#PEEK(#PC+$01)).
B $ABF0,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $ABF2,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $ABF4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ABF7,$08 #FONT#(:(#STR(#PC,$00,$08)))$8D75,attr=$47(3rd-dart)
B $ABFF,$01 Terminator.
  $AC00,$03 Call #R$AC3D.
  $AC03,$03 Call #R$ACFB.
  $AC06,$03 Call #R$B7E1.
  $AC09,$03 Call #R$AD5C.
  $AC0C,$03 Call #R$AE04.
  $AC0F,$07 Jump to #R$B16B if *#R$B412 is not equal to #N$00.
  $AC16,$07 Jump to #R$AD3B if *#R$B417 is not equal to #N$00.
  $AC1D,$07 Call #R$B871 if *#R$9AAA is not equal to #N$00.
  $AC24,$0B Copy #N($0003,$04,$04) bytes of data from *#R$ACF6 to *#R$ACD4.
  $AC2F,$03 Call #R$AC52.
  $AC32,$03 Call #R$ACB9.
  $AC35,$03 Call #R$AE04.
  $AC38,$04 Write #N$00 to *#R$9AAA.
  $AC3C,$01 Return.

c $AC3D Messaging: Aiming At
@ $AC3D label=Messaging_AimingAt
  $AC3D,$03 Call #R$964C.
B $AC40,$02 INK: #INK(#PEEK(#PC+$01)).
B $AC42,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AC44,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AC47,$09 #FONT#(:(#STR(#PC,$00,$09)))$8D75,attr=$47(aiming-at)
B $AC50,$01 Terminator.
  $AC51,$01 Return.

c $AC52 Clear Messaging Area
@ $AC52 label=ClearMessagingArea
  $AC52,$03 Call #R$964C.
B $AC55,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AC58,$20 "#STR#(#PC,$04,$20)".
B $AC78,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AC7B,$20 "#STR#(#PC,$04,$20)".
B $AC9B,$01 Terminator.
  $AC9C,$01 Return.

c $AC9D Flash Current Total
@ $AC9D label=FlashCurrentTotal
  $AC9D,$0B Copy #N($0003,$04,$04) bytes of data from *#R$ACF6 to *#R$ACB4.
  $ACA8,$03 Call #R$964C.
B $ACAB,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $ACAE,$02 INK: #INK(#PEEK(#PC+$01)).
B $ACB0,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $ACB2,$02 PAPER: #INK(#PEEK(#PC+$01)).
@ $ACB4 label=Messaging_FlashCurrentTotal
T $ACB4,$03 "#STR#(#PC,$04,$03)".
B $ACB7,$01 Terminator.
  $ACB8,$01 Return.

c $ACB9 Messaging: Final Total
@ $ACB9 label=Messaging_FinalTotal
  $ACB9,$03 Call #R$964C.
B $ACBC,$02 INK: #INK(#PEEK(#PC+$01)).
B $ACBE,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $ACC0,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $ACC2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ACC5,$0C #FONT#(:(#STR(#PC,$00,$0C)))$8D75,attr=$47(final-total)
B $ACD1,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $ACD4 label=FinalTotal
T $ACD4,$03 "#STR#(#PC,$04,$03)".
B $ACD7,$01 Terminator.
  $ACD8,$01 Return.

c $ACD9 Messaging: Current Total
@ $ACD9 label=Messaging_CurrentTotal
  $ACD9,$03 Call #R$964C.
B $ACDC,$02 INK: #INK(#PEEK(#PC+$01)).
B $ACDE,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $ACE0,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $ACE2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ACE5,$0E #FONT#(:(#STR(#PC,$00,$0E)))$8D75,attr=$47(current-total)
B $ACF3,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $ACF6 label=Current_Total
T $ACF6,$03 "#STR#(#PC,$04,$03)".
B $ACF9,$01 Terminator.
  $ACFA,$01 Return.

c $ACFB
  $ACFB,$03 #REGhl=#R$AD0E.
  $ACFE,$01 #REGa=*#REGhl.
  $ACFF,$02 Write #N$20 to *#REGhl.
  $AD01,$02 #REGc=#N$14.
  $AD03,$02 #REGb=#N$16.
  $AD05,$03 Call #R$AD82.
  $AD08,$03 Call #R$964C.
B $AD0B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD0E,$03 "#STR#(#PC,$04,$03)".
B $AD11,$01 Terminator.
  $AD12,$01 Return.
  $AD13,$01 Return.
  $AD14,$03 #REGhl=#R$AD36.
  $AD17,$01 #REGa=*#REGhl.
  $AD18,$03 Write #REGa to *#R$C350.
  $AD1B,$02 Write #N$20 to *#REGhl.
  $AD1D,$02 #REGc=#N$14.
  $AD1F,$02 #REGb=#N$17.
  $AD21,$03 Call #R$AD82.
  $AD24,$03 Call #R$964C.
B $AD27,$02 INK: #INK(#PEEK(#PC+$01)).
B $AD29,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AD2B,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $AD2D,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD30,$03 #FONT#(:(#STR(#PC,$00,$03)))$8D75,attr=$47(got)
B $AD33,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD36,$03 "#STR#(#PC,$04,$03)".
B $AD39,$01 Terminator.
  $AD3A,$01 Return.

c $AD3B Messaging: Bust
@ $AD3B label=Messaging_Bust
  $AD3B,$03 Call #R$AC52.
  $AD3E,$03 Call #R$964C.
B $AD41,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD44,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(bust)
B $AD4A,$01 Terminator.
  $AD4B,$03 Call #R$AE04.
  $AD4E,$0B Copy #N($0003,$04,$04) bytes of data from *#R$9B2F to *#R$ACF6.
  $AD59,$03 Jump to #R$AC1D.

c $AD5C Report Opponent Score
@ $AD5C label=ReportOpponentScore
  $AD5C,$03 #REGhl=#R$AD75.
  $AD5F,$01 #REGa=*#REGhl.
  $AD60,$01 Stash #REGaf on the stack.
  $AD61,$02 Write #N$20 to *#REGhl.
  $AD63,$03 Call #R$964C.
B $AD66,$02 INK: #INK(#PEEK(#PC+$01)).
B $AD68,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AD6A,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $AD6C,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD6F,$03 #FONT#(:(#STR(#PC,$04,$03)))$8D75,attr=$47(got)
B $AD72,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD75,$03 "#STR#(#PC,$04,$03)".
B $AD78,$01 Terminator.
  $AD79,$01 Restore #REGaf from the stack.
  $AD7A,$02 #REGc=#N$14.
  $AD7C,$02 #REGb=#N$17.
  $AD7E,$03 Call #R$AD82.
  $AD81,$01 Return.
N $AD82 Now report the "type" of scoring.
@ $AD82 label=ReportOpponentScore_Type
  $AD82,$04 Jump to #R$AD97 if #REGa is equal to #N$53.
  $AD86,$04 Jump to #R$ADAD if #REGa is equal to #N$44.
  $AD8A,$04 Jump to #R$ADC3 if #REGa is equal to #N$54.
  $AD8E,$04 Jump to #R$ADD9 if #REGa is equal to #N$4D.
  $AD92,$04 Jump to #R$ADEE if #REGa is equal to #N$42.
  $AD96,$01 Return.
N $AD97 Report score is a "#STR#($ADA5,$04,$06)".
@ $AD97 label=Report_Single
  $AD97,$08 Write #REGbc to *#R$ADA2+#N$01/ #N$02 (co-ordinates).
  $AD9F,$03 Call #R$964C.
@ $ADA2 label=Report_Single_PrintAt
B $ADA2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADA5,$06 #FONT#(:(#STR(#PC,$00,$06)))$8D75,attr=$47(single)
B $ADAB,$01 Terminator.
  $ADAC,$01 Return.
N $ADAD Report score is a "#STR#($ADBB,$04,$06)".
@ $ADAD label=Report_Double
  $ADAD,$08 Write #REGbc to *#R$ADB8+#N$01/ #N$02 (co-ordinates).
  $ADB5,$03 Call #R$964C.
@ $ADB8 label=Report_Double_PrintAt
B $ADB8,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADBB,$06 #FONT#(:(#STR(#PC,$00,$06)))$8D75,attr=$47(double)
B $ADC1,$01 Terminator.
  $ADC2,$01 Return.
N $ADC3 Report score is a "#STR#($ADD1,$04,$06)".
@ $ADC3 label=Report_Treble
  $ADC3,$08 Write #REGbc to *#R$ADCE+#N$01/ #N$02 (co-ordinates).
  $ADCB,$03 Call #R$964C.
@ $ADCE label=Report_Treble_PrintAt
B $ADCE,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADD1,$06 #FONT#(:(#STR(#PC,$00,$06)))$8D75,attr=$47(treble)
B $ADD7,$01 Terminator.
  $ADD8,$01 Return.
N $ADD9 Report score is a "#STR#($ADDF,$02,$0D)".
@ $ADD9 label=Report_MissedBoard
  $ADD9,$03 Call #R$964C.
@ $ADDC label=Report_MissedBoard_PrintAt
B $ADDC,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADDF,$0D #FONT#(:(#STR(#PC,$00,$0D)))$8D75,attr=$47(missed-board)
B $ADEC,$01 Terminator.
  $ADED,$01 Return.
N $ADEE Report score is a "#STR#($ADFC,$01,$06)".
@ $ADEE label=Report_Bullseye
  $ADEE,$08 Write #REGbc to *#R$ADF9+#N$01/ #N$02 (co-ordinates).
  $ADF6,$03 Call #R$964C.
@ $ADF9 label=Report_Bullseye_PrintAt
B $ADF9,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADFC,$06 #FONT#(:(#STR(#PC,$00,$06)))$8D75,attr=$47(bull)
B $AE02,$01 Terminator.
  $AE03,$01 Return.

c $AE04 Long Pause
@ $AE04 label=LongPause
  $AE04,$02 Set a repeat counter in #REGb for #N$03 loops.
@ $AE06 label=LongPause_RepeatLoop
  $AE06,$03 Set a delay counter in #REGhl to #N$FFFF.
. We count down from this value to zero three times.
@ $AE09 label=LongPause_DelayLoop
  $AE09,$01 Decrease the delay counter by one.
  $AE0A,$04 Jump back to #R$AE09 until the delay counter is zero.
  $AE0E,$06 Return if bit 4 of *#R$F821 is set.
  $AE14,$02 Decrease the repeat counter by one and loop back to #R$AE06 until
. the repeat counter is zero.
  $AE16,$01 Return.

c $AE17
  $AE17,$03 #REGde=#R$AF51.
  $AE1A,$03 #REGhl=#R$AF49.
  $AE1D,$02 #REGb=#N$04.
  $AE1F,$01 Stash #REGbc on the stack.
  $AE20,$01 #REGb=#REGh.
  $AE21,$01 #REGc=#REGl.
  $AE22,$01 Stash #REGde on the stack.
  $AE23,$01 #REGe=*#REGhl.
  $AE24,$01 Increment #REGhl by one.
  $AE25,$01 #REGd=*#REGhl.
  $AE26,$01 Exchange the #REGde and #REGhl registers.
  $AE27,$01 Restore #REGde from the stack.
  $AE28,$03 Call #R$AEF0.
  $AE2B,$01 #REGh=#REGb.
  $AE2C,$01 #REGl=#REGc.
  $AE2D,$03 Increment #REGde by three.
  $AE30,$02 Increment #REGhl by two.
  $AE32,$01 Restore #REGbc from the stack.
  $AE33,$02 Decrease counter by one and loop back to #R$AE1F until counter is zero.
  $AE35,$03 #REGde=#R$AF51.
  $AE38,$03 Call #R$AE3C.
  $AE3B,$01 Return.

c $AE3C
  $AE3C,$03 #REGhl=*#R$AF5D.
  $AE3F,$02 Stash #REGhl and #REGbc on the stack.
  $AE41,$02 #REGb=#N$03.
  $AE43,$02 Stash #REGbc and #REGde on the stack.
  $AE45,$01 #REGa=*#REGde.
  $AE46,$04 Jump to #R$AE5B if #REGa is equal to #N$20.
  $AE4A,$01 Multiply #REGa by #N$02.
  $AE4B,$03 #REGhl=#R$AF5F.
  $AE4E,$03 Create an offset in #REGde.
  $AE51,$01 #REGhl+=#REGde.
  $AE52,$03 Fetch the address at *#REGhl and load it into #REGde.
  $AE55,$03 #REGix=#REGde (using the stack).
  $AE58,$03 Call #R$AE6E.
  $AE5B,$01 Restore #REGde from the stack.
  $AE5C,$01 Increment #REGde by one.
  $AE5D,$03 #REGhl=*#R$AF5D.
  $AE60,$02 Increment #REGl by two.
  $AE62,$03 Write #REGhl to *#R$AF5D.
  $AE65,$01 Restore #REGbc from the stack.
  $AE66,$02 Decrease counter by one and loop back to #R$AE43 until counter is zero.
  $AE68,$02 Restore #REGbc and #REGhl from the stack.
  $AE6A,$03 Write #REGhl to *#R$AF5D.
  $AE6D,$01 Return.

c $AE6E
  $AE6E,$03 Stash #REGhl, #REGbc and #REGde on the stack.
  $AE71,$03 #REGb=*#REGix+#N$00.
  $AE74,$02 Increment #REGix by one.
  $AE76,$01 Stash #REGbc on the stack.
  $AE77,$03 Call #R$AEA3.
  $AE7A,$03 #REGa=*#REGix+#N$00.
  $AE7D,$03 Call #R$AEAF.
  $AE80,$04 #REGde=*#R$AF5D.
N $AE84 On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $AE84,$03 Call #R$A8AE.
  $AE87,$03 #REGa=*#REGix+#N$01.
  $AE8A,$04 Increment #REGix by two.
  $AE8E,$03 Call #R$AEC3.
  $AE91,$03 Call #R$AECC.
  $AE94,$03 #REGbc=#N($03E8,$04,$04).
  $AE97,$01 Decrease #REGbc by one.
  $AE98,$04 Jump back to #R$AE97 until #REGbc is zero.
  $AE9C,$01 Restore #REGbc from the stack.
  $AE9D,$02 Decrease counter by one and loop back to #R$AE76 until counter is zero.
  $AE9F,$03 Restore #REGde, #REGbc and #REGhl from the stack.
  $AEA2,$01 Return.

c $AEA3
  $AEA3,$0B Copy #N($0008,$04,$04) bytes of data from *#R$8F55 to *#R$8F5D.
  $AEAE,$01 Return.

c $AEAF
  $AEAF,$02 Return if #REGa is zero.
  $AEB1,$03 #REGhl=#R$8F5D.
  $AEB4,$02 #REGb=#N$04.
  $AEB6,$01 Set flags.
  $AEB7,$02 Rotate *#REGhl right.
  $AEB9,$01 Increment #REGhl by one.
  $AEBA,$02 Rotate *#REGhl right.
  $AEBC,$01 Increment #REGhl by one.
  $AEBD,$02 Decrease counter by one and loop back to #R$AEB6 until counter is zero.
  $AEBF,$01 Decrease #REGa by one.
  $AEC0,$02 Jump to #R$AEB1 until #REGa is zero.
  $AEC2,$01 Return.

c $AEC3
  $AEC3,$02 Return if #REGa is zero.
  $AEC5,$01 #REGb=#REGa.
  $AEC6,$03 Call #R$A8CC.
  $AEC9,$02 Decrease counter by one and loop back to #R$AEC6 until counter is zero.
  $AECB,$01 Return.

c $AECC
  $AECC,$03 #REGde=#R$8F5D.
  $AECF,$03 Call #R$AEE5.
  $AED2,$03 Call #R$A8CC.
  $AED5,$03 Call #R$AEE5.
  $AED8,$03 Call #R$A8CC.
  $AEDB,$03 Call #R$AEE5.
  $AEDE,$03 Call #R$A8CC.
  $AEE1,$03 Call #R$AEE5.
  $AEE4,$01 Return.

c $AEE5
  $AEE5,$01 #REGa=*#REGde.
  $AEE6,$01 Set the bits from *#REGhl.
  $AEE7,$01 Write #REGa to *#REGhl.
  $AEE8,$01 Increment #REGl by one.
  $AEE9,$01 Increment #REGde by one.
  $AEEA,$01 #REGa=*#REGde.
  $AEEB,$01 Set the bits from *#REGhl.
  $AEEC,$01 Write #REGa to *#REGhl.
  $AEED,$01 Decrease #REGl by one.
  $AEEE,$01 Increment #REGde by one.
  $AEEF,$01 Return.

c $AEF0
  $AEF0,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $AEF3,$01 #REGa=#N$00.
  $AEF4,$01 Write #REGa to *#REGde.
  $AEF5,$03 #REGbc=#N($0064,$04,$04).
  $AEF8,$01 Stash #REGhl on the stack.
  $AEF9,$02 #REGhl-=#REGbc.
  $AEFB,$01 Restore #REGhl from the stack.
  $AEFC,$02 Jump to #R$AF06 if ?? is less than #N$00.
  $AEFE,$01 Set flags.
  $AEFF,$02 #REGhl-=#REGbc.
  $AF01,$01 #REGa=*#REGde.
  $AF02,$01 Increment #REGa by one.
  $AF03,$01 Write #REGa to *#REGde.
  $AF04,$02 Jump to #R$AEF8.

  $AF06,$01 Set the bits from #REGa.
  $AF07,$02 Jump to #R$AF0B if #REGa is not equal to #REGa.
  $AF09,$03 Write #N$20 to *#REGde.
  $AF0C,$01 Increment #REGde by one.
  $AF0D,$02 Write #N$00 to *#REGde.
  $AF0F,$03 #REGbc=#N($000A,$04,$04).
  $AF12,$01 Stash #REGhl on the stack.
  $AF13,$02 #REGhl-=#REGbc.
  $AF15,$01 Restore #REGhl from the stack.
  $AF16,$02 Jump to #R$AF20 if #REGde is less than #REGa.
  $AF18,$01 Set flags.
  $AF19,$02 #REGhl-=#REGbc.
  $AF1B,$01 #REGa=*#REGde.
  $AF1C,$01 Increment #REGa by one.
  $AF1D,$01 Write #REGa to *#REGde.
  $AF1E,$02 Jump to #R$AF12.
  $AF20,$01 Set the bits from #REGa.
  $AF21,$01 #REGb=#REGa.
  $AF22,$02 Jump to #R$AF2F if #REGa is not equal to #REGa.
  $AF24,$01 Decrease #REGde by one.
  $AF25,$01 #REGa=*#REGde.
  $AF26,$02 Compare #REGa with #N$20.
  $AF28,$01 Increment #REGde by one.
  $AF29,$02 Jump to #R$AF2F if #REGde is not equal to #N$20.
  $AF2B,$02 #REGa=#N$20.
  $AF2D,$02 Jump to #R$AF30.

  $AF2F,$01 #REGa=#REGb.
  $AF30,$01 Write #REGa to *#REGde.
  $AF31,$01 Increment #REGde by one.
  $AF32,$01 #REGa=#REGl.
  $AF33,$01 Write #REGa to *#REGde.
  $AF34,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $AF37,$01 Return.

  $AF38,$03 #REGhl=*#R$AF49.
  $AF3B,$04 #REGde=*#R$AF4B.
  $AF3F,$04 #REGbc=*#R$AF4D.
  $AF43,$01 #REGhl+=#REGbc.
  $AF44,$01 #REGhl+=#REGde.
  $AF45,$03 Write #REGhl to *#R$AF4F.
  $AF48,$01 Return.

g $AF49
B $AF49,$04,$01

g $AF4F
W $AF4F,$02

g $AF51
B $AF51,$04,$01

g $AF5D
W $AF5D,$02

g $AF5F
W $AF5F,$02
L $AF5F,$02,$0A

b $AF73 Graphics: Dart Pointer
@ $AF73 label=Graphics_DartPointer
D $AF73 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($AF73-$AFAF-$01-$30){$00,$00,$C0,$2C}(dart-pointer) }
. UDGTABLE#
  $AF73,$42,$06

c $AFB5
  $AFB5,$04 Write #N$00 to *#R$B417.
  $AFB9,$03 #REGhl=*#R$B40A.
  $AFBC,$03 #REGbc=#N($006E,$04,$04).
  $AFBF,$01 Set flags.
  $AFC0,$02 #REGhl-=#REGbc.
  $AFC2,$01 #REGhl+=#REGbc.
  $AFC3,$02 Jump to #R$AFD6 if ?? is less than #REGa.
  $AFC5,$02 #REGa=#N$14.
  $AFC7,$07 #REGix=*#R$B431 (using the stack).
  $AFCE,$02 #REGc=#N$FF.
  $AFD0,$03 Call #R$B29C.
  $AFD3,$03 Jump to #R$B0BA.

  $AFD6,$06 Jump to #R$B068 if #REGl is less than #N$32.
  $AFDC,$05 Write #N$FF to *#R$B416.
  $AFE1,$04 #REGb=*#R$B41A.
  $AFE5,$04 Jump to #R$B05C if #REGl is equal to #REGb.
  $AFE9,$02 #REGa-=#N$32.
  $AFEB,$04 Jump to #R$AFFE if #REGa is greater than or equal to #N$15.
  $AFEF,$07 #REGix=*#R$B433 (using the stack).
  $AFF6,$02 #REGc=#N$00.
  $AFF8,$03 Call #R$B29C.
  $AFFB,$03 Jump to #R$B0BA.

  $AFFE,$05 Jump to #R$B016 if #REGd is greater than or equal to #N$29.
  $B003,$02 Test bit 0 of #REGa.
  $B005,$02 Jump to #R$B016 if #REGa is not equal to #N$29.
  $B007,$02 Shift #REGa right.
  $B009,$07 #REGix=*#R$B437 (using the stack).
  $B010,$03 Call #R$B342.
  $B013,$03 Jump to #R$B0BA.

  $B016,$01 #REGd=#REGa.
  $B017,$02 #REGc=#N$00.
  $B019,$02 #REGa-=#N$03.
  $B01B,$01 Increment #REGc by one.
  $B01C,$02 #REGa-=#N$03.
  $B01E,$02 Jump to #R$B024 if #REGc is equal to #N$00.
  $B020,$02 Jump to #R$B035 if #REGc is less than #N$00.
  $B022,$02 Jump to #R$B01B.

  $B024,$01 Increment #REGc by one.
  $B025,$01 #REGa=#REGc.
  $B026,$07 #REGix=*#R$B431 (using the stack).
  $B02D,$02 #REGc=#N$FF.
  $B02F,$03 Call #R$B29C.
  $B032,$03 Jump to #R$B0BA.
  $B035,$01 #REGa=#REGd.
  $B036,$02 Test bit 0 of #REGa.
  $B038,$02 Jump to #R$B04B if #REGc is not equal to #N$FF.
  $B03A,$02 #REGa=#N$14.
  $B03C,$07 #REGix=*#R$B431 (using the stack).
  $B043,$02 #REGc=#N$FF.
  $B045,$03 Call #R$B29C.
  $B048,$03 Jump to #R$B0BA.

  $B04B,$02 #REGa=#N$13.
  $B04D,$07 #REGix=*#R$B431 (using the stack).
  $B054,$02 #REGc=#N$FF.
  $B056,$03 Call #R$B29C.
  $B059,$03 Jump to #R$B0BA.

  $B05C,$07 #REGix=*#R$B439 (using the stack).
  $B063,$03 Call #R$B3B6.
  $B066,$02 Jump to #R$B0BA.

  $B068,$05 Jump to #R$B073 if #REGl is less than #N$29.
  $B06D,$02 Test bit 0 of #REGa.
  $B06F,$02 Jump to #R$B09A if #REGa is equal to #N$29.
  $B071,$02 Jump to #R$B079.

  $B073,$02 Test bit 0 of #REGa.
  $B075,$02 Jump to #R$B0AA if #REGa is equal to #N$29.
  $B077,$02 Jump to #R$B08A.

  $B079,$02 #REGa=#N$13.
  $B07B,$07 #REGix=*#R$B433 (using the stack).
  $B082,$02 #REGc=#N$00.
  $B084,$03 Call #R$B29C.
  $B087,$03 Jump to #R$B0BA.

  $B08A,$02 #REGa=#N$01.
  $B08C,$07 #REGix=*#R$B433 (using the stack).
  $B093,$02 #REGc=#N$00.
  $B095,$03 Call #R$B29C.
  $B098,$02 Jump to #R$B0BA.

  $B09A,$02 #REGa=#N$14.
  $B09C,$07 #REGix=*#R$B433 (using the stack).
  $B0A3,$02 #REGc=#N$00.
  $B0A5,$03 Call #R$B29C.
  $B0A8,$02 Jump to #R$B0BA.

  $B0AA,$01 #REGa=#REGl.
  $B0AB,$02 Shift #REGa right.
  $B0AD,$07 #REGix=*#R$B437 (using the stack).
  $B0B4,$03 Call #R$B342.
  $B0B7,$03 Jump to #R$B0BA.

  $B0BA,$03 #REGa=*#R$B416.
  $B0BD,$02 Test bit 0 of #REGa.
  $B0BF,$02 Jump to #R$B0DC if #REGa is equal to #N$00.
  $B0C1,$05 Jump to #R$B0D1 if #REGl is greater than or equal to #N$7F.
  $B0C6,$04 Jump to #R$B0DC if #REGl is greater than or equal to #N$02.
  $B0CA,$03 #REGa=*#R$B412.
  $B0CD,$02 Test bit 0 of #REGa.
  $B0CF,$02 Jump to #R$B0E0 if #REGa is not equal to #N$02.
  $B0D1,$06 Write *#R$B40E to *#R$B40A.
  $B0D7,$05 Write #N$01 to *#R$B417.
  $B0DC,$04 Write #N$00 to *#R$B412.
  $B0E0,$01 Stash #REGhl on the stack.
  $B0E1,$03 #REGa=*#R$B415.
  $B0E4,$01 Increment #REGa by one.
  $B0E5,$04 Jump to #R$B0ED if #REGa is not equal to #N$03.
  $B0E9,$03 Write #REGhl to *#R$B40E.
  $B0EC,$04 Write #N$00 to *#R$B415.
  $B0F0,$01 Restore #REGhl from the stack.
  $B0F1,$03 #REGde=#R$ACF6.
  $B0F4,$03 Write #REGhl to *#R$B40A.
  $B0F7,$03 Call #R$AEF0.
  $B0FA,$03 #REGde=#R$AD0E.
  $B0FD,$03 #REGa=*#R$B410.
  $B100,$02 #REGh=#N$00.
  $B102,$01 #REGl=#REGa.
  $B103,$03 Call #R$AEF0.
  $B106,$03 #REGde=#R$AD36.
  $B109,$03 #REGa=*#R$B40C.
  $B10C,$01 #REGl=#REGa.
  $B10D,$02 #REGh=#N$00.
  $B10F,$03 Call #R$AEF0.
  $B112,$03 #REGde=#R$AD75.
  $B115,$03 #REGa=*#R$B411.
  $B118,$02 #REGh=#N$00.
  $B11A,$01 #REGl=#REGa.
  $B11B,$03 Call #R$AEF0.
  $B11E,$02 #REGb=#N$03.
  $B120,$03 #REGhl=#R$ACF6.
  $B123,$01 #REGa=*#REGhl.
  $B124,$04 Jump to #R$B12B if #REGa is equal to #N$20.
  $B128,$02 #REGa+=#N$30.
  $B12A,$01 Write #REGa to *#REGhl.
  $B12B,$01 Increment #REGhl by one.
  $B12C,$02 Decrease counter by one and loop back to #R$B123 until counter is zero.
  $B12E,$02 #REGb=#N$03.
  $B130,$03 #REGhl=#R$AD0E.
  $B133,$01 #REGa=*#REGhl.
  $B134,$04 Jump to #R$B13B if #REGa is equal to #N$20.
  $B138,$02 #REGa+=#N$30.
  $B13A,$01 Write #REGa to *#REGhl.
  $B13B,$01 Increment #REGhl by one.
  $B13C,$02 Decrease counter by one and loop back to #R$B133 until counter is zero.
  $B13E,$02 #REGb=#N$03.
  $B140,$03 #REGhl=#R$AD36.
  $B143,$01 #REGa=*#REGhl.
  $B144,$04 Jump to #R$B14B if #REGa is equal to #N$20.
  $B148,$02 #REGa+=#N$30.
  $B14A,$01 Write #REGa to *#REGhl.
  $B14B,$01 Increment #REGhl by one.
  $B14C,$02 Decrease counter by one and loop back to #R$B143 until counter is zero.
  $B14E,$02 #REGb=#N$03.
  $B150,$03 #REGhl=#R$AD75.
  $B153,$01 #REGa=*#REGhl.
  $B154,$04 Jump to #R$B15B if #REGa is equal to #N$20.
  $B158,$02 #REGa+=#N$30.
  $B15A,$01 Write #REGa to *#REGhl.
  $B15B,$01 Increment #REGhl by one.
  $B15C,$02 Decrease counter by one and loop back to #R$B153 until counter is zero.
  $B15E,$06 Write *#R$B418 to *#R$AD0E.
  $B164,$06 Write *#R$B419 to *#R$AD75.
  $B16A,$01 Return.

c $B16B Handler: Opponent Wins
@ $B16B label=Handler_OpponentWins
  $B16B,$01 Restore #REGhl from the stack.
  $B16C,$04 Write #N$00 to *#R$B412.
  $B170,$03 Call #R$AC52.
  $B173,$03 Call #R$964C.
B $B176,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $B179 label=Messaging_OpponentName_Wins
T $B179,$16 #FONT#(:(#STR(#PC,$00,$16)))$8D75,attr=$47(wins)
B $B18F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B192,$10 #FONT#(:(#STR(#PC,$00,$10)))$8D75,attr=$47(hard-luck)
B $B1A2,$01 Terminator.
  $B1A3,$03 Call #R$AE04.
  $B1A6,$03 #REGhl=#R$9AA7.
  $B1A9,$01 Increment *#REGhl by one.
  $B1AA,$06 Jump to #R$AADC if *#REGhl is not equal to #N$02.
  $B1B0,$02 Write #N$00 to *#REGhl.
N $B1B2 Handle displaying the players rating.
  $B1B2,$03 #REGa=*#R$9AB4.
  $B1B5,$04 Jump to #R$B1C1 if #REGa is equal to #N$01.
  $B1B9,$04 Jump to #R$B1D2 if #REGa is equal to #N$02.
  $B1BD,$04 Jump to #R$B1E3 if #REGa is equal to #N$04.
N $B1C1 Check if the players rating is "#STR$B278,$08($b==$5B)".
@ $B1C1 label=CheckRating_MegaPlayer
  $B1C1,$07 Jump to #R$B1CD if *#R$9AA9 is greater than or equal to #N$0D.
N $B1C8 Sets the rating: "#STR$B28A,$08($b==$5B)".
@ $B1C8 label=SetRating_AsRedHot
  $B1C8,$03 #REGhl=#R$B28A.
  $B1CB,$02 Jump to #R$B1F2.
N $B1CD Sets the rating: "#STR$B278,$08($b==$5B)".
@ $B1CD label=SetRating_AsAMegaPlayer
  $B1CD,$03 #REGhl=#R$B278.
  $B1D0,$02 Jump to #R$B1F2.
N $B1D2 Check if the players rating is "#STR$B254,$08($b==$5B)".
@ $B1D2 label=CheckRating_Amateur
  $B1D2,$07 Jump to #R$B1DE if *#R$9AA9 is greater than or equal to #N$0D.
N $B1D9 Sets the rating: "#STR$B266,$08($b==$5B)".
@ $B1D9 label=SetRating_AsANovice
  $B1D9,$03 #REGhl=#R$B266.
  $B1DC,$02 Jump to #R$B1F2.
N $B1DE Sets the rating: "#STR$B254,$08($b==$5B)".
@ $B1DE label=SetRating_AsAnAmateur
  $B1DE,$03 #REGhl=#R$B254.
  $B1E1,$02 Jump to #R$B1F2.
N $B1E3 Check if the players rating is "#STR$B230,$08($b==$5B)".
@ $B1E3 label=CheckRating_Wally
  $B1E3,$07 Jump to #R$B1EF if *#R$9AA9 is greater than or equal to #N$0D.
N $B1EA Sets the rating: "#STR$B242,$08($b==$5B)".
@ $B1EA label=SetRating_AsADipstick
  $B1EA,$03 #REGhl=#R$B242.
  $B1ED,$02 Jump to #R$B1F2.
N $B1EF Sets the rating: "#STR$B230,$08($b==$5B)".
@ $B1EF label=SetRating_AsAWally
  $B1EF,$0B Copy #N($0012,$04,$04) bytes of data from *#R$B230 to *#R$B217.
@ $B1F2 label=CopyToRatingString
N $B1FA Print the rating messaging:
  $B1FA,$03 Call #R$964C.
B $B1FD,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B200,$02 INK: #INK(#PEEK(#PC+$01)).
B $B202,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B204,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B206,$01
T $B207,$0D #FONT#(:(#STR(#PC,$04,$0D)))$8D75,attr=$47(you-are-rated)
B $B214,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
N $B217 See #R$B230 for the ratings.
@ $B217 label=Messaging_Rating
T $B217,$12 "#STR#(#PC,$04,$12)".
B $B229,$01 Terminator.
  $B22A,$03 Call #R$AE04.
  $B22D,$03 Jump to #R$933F.

t $B230 Messaging: Ratings
@ $B230 label=Messaging_AsAWally
  $B230,$12 #FONT#(:(#STR(#PC,$02,$12)))$8D75,attr=$47(as-a-wally)
@ $B242 label=Messaging_AsADipstick
  $B242,$12 #FONT#(:(#STR(#PC,$02,$12)))$8D75,attr=$47(as-a-dipstick)
@ $B254 label=Messaging_AsAnAmateur
  $B254,$12 #FONT#(:(#STR(#PC,$02,$12)))$8D75,attr=$47(as-an-amateur)
@ $B266 label=Messaging_AsANovice
  $B266,$12 #FONT#(:(#STR(#PC,$02,$12)))$8D75,attr=$47(as-a-novice)
@ $B278 label=Messaging_AsAMegaPlayer
  $B278,$12 #FONT#(:(#STR(#PC,$02,$12)))$8D75,attr=$47(as-a-mega-player)
@ $B28A label=Messaging_AsRedHot
  $B28A,$12 #FONT#(:(#STR(#PC,$02,$12)))$8D75,attr=$47(as-red-hot)

c $B29C
  $B29C,$01 Stash #REGhl on the stack.
  $B29D,$01 #REGd=#REGa.
  $B29E,$02 Shift #REGc right.
  $B2A0,$02 Jump to #R$B2AC if the result is greater than or equal to #N$00.
  $B2A2,$03 Write #REGa to *#R$B410.
  $B2A5,$05 Write #N$54 to *#R$B418.
  $B2AA,$02 Jump to #R$B2B4.

  $B2AC,$03 Write #REGa to *#R$B410.
  $B2AF,$05 Write #N$53 to *#R$B418.
  $B2B4,$01 #REGa=#REGd.
  $B2B5,$03 Call #R$B402.
  $B2B8,$03 #REGde=#N($00C8,$04,$04).
  $B2BB,$03 Call #R$A875.
  $B2BE,$05 Jump to #R$B2CE if *#REGix+#N$00 is greater than or equal to #N$53.
  $B2C3,$05 Write #N$53 to *#R$B419.
  $B2C8,$04 Write *#REGhl to *#R$B411.
  $B2CC,$02 Jump to #R$B337.

  $B2CE,$05 Jump to #R$B2E1 if *#REGix+#N$01 is greater than or equal to #N$53.
  $B2D3,$05 Write #N$54 to *#R$B419.
  $B2D8,$04 Write *#REGhl to *#R$B411.
  $B2DC,$01 #REGc=#REGa.
  $B2DD,$01 #REGa+=#REGa.
  $B2DE,$01 #REGa+=#REGc.
  $B2DF,$02 Jump to #R$B337.

  $B2E1,$05  Jump to #R$B2F2 if *#REGix+#N$02 is greater than or equal to #N$54.
  $B2E6,$05 Write #N$53 to *#R$B419.
  $B2EB,$01 Decrease #REGhl by one.
  $B2EC,$04 Write *#REGhl to *#R$B411.
  $B2F0,$02 Jump to #R$B337.

  $B2F2,$05 Jump to #R$B306 if *#REGix+#N$03 is greater than or equal to #N$53.
  $B2F7,$05 Write #N$54 to *#R$B419.
  $B2FC,$01 Decrease #REGhl by one.
  $B2FD,$04 Write *#REGhl to *#R$B411.
  $B301,$01 #REGc=#REGa.
  $B302,$01 #REGa+=#REGa.
  $B303,$01 #REGa+=#REGc.
  $B304,$02 Jump to #R$B337.

  $B306,$05 Jump to #R$B317 if *#REGix+#N$04 is greater than or equal to #N$54.
  $B30B,$05 Write #N$53 to *#R$B419.
  $B310,$01 Increment #REGhl by one.
  $B311,$04 Write *#REGhl to *#R$B411.
  $B315,$02 Jump to #R$B337.

  $B317,$05 Jump to #R$B32B if *#REGix+#N$05 is greater than or equal to #N$53.
  $B31C,$05 Write #N$54 to *#R$B419.
  $B321,$01 Increment #REGhl by one.
  $B322,$01 #REGa=*#REGhl.
  $B323,$03 Write #REGa to *#R$B411.
  $B326,$01 #REGc=#REGa.
  $B327,$01 #REGa+=#REGa.
  $B328,$01 #REGa+=#REGc.
  $B329,$02 Jump to #R$B337.

  $B32B,$02 #REGd=*#REGhl.
  $B32D,$05 Write #N$44 to *#R$B419.
  $B332,$04 Write #REGd to *#R$B411.
  $B336,$01 #REGa+=#REGa.
  $B337,$01 Restore #REGhl from the stack.
  $B338,$02 #REGd=#N$00.
  $B33A,$01 #REGe=#REGa.
  $B33B,$01 Set flags.
  $B33C,$02 #REGhl-=#REGde (with carry).
  $B33E,$03 Write #REGa to *#R$B40C.
  $B341,$01 Return.

c $B342
  $B342,$01 Stash #REGhl on the stack.
  $B343,$03 Write #REGa to *#R$B410.
  $B346,$01 #REGd=#REGa.
  $B347,$05 Write #COLOUR$44 to *#R$B418.
  $B34C,$01 #REGa=#REGd.
  $B34D,$03 Call #R$B402.
  $B350,$05 Jump to #R$B36C if *#REGix+#N$00 is greater than or equal to #N$44.
  $B355,$04 Write *#REGhl to *#R$B411.
  $B359,$03 Call #R$B38E.
  $B35C,$01 #REGd=#REGa.
  $B35D,$03 #REGa=*#R$B419.
  $B360,$04 Jump to #R$B369 if #REGa is not equal to #N$44.
  $B364,$05 Write #N$FF to *#R$B412.
  $B369,$01 #REGa=#REGd.
  $B36A,$02 Jump to #R$B383.

  $B36C,$05 Jump to #R$B37B if *#REGix+#N$01 is greater than or equal to #N$FF.
  $B371,$01 Decrease #REGhl by one.
  $B372,$04 Write *#REGhl to *#R$B411.
  $B376,$03 Call #R$B38E.
  $B379,$02 Jump to #R$B383.

  $B37B,$01 Increment #REGhl by one.
  $B37C,$01 #REGa=*#REGhl.
  $B37D,$03 Write #REGa to *#R$B411.
  $B380,$03 Call #R$B38E.
  $B383,$01 Restore #REGhl from the stack.
  $B384,$03 Write #REGa to *#R$B40C.
  $B387,$01 #REGe=#REGa.
  $B388,$02 #REGd=#N$00.
  $B38A,$01 Set flags.
  $B38B,$02 #REGhl-=#REGde (with carry).
  $B38D,$01 Return.

  $B38E,$01 #REGb=#REGa.
  $B38F,$02 #REGe=#N$C8.
  $B391,$03 Call #R$A875.
  $B394,$03 Compare #REGa with *#REGix+#N$02.
  $B397,$02 Jump to #R$B3A2 if #REGhl is greater than or equal to #REGa.
  $B399,$05 Write #COLOUR$44 to *#R$B419.
  $B39E,$01 #REGa=#REGb.
  $B39F,$01 #REGa+=#REGa.
  $B3A0,$02 Jump to #R$B3B5.

  $B3A2,$03 Compare #REGa with *#REGix+#N$03.
  $B3A5,$02 Jump to #R$B3AF if #REGhl is greater than or equal to #REGa.
  $B3A7,$05 Write #N$53 to *#R$B419.
  $B3AC,$01 #REGa=#REGb.
  $B3AD,$02 Jump to #R$B3B5.
  $B3AF,$05 Write #COLOUR$4D to *#R$B419.
  $B3B4,$01 #REGa=#N$00.
  $B3B5,$01 Return.

c $B3B6
  $B3B6,$01 Stash #REGhl on the stack.
  $B3B7,$01 #REGa=#REGl.
  $B3B8,$03 Write #REGa to *#R$B410.
  $B3BB,$05 Write #COLOUR$42 to *#R$B418.
  $B3C0,$01 #REGa=#REGl.
  $B3C1,$03 #REGde=#N($00C8,$04,$04).
  $B3C4,$03 Call #R$A875.
  $B3C7,$03 Compare #REGa with *#REGix+#N$00.
  $B3CA,$02 Jump to #R$B3DA if #REGhl is greater than or equal to #REGa.
  $B3CC,$05 Write #COLOUR$42 to *#R$B419.
  $B3D1,$05 Write #N$FF to *#R$B412.
  $B3D6,$02 #REGa=#N$32.
  $B3D8,$02 Jump to #R$B3F4.
  $B3DA,$03 Compare #REGa with *#REGix+#N$01.
  $B3DD,$02 Jump to #R$B3E8 if #REGhl is greater than or equal to #REGa.
  $B3DF,$05 Write #N$42 to *#R$B419.
  $B3E4,$02 #REGa=#N$19.
  $B3E6,$02 Jump to #R$B3F4.
  $B3E8,$03 #REGde=#N($0013,$04,$04).
  $B3EB,$05 Write #N$53 to *#R$B419.
  $B3F0,$03 Call #R$A875.
  $B3F3,$01 Increment #REGa by one.
  $B3F4,$03 Write #REGa to *#R$B40C.
  $B3F7,$03 Write #REGa to *#R$B411.
  $B3FA,$01 Restore #REGhl from the stack.
  $B3FB,$02 #REGd=#N$00.
  $B3FD,$01 #REGe=#REGa.
  $B3FE,$01 Set flags.
  $B3FF,$02 #REGhl-=#REGde (with carry).
  $B401,$01 Return.

c $B402
  $B402,$03 #REGhl=#R$B41C.
  $B405,$02 Return if #REGa is equal to *#REGhl.
  $B407,$01 Increment #REGhl by one.
  $B408,$02 Jump to #R$B405.

b $B40A
b $B40C
b $B40E
b $B410
b $B411
b $B412
b $B415
b $B416
b $B417
b $B418
b $B419
b $B41A
b $B41C

w $B431

w $B43B
w $B441
w $B447
w $B44D

w $B453

b $B46F Table: Opponent Data
@ $B46F label=Table_Opponent_JammyJim
@ $B484 label=Table_Opponent_BeerBellyBill
@ $B499 label=Table_Opponent_DelBoyDesmond
@ $B4AE label=Table_Opponent_MegaMick
@ $B4C3 label=Table_Opponent_DeviousDave
@ $B4D8 label=Table_Opponent_SureShotSidney
@ $B4ED label=Table_Opponent_LimpWristLarry
@ $B502 label=Table_Opponent_TacticalTel
N $B46F "#STR(#PC,$04,$10)".
T $B46F,$10
  $B47F,$01
W $B480,$02
W $B482,$02
L $B46F,$15,$08

c $B517 Initialise Opponent
@ $B517 label=InitialiseOpponent
R $B517 A Opponent number
  $B517,$02 #REGe=#N$06.
  $B519,$03 Call #R$A875.
  $B51C,$03 #REGhl=#R$B484.
  $B51F,$03 Set the length of the opponent data in #REGde (#N($0015,$04,$04)
. bytes).
  $B522,$01 #REGc=the opponent ID.
  $B523,$02 Set a counter in #REGb of the opponent ID.
  $B525,$02 Jump to #R$B52A if the opponent counter is zero.
@ $B527 label=FindOpponentData_Loop
  $B527,$01 Move #REGhl to the next opponent data block.
  $B528,$02 Decrease the opponent counter by one and loop back to #R$B527 until
. the counter is zero.
N $B52A #REGhl now points to the opponent data block.
@ $B52A label=FoundOpponentData
  $B52A,$03 Write the opponent data pointer to *#R$9B21.
  $B52D,$01 Stash #REGbc on the stack.
  $B52E,$02 #REGe=#N$06.
  $B530,$03 Call #R$A875.
  $B533,$01 Restore #REGbc from the stack.
  $B534,$03 Jump to #R$B52D if #REGa is equal to #REGc.
  $B537,$03 #REGhl=#R$B484.
  $B53A,$03 Set the length of the opponent data in #REGde (#N($0015,$04,$04)
. bytes).
  $B53D,$02 Set a counter in #REGb of the opponent ID.
  $B53F,$02 Jump to #R$B544 if the opponent counter is zero.
  $B541,$01 Move #REGhl to the next opponent data block.
  $B542,$02 Decrease the opponent counter by one and loop back to #R$B541 until
. the counter is zero.
  $B544,$03 Write #REGhl to *#R$9B23.
  $B547,$01 Return.

c $B548 Print Match Card
@ $B548 label=Print_MatchCard
N $B548 #PUSHS #SIM(start=$9D33,stop=$A95F)#SIM(start=$B548,stop=$B5A5)
. #UDGTABLE(default)
.   { #SCR$02{$80,$00,$180,$180}(match-card) }
. UDGTABLE# #POPS
N $B548 This first section clears the area of the dart board where the card
. will appear.
. #PUSHS #SIM(start=$9D33,stop=$A95F)#SIM(start=$B548,stop=$B563)
. #UDGTABLE(default)
.   { #SCR$01(match-card-clear) }
. UDGTABLE#
  $B548,$03 #REGde=#N$04/ #N$0A.
N $B548 On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $B54B,$03 Call #R$A8AE.
  $B54E,$02 #REGb=#N$80.
@ $B550 label=MatchCard_ClearLoop
  $B550,$02 Stash #REGbc and #REGhl on the stack.
  $B552,$03 #REGbc=#N($0012,$04,$04).
  $B555,$01 Stash #REGhl on the stack.
  $B556,$01 Restore #REGde from the stack.
  $B557,$02 Write #N$00 to *#REGhl.
  $B559,$01 Increment #REGde by one.
  $B55A,$02 LDIR.
  $B55C,$01 Restore #REGhl from the stack.
  $B55D,$03 Call #R$A8CC.
  $B560,$01 Restore #REGbc from the stack.
  $B561,$02 Decrease counter by one and loop back to #R$B550 until counter is zero.
N $B563 Colour the card background:
. #SIM(start=$B563,stop=$B56E)
. #UDGTABLE(default)
.   { #SCR$01(match-card-1) }
. UDGTABLE#
  $B563,$03 Set the co-ordinates in #REGhl to #N$04/ #N$0A.
  $B566,$03 Set the block dimensions in #REGbc to #N$10/ #N$13.
  $B569,$05 Call #R$B5A6 with #COLOUR$60.
N $B56E Colour the opponent portrait background:
. #SIM(start=$B56E,stop=$B579)
. #UDGTABLE(default)
.   { #SCR$01(match-card-2) }
. UDGTABLE#
  $B56E,$03 Set the co-ordinates in #REGhl to #N$0A/ #N$10.
  $B571,$03 Set the block dimensions in #REGbc to #N$07/ #N$06.
  $B574,$05 Call #R$B5A6 with #COLOUR$47.
N $B579 Colour the card right-hand shadow:
. #SIM(start=$B579,stop=$B584)
. #UDGTABLE(default)
.   { #SCR$01(match-card-3) }
. UDGTABLE#
  $B579,$03 Set the co-ordinates in #REGhl to #N$05/ #N$1D.
  $B57C,$03 Set the block dimensions in #REGbc to #N$10/ #N$01.
  $B57F,$05 Call #R$B5A6 with #COLOUR$30.
N $B584 Colour the card bottom shadow:
. #SIM(start=$B584,stop=$B58F)
. #UDGTABLE(default)
.   { #SCR$01(match-card-4) }
. UDGTABLE#
  $B584,$03 Set the co-ordinates in #REGhl to #N$14/ #N$0B.
  $B587,$03 Set the block dimensions in #REGbc to #N$01/ #N$13.
  $B58A,$05 Call #R$B5A6 with #COLOUR$30.
N $B58F Colour the opponent portrait bottom shadow:
. #SIM(start=$B58F,stop=$B59A)
. #UDGTABLE(default)
.   { #SCR$01(match-card-5) }
. UDGTABLE#
  $B58F,$03 Set the co-ordinates in #REGhl to #N$11/ #N$11.
  $B592,$03 Set the block dimensions in #REGbc to #N$01/ #N$06.
  $B595,$05 Call #R$B5A6 with #COLOUR$20.
N $B59A Colour the opponent portrait right-hand shadow:
. #SIM(start=$B59A,stop=$B5A5)
. #UDGTABLE(default)
.   { #SCR$01(match-card-6) }
. UDGTABLE# #POPS
  $B59A,$03 Set the co-ordinates in #REGhl to #N$0B/ #N$16.
  $B59D,$03 Set the block dimensions in #REGbc to #N$07/ #N$01.
  $B5A0,$05 Call #R$B5A6 with #COLOUR$20.
  $B5A5,$01 Return.

c $B5A6 Fill Attribute Block
R $B5A6 A Attribute byte to copy
R $B5A6 B Height (number of rows)
R $B5A6 C Width (number of columns)
R $B5A6 H Y position
R $B5A6 L X position
@ $B5A6 label=FillAttributeBlock
  $B5A6,$04 Stash the height, width, X/ Y position, attribute byte and (again)
. height and width on the stack.
N $B5AA Convert the X/ Y co-ordinates to an attribute buffer location.
  $B5AA,$03 Call #R$A862.
  $B5AD,$02 Restore the height, width and attribute byte from the stack.
  $B5AF,$01 Copy the width into #REGb as a counter.
@ $B5B0 label=FillAttributeBlock_RowLoop
  $B5B0,$01 Write the attribute byte to the attribute buffer.
  $B5B1,$01 Move the attribute buffer pointer right one position.
  $B5B2,$02 Decrease the width counter by one and loop back to #R$B5B0 until
. this row has been coloured in.
  $B5B4,$01 Restore the original co-ordinates from the stack.
  $B5B5,$01 Move down one row.
  $B5B6,$01 Restore the height and width from the stack.
  $B5B7,$02 Decrease the height counter by one and loop back to #R$B5A6 until
. all rows have been coloured in.
  $B5B9,$01 Return.

c $B5BA Quarter Finals
@ $B5BA label=QuarterFinals
  $B5BA,$0B Copy #REGbc #N($0010,$04,$04) bytes of data from *#R$9B21 to *#R$B179.
  $B5C5,$0B Copy #REGbc #N($0010,$04,$04) bytes of data from *#R$9B21 to *#R$B605.
  $B5D0,$03 Call #R$B548.
  $B5D3,$03 Call #R$964C.
B $B5D6,$02 INK: #INK(#PEEK(#PC+$01)).
B $B5D8,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B5DA,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B5DC,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B5DF,$0F #FONT#(:(#STR(#PC,$00,$0F)))$8D75,attr=$47(quarter-finals)
B $B5EE,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B5F1,$02 INK: #INK(#PEEK(#PC+$01)).
T $B5F3,$0D #FONT#(:(#STR(#PC,$00,$0D)))$8D75,attr=$47(your-opponent)
B $B600,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B603,$02 INK: #INK(#PEEK(#PC+$01)).
@ $B605 label=QuarterFinals_OpponentName
T $B605,$10 "#STR#(#PC,$04,$10)".
B $B615,$01 Terminator.
  $B616,$03 #REGhl=*#R$9B21.
  $B619,$04 Move the pointer by #N($0011,$04,$04) bytes...
  $B61D,$03 Load the opponents portrait graphic pointer into #REGbc.
  $B620,$04 Write #REGbc to *#R$9AAB.
  $B624,$04 Load the opponents pub scene graphic pointer into #REGbc.
  $B628,$04 Write #REGbc to *#R$9AAE.
N $B62C Draw the opponent portrait to the screen.
  $B62C,$04 #REGbc=*#R$9AAB.
  $B630,$03 Set the destination co-ordinates to: #N$0A/ #N$10.
  $B633,$03 Call #R$B742.
  $B636,$05 Write #N$04 to *#R$9AB4.
  $B63B,$01 #REGa=#N$00.
  $B63C,$03 Call #R$CAEB.
  $B63F,$01 Return.

c $B640 Semi Finals
@ $B640 label=SemiFinals
  $B640,$0B Copy #REGbc #N($0010,$04,$04) bytes of data from *#R$9B23 to *#R$B179.
  $B64B,$0B Copy #REGbc #N($0010,$04,$04) bytes of data from *#R$9B23 to *#R$B687.
  $B656,$03 Call #R$B548.
  $B659,$03 Call #R$964C.
B $B65C,$02 INK: #INK(#PEEK(#PC+$01)).
B $B65E,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B660,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B662,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B665,$0B "#STR#(#PC,$04,$0B)".
B $B670,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B673,$02 INK: #INK(#PEEK(#PC+$01)).
T $B675,$0D "#STR#(#PC,$04,$0D)".
B $B682,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B685,$02 INK: #INK(#PEEK(#PC+$01)).
@ $B687 label=SemiFinals_OpponentName
T $B687,$10 "#STR#(#PC,$04,$10)".
B $B697,$01 Terminator.
  $B698,$03 #REGhl=*#R$9B23.
  $B69B,$04 Move the pointer by #N($0011,$04,$04) bytes...
  $B69F,$03 Load the opponents portrait graphic pointer into #REGbc.
  $B6A2,$04 Write #REGbc to *#R$9AAB.
  $B6A6,$04 Load the opponents pub scene graphic pointer into #REGbc.
  $B6AA,$04 Write #REGbc to *#R$9AAE.
N $B6AE Draw the opponent portrait to the screen.
  $B6AE,$04 #REGbc=*#R$9AAB.
  $B6B2,$03 Set the destination co-ordinates to: #N$0A/ #N$10.
  $B6B5,$03 Call #R$B742.
  $B6B8,$05 Write #N$02 to *#R$9AB4.
  $B6BD,$01 Decrease #REGa by one.
  $B6BE,$03 Call #R$CAEB.
  $B6C1,$01 Return.

c $B6C2 The Final
@ $B6C2 label=TheFinal
  $B6C2,$0B Copy #N($0010,$04,$04) bytes of data from *#R$B46F to *#R$B179.
  $B6CD,$0B Copy #N($0010,$04,$04) bytes of data from *#R$B46F to *#R$B707.
  $B6D8,$03 Call #R$B548.
  $B6DB,$03 Call #R$964C.
B $B6DE,$02 INK: #INK(#PEEK(#PC+$01)).
B $B6E0,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B6E2,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B6E4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B6E7,$09 #FONT#(:(#STR(#PC,$04,$09)))$8D75,attr=$47(the-final)
B $B6F0,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B6F3,$02 INK: #INK(#PEEK(#PC+$01)).
T $B6F5,$0D #FONT#(:(#STR(#PC,$04,$0D)))$8D75,attr=$47(your-opponent)
B $B702,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B705,$02 INK: #INK(#PEEK(#PC+$01)).
@ $B707 label=TheFinal_OpponentName
T $B707,$10 "#STR#(#PC,$04,$10)".
B $B717,$01 Terminator.
N $B718 The finals are always with Jammy Jim.
  $B718,$03 #REGhl=#R$B46F.
  $B71B,$04 Move the pointer by #N($0011,$04,$04) bytes...
  $B71F,$03 Load the opponents portrait graphic pointer into #REGbc.
  $B722,$04 Write #REGbc to *#R$9AAB.
  $B726,$04 Load the opponents pub scene graphic pointer into #REGbc.
  $B72A,$04 Write #REGbc to *#R$9AAE.
N $B72E Draw the opponent portrait to the screen.
  $B72E,$04 #REGbc=*#R$9AAB.
  $B732,$03 Set the destination co-ordinates to: #N$0A/ #N$10.
  $B735,$03 Call #R$B742.
  $B738,$05 Write #N$01 to *#R$9AB4.
  $B73D,$01 Increment #REGa by one.
  $B73E,$03 Call #R$CAEB.
  $B741,$01 Return.

c $B742 Draw Opponent Portrait
@ $B742 label=Draw_OpponentPortrait
R $B742 BC Pointer to the opponent graphic
R $B742 D Destination Y position
R $B742 E Destination X position
N $B742 On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $B742,$03 Call #R$A8AE.
  $B745,$02 Copy the opponent pointer to display into #REGde.
  $B747,$02 Set a counter in #REGb for the height of the opponent image.
@ $B749 label=Draw_OpponentPortrait_Loop
  $B749,$02 Stash the height counter and destination pointer on the stack.
  $B74B,$01 Swap the source and destination registers.
  $B74C,$0C Copy #N$06 bytes of data from the source address to the destination.
  $B758,$01 Swap the source and destination registers back again.
  $B759,$01 Restore the original screen position from the stack.
  $B75A,$03 Call #R$A8CC.
  $B75D,$01 Restore the height counter from the stack.
  $B75E,$02 Decrease the height counter by one and loop back to #R$B749 until
. the whole image has been displayed.
  $B760,$01 Return.

c $B761 Draw Opponent Pub Scene
@ $B761 label=Draw_OpponentPubScene
R $B761 BC Pointer to graphic data
R $B761 D Destination Y position
R $B761 E Destination X position
N $B761 On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $B761,$03 Call #R$A8AE.
  $B764,$02 Copy the opponent pointer to display into #REGde.
  $B766,$02 Set a counter in #REGb for the height of the opponent image.
@ $B768 label=Draw_OpponentPubScene_Loop
  $B768,$02 Stash the height counter and destination pointer on the stack.
  $B76A,$01 Swap the source and destination registers.
  $B76B,$06 Copy #N$06 bytes of data from the source address to the destination.
  $B771,$01 Swap the source and destination registers back again.
  $B772,$01 Restore the original screen position from the stack.
  $B773,$03 Call #R$A8CC.
  $B776,$01 Restore the height counter from the stack.
  $B777,$02 Decrease the height counter by one and loop back to #R$B768 until
. the whole image has been displayed.
  $B779,$01 Return.

c $B77A
  $B77A,$04 #REGde=*#R$9AC3.
  $B77E,$02 #REGb=#N$08.
  $B780,$05 Jump to #R$B79C if #REGd is less than #N$00.
  $B785,$04 Jump to #R$B79C if #REGd is greater than or equal to #N$18.
  $B789,$03 Stash #REGbc, #REGde and #REGde on the stack.
  $B78C,$01 #REGa=#REGe.
  $B78D,$01 Exchange the #REGaf register with the shadow #REGaf register.
N $B78E On return from #R$A8AE #REGhl will contain the screen buffer destination.
  $B78E,$03 Call #R$A8AE.
  $B791,$01 Restore #REGde from the stack.
  $B792,$01 Stash #REGhl on the stack.
  $B793,$03 Call #R$A8BD.
  $B796,$01 Restore #REGde from the stack.
  $B797,$03 Call #R$B7A0.
  $B79A,$02 Restore #REGde and #REGbc from the stack.
  $B79C,$01 Increment #REGd by one.
  $B79D,$02 Decrease counter by one and loop back to #R$B780 until counter is zero.
  $B79F,$01 Return.

c $B7A0
  $B7A0,$02 #REGb=#N$08.
  $B7A2,$01 Exchange the shadow #REGaf register with the #REGaf register.
  $B7A3,$01 #REGc=#REGa.
  $B7A4,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $B7A5,$03 Stash #REGbc, #REGhl and #REGde on the stack.
  $B7A8,$01 #REGa=#REGc.
  $B7A9,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7AD,$02 LDI.
  $B7AF,$01 Increment #REGa by one.
  $B7B0,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7B4,$02 LDI.
  $B7B6,$01 Increment #REGa by one.
  $B7B7,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7BB,$02 LDI.
  $B7BD,$01 Increment #REGa by one.
  $B7BE,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7C2,$02 LDI.
  $B7C4,$01 Increment #REGa by one.
  $B7C5,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7C9,$02 LDI.
  $B7CB,$01 Increment #REGa by one.
  $B7CC,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7D0,$02 LDI.
  $B7D2,$01 Increment #REGa by one.
  $B7D3,$04 Jump to #R$B7D9 if #REGa is equal to #N$20.
  $B7D7,$02 LDI.
  $B7D9,$01 Restore #REGde from the stack.
  $B7DA,$01 Increment #REGd by one.
  $B7DB,$01 Restore #REGhl from the stack.
  $B7DC,$01 Increment #REGh by one.
  $B7DD,$01 Restore #REGbc from the stack.
  $B7DE,$02 Decrease counter by one and loop back to #R$B7A2 until counter is zero.
  $B7E0,$01 Return.

c $B7E1 Animation: Throwing Dart
@ $B7E1 label=Animation_ThrowingDart
  $B7E1,$02 #REGe=#N$04.
  $B7E3,$03 Call #R$A875.
  $B7E6,$04 Call #R$B83D if #REGa is zero.
N $B7EA First show the playing "lining up" the shot...
  $B7EA,$02 Set a counter in #REGb for the number of times to loop the animation.
@ $B7EC label=Aiming_Loop
  $B7EC,$01 Stash the animation loop counter on the stack.
N $B7ED Frame #N$01.
  $B7ED,$03 #REGde=#R$C644.
  $B7F0,$03 Call #R$B910.
N $B7F3 Frame #N$02.
  $B7F3,$03 #REGde=#R$C68C.
  $B7F6,$03 Call #R$B910.
N $B7F9 Frame #N$03.
  $B7F9,$03 #REGde=#R$C6D4.
  $B7FC,$03 Call #R$B910.
N $B7FF Frame #N$02.
  $B7FF,$03 #REGde=#R$C68C.
  $B802,$03 Call #R$B910.
  $B805,$01 Restore the animation loop counter from the stack.
  $B806,$02 Decrease the animation loop counter by one and loop back to #R$B7EC
. until the counter is zero.
N $B808 Show the last frame (frame #N$01 again).
  $B808,$03 #REGde=#R$C644.
  $B80B,$03 Call #R$B910.
N $B80E
  $B80E,$02 #REGb=#N$12.
  $B810,$03 #REGhl=#N$40F2 (screen buffer location).
  $B813,$02 Stash #REGbc and #REGhl on the stack.
  $B815,$03 Call #R$B92F.
  $B818,$02 Restore #REGhl and #REGbc from the stack.
  $B81A,$01 Decrease #REGl by one.
  $B81B,$02 Decrease counter by one and loop back to #R$B813 until counter is zero.
  $B81D,$01 Increment #REGl by one.
  $B81E,$02 #REGb=#N$03.
  $B820,$03 #REGde=#R$C71C.
  $B823,$01 #REGa=*#REGde.
  $B824,$01 Set the bits from *#REGhl.
  $B825,$01 Write #REGa to *#REGhl.
  $B826,$01 Increment #REGde by one.
  $B827,$01 Increment #REGl by one.
  $B828,$01 #REGa=*#REGde.
  $B829,$01 Set the bits from *#REGhl.
  $B82A,$01 Write #REGa to *#REGhl.
  $B82B,$01 Increment #REGde by one.
  $B82C,$01 Increment #REGh by one.
  $B82D,$01 #REGa=*#REGde.
  $B82E,$01 Set the bits from *#REGhl.
  $B82F,$01 Write #REGa to *#REGhl.
  $B830,$01 Increment #REGde by one.
  $B831,$01 Decrease #REGl by one.
  $B832,$01 #REGa=*#REGde.
  $B833,$01 Set the bits from *#REGhl.
  $B834,$01 Write #REGa to *#REGhl.
  $B835,$01 Increment #REGh by one.
  $B836,$01 Increment #REGde by one.
  $B837,$02 Decrease counter by one and loop back to #R$B823 until counter is zero.
  $B839,$03 Call #R$A8EA.
  $B83C,$01 Return.

c $B83D Animation: Bar Maid
@ $B83D label=Animation_BarMaid
N $B83D Plays through frames; #N$01#RAW(,) #N$02#RAW(,) #N$03#RAW(,)
. #N$03#RAW(,) #N$02#RAW(,) #N$01.
N $B83D #PUSHS #SIM(start=$AB2E,stop=$AB39)
. #FOR$B8F5,$B8F8||n|#POKESn,$00||#FOR$B974,$B976||n|#POKESn,$00||
. #FOR$00,$05||x|
.   #SIM(start=($B83D+(x*$06)),stop=($B843+(x*$06)))#SCR$02(*bar-maid-animation-x)
. ||
. #SIM(start=$B861,stop=$B866)
. #FOR$06,$10||x|#SIM(start=$B866,stop=$B86E)#SCR$02(*bar-maid-animation-x)||
. #UDGTABLE { #UDGARRAY#(#ANIMATE$10,$10(bar-maid-animation)) } UDGTABLE# #POPS
  $B83D,$06 Call #R$B8F5 with #REGde=#R$C724.
  $B843,$06 Call #R$B8F5 with #REGde=#R$C784.
  $B849,$06 Call #R$B8F5 with #REGde=#R$C7E4.
  $B84F,$06 Call #R$B8F5 with #REGde=#R$C7E4.
  $B855,$06 Call #R$B8F5 with #REGde=#R$C784.
  $B85B,$06 Call #R$B8F5 with #REGde=#R$C724.
  $B861,$02 Set a counter in #REGb for the number of times to move the pint
. graphic across the screen (#N$0A times).
  $B863,$03 Set the initial screen buffer location in #REGhl of where the pint
. will first appear.
@ $B866 label=Pint_Loop
  $B866,$02 Stash the movement counter and screen buffer pointer on the stack.
  $B868,$03 Call #R$B965.
  $B86B,$02 Restore the screen buffer pointer and movement counter from the stack.
  $B86D,$01 Move the pint graphic left by one character block.
  $B86E,$02 Decrease the movement counter by one and loop back to #R$B866 until
. the pint is at its destination position.
  $B870,$01 Return.

c $B871 Animation: Dog
@ $B871 label=Animation_Dog
N $B871 Self-modifying code:
  $B871,$05 Write #N$ED to *#R$B8EA.
  $B876,$05 Write #N$A0 to *#R$B8EB.
M $B871,$0A #HTML(Writes an extra <code>LDI</code> to #R$B8EA.)
  $B87B,$02 #REGb=#N$07.
  $B87D,$03 #REGhl=#N$48B0 (screen buffer location).
  $B880,$02 Stash #REGbc and #REGhl on the stack.
  $B882,$03 #REGde=#R$C8BC.
  $B885,$03 Call #R$B8D9.
  $B888,$01 Halt operation (suspend CPU until the next interrupt).
  $B889,$01 Halt operation (suspend CPU until the next interrupt).
  $B88A,$01 Restore #REGhl from the stack.
  $B88B,$01 Stash #REGhl on the stack.
  $B88C,$03 #REGde=#R$C844.
  $B88F,$03 Call #R$B8D9.
  $B892,$01 Halt operation (suspend CPU until the next interrupt).
  $B893,$01 Halt operation (suspend CPU until the next interrupt).
  $B894,$01 Restore #REGhl from the stack.
  $B895,$01 Decrease #REGl by one.
  $B896,$01 Restore #REGbc from the stack.
  $B897,$02 Decrease counter by one and loop back to #R$B880 until counter is zero.
  $B899,$04 Increment #REGl by four.
  $B89D,$03 #REGde=#R$CA64.
  $B8A0,$02 #REGb=#N$18.
  $B8A2,$01 #REGa=*#REGde.
  $B8A3,$01 Write #REGa to *#REGhl.
  $B8A4,$01 Increment #REGde by one.
  $B8A5,$03 Call #R$A8CC.
  $B8A8,$02 Decrease counter by one and loop back to #R$B8A2 until counter is zero.
N $B8AA Self-modifying code.
  $B8AA,$07 Write #N$00 to; #LIST
. { *#R$B8EA }
. { *#R$B8EB }
. LIST#
M $B8AA,$07 #HTML(Writes <code>NOP NOP</code> to remove the extra
. <code>LDI</code> command.)
  $B8B1,$06 Call #R$B8D6 with #REGde=#R$C934.
  $B8B7,$06 Call #R$B8D6 with #REGde=#R$C994.
  $B8BD,$06 Call #R$B8D6 with #REGde=#R$C9F4.
  $B8C3,$06 Call #R$B8D6 with #REGde=#R$C9F4.
  $B8C9,$06 Call #R$B8D6 with #REGde=#R$C994.
  $B8CF,$06 Call #R$B8D6 with #REGde=#R$C934.
  $B8D5,$01 Return.

c $B8D6 Print Dog Frame
@ $B8D6 label=Print_Dog_Frame
  $B8D6,$03 Set the target screen buffer location in #REGhl.
  $B8D9,$04 Halt operation (suspend CPU until the next interrupt) four times.
  $B8DD,$02 Set a counter in #REGb of #N$18 for the height of the graphic.
@ $B8DF label=Print_Dog_Frame_Loop
  $B8DF,$02 Stash the height counter and screen buffer location on the stack.
  $B8E1,$01 Exchange the #REGde and #REGhl registers.
  $B8E2,$08 Copy #N$04 bytes of data from the graphic to the screen buffer.
N $B8EA Self-modifying code. See; #R$AB2E and #R$B871.
  $B8EA,$01 No operation.
  $B8EB,$01 No operation.
  $B8EC,$01 Exchange the #REGde and #REGhl registers.
  $B8ED,$01 Restore the screen buffer location from the stack.
  $B8EE,$03 Call #R$A8CC.
  $B8F1,$01 Restore the height counter from the stack.
  $B8F2,$02 Decrease the height counter by one and loop back to #R$B8DF until
. the frame has been displayed in full.
  $B8F4,$01 Return.

c $B8F5 Print Bar Maid Frame
@ $B8F5 label=Print_BarMaid_Frame
  $B8F5,$04 Halt operation (suspend CPU until the next interrupt) four times.
  $B8F9,$02 Set a counter in #REGb of #N$20 for the height of the graphic.
  $B8FB,$03 Set the target screen buffer location in #REGhl.
@ $B8FE label=Print_BarMaid_Frame_Loop
  $B8FE,$02 Stash the height counter and screen buffer location on the stack.
  $B900,$01 Exchange the #REGde and #REGhl registers.
  $B901,$06 Copy #N$03 bytes of data from the graphic to the screen buffer.
  $B907,$01 Exchange the #REGde and #REGhl registers.
  $B908,$01 Restore the screen buffer location from the stack.
  $B909,$03 Call #R$A8CC.
  $B90C,$01 Restore the height counter from the stack.
  $B90D,$02 Decrease the height counter by one and loop back to #R$B8FE until
. the frame has been displayed in full.
  $B90F,$01 Return.

c $B910 Print Throwing Dart Frame
@ $B910 label=Print_ThrowingDart_Frame
  $B910,$08 Halt operation (suspend CPU until the next interrupt) eight times.
  $B918,$02 Set a counter in #REGb of #N$18 for the height of the graphic.
  $B91A,$03 Set the target screen buffer location in #REGhl.
@ $B91D label=Print_ThrowingDart_Frame_Loop
  $B91D,$02 Stash the height counter and screen buffer location on the stack.
  $B91F,$01 Exchange the #REGde and #REGhl registers.
  $B920,$06 Copy #N$03 bytes of data from the graphic to the screen buffer.
  $B926,$01 Exchange the #REGde and #REGhl registers.
  $B927,$01 Restore the screen buffer location from the stack.
  $B928,$03 Call #R$A8CC.
  $B92B,$01 Restore the height counter from the stack.
  $B92C,$02 Decrease the height counter by one and loop back to #R$B91D until
. the frame has been displayed in full.
  $B92E,$01 Return.

c $B92F Animation: Dart
@ $B92F label=Animation_Dart
  $B92F,$02 #REGb=#N$02.
  $B931,$03 #REGde=#R$C71C.
  $B934,$01 #REGa=*#REGhl.
  $B935,$01 Stash #REGaf on the stack.
  $B936,$01 #REGa=*#REGde.
  $B937,$01 Set the bits from *#REGhl.
  $B938,$01 Write #REGa to *#REGhl.
  $B939,$01 Increment #REGde by one.
  $B93A,$01 Increment #REGl by one.
  $B93B,$01 #REGa=*#REGhl.
  $B93C,$01 Stash #REGaf on the stack.
  $B93D,$01 #REGa=*#REGde.
  $B93E,$01 Set the bits from *#REGhl.
  $B93F,$01 Write #REGa to *#REGhl.
  $B940,$01 Increment #REGh by one.
  $B941,$01 Increment #REGde by one.
  $B942,$01 #REGa=*#REGhl.
  $B943,$01 Stash #REGaf on the stack.
  $B944,$01 #REGa=*#REGde.
  $B945,$01 Set the bits from *#REGhl.
  $B946,$01 Write #REGa to *#REGhl.
  $B947,$01 Increment #REGde by one.
  $B948,$01 Decrease #REGl by one.
  $B949,$01 #REGa=*#REGhl.
  $B94A,$01 Stash #REGaf on the stack.
  $B94B,$01 #REGa=*#REGde.
  $B94C,$01 Set the bits from *#REGhl.
  $B94D,$01 Write #REGa to *#REGhl.
  $B94E,$01 Increment #REGde by one.
  $B94F,$01 Increment #REGh by one.
  $B950,$02 Decrease counter by one and loop back to #R$B934 until counter is zero.
  $B952,$01 Halt operation (suspend CPU until the next interrupt).
  $B953,$01 Decrease #REGh by one.
  $B954,$02 #REGb=#N$02.
  $B956,$01 Restore #REGaf from the stack.
  $B957,$01 Write #REGa to *#REGhl.
  $B958,$01 Increment #REGl by one.
  $B959,$01 Restore #REGaf from the stack.
  $B95A,$01 Write #REGa to *#REGhl.
  $B95B,$01 Decrease #REGh by one.
  $B95C,$01 Restore #REGaf from the stack.
  $B95D,$01 Write #REGa to *#REGhl.
  $B95E,$01 Decrease #REGl by one.
  $B95F,$01 Restore #REGaf from the stack.
  $B960,$01 Write #REGa to *#REGhl.
  $B961,$01 Decrease #REGh by one.
  $B962,$02 Decrease counter by one and loop back to #R$B956 until counter is zero.
  $B964,$01 Return.

c $B965 Print Pint Frame
@ $B965 label=Print_Pint_Frame
R $B965 HL Screen buffer address for drawing
N $B965 Draws the pint glass to the screen at the location provided by #REGhl.
. #PUSHS #SIM(start=$AB2E,stop=$AB39)
. #SIM(start=$B965,stop=$B974,hl=$4810)
. #UDGTABLE { #SCR$02{$C0,$40,$80,$70}(pint-frame) } UDGTABLE#
  $B965,$02 Set a counter in #REGb for the height of the graphic (#N$10).
  $B967,$03 #REGde=#R$CA54.
@ $B96A label=Print_Pint_Frame_Loop
  $B96A,$02 Fetch the current byte in the screen buffer and stash it on the
. stack.
  $B96C,$02 Fetch a byte from the graphic pointer in *#REGde and write it to
. the screen buffer pointer held by *#REGhl.
  $B96E,$03 Call #R$A8CC.
  $B971,$01 Increment the graphic pointer by one.
  $B972,$02 Decrease the height counter by one and loop back to #R$B96A until
. the whole of the graphic has been drawn to the screen.
N $B974 Make sure the player sees the drawn pint before removing it.
  $B974,$03 Halt operation (suspend CPU until the next interrupt) three times.
N $B977 Next all the stashed bytes are returned to the screen, ready for the
. next frame of the animation.
  $B977,$03 Call #R$A8DB.
  $B97A,$02 Set a counter in #REGb for the height of the graphic (#N$10).
@ $B97C label=Restore_Background_Loop
  $B97C,$02 Restore the stashed byte from the stack and write it to the screen
. buffer pointer held by *#REGhl.
  $B97E,$03 Call #R$A8DB.
  $B981,$02 Decrease the height counter by one and loop back to #R$B97C until
. all the stashed bytes have been drawn back to the screen.
  $B983,$01 Return.

b $B984 Graphics: Jammy Jim
@ $B984 label=Graphics_JammyJim
N $B984 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($B984-$BACE-$01-$30)(jammy-jim) }
. UDGTABLE#
  $B984,$150,$06

b $BAD4 Graphics: Beer Belly Bill
@ $BAD4 label=Graphics_BeerBellyBill
N $BAD4 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($BAD4-$BC1E-$01-$30)(beer-belly-bill) }
. UDGTABLE#
  $BAD4,$150,$06

b $BC24 Graphics: Del Boy Desmond
@ $BC24 label=Graphics_DelBoyDesmond
N $BC24 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($BC24-$BD6E-$01-$30)(del-boy-desmond) }
. UDGTABLE#
  $BC24,$150,$06

b $BD74 Graphics: Mega Mick
@ $BD74 label=Graphics_MegaMick
N $BD74 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($BD74-$BEBE-$01-$30)(mega-mick) }
. UDGTABLE#
  $BD74,$150,$06

b $BEC4 Graphics: Devious Dave
@ $BEC4 label=Graphics_DeviousDave
N $BEC4 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($BEC4-$C00E-$01-$30)(devious-dave) }
. UDGTABLE#
  $BEC4,$150,$06

b $C014 Graphics: Sure Shot Sidney
@ $C014 label=Graphics_SureShotSidney
N $C014 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($C014-$C15E-$01-$30)(sure-shot-sidney) }
. UDGTABLE#
  $C014,$150,$06

b $C164 Graphics: Limp Wrist Larry
@ $C164 label=Graphics_LimpWristLarry
N $C164 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($C164-$C2AE-$01-$30)(limp-wrist-larry) }
. UDGTABLE#
  $C164,$150,$06

b $C2B4 Graphics: Tactical Tel
@ $C2B4 label=Graphics_TacticalTel
N $C2B4 #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($C2B4-$C3FE-$01-$30)(tactical-tel) }
. UDGTABLE#
  $C2B4,$150,$06

b $C404 Graphics: Jammy Jim (Pub Scene)
@ $C404 label=Graphics_JammyJim_Pub
N $C404 #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C404-$C449-$01-$18)(pub-jammy-jim) }
. UDGTABLE#
  $C404,$48,$03

b $C44C Graphics: Beer Belly Bill (Pub Scene)
@ $C44C label=Graphics_BeerBellyBill_Pub
N $C44C #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C44C-$C491-$01-$18)(pub-beer-belly-bill) }
. UDGTABLE#
  $C44C,$48,$03

b $C494 Graphics: Del Boy Desmond (Pub Scene)
@ $C494 label=Graphics_DelBoyDesmond_Pub
N $C494 #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C494-$C4D9-$01-$18)(pub-del-boy-desmond) }
. UDGTABLE#
  $C494,$48,$03

b $C4DC Graphics: Mega Mick (Pub Scene)
@ $C4DC label=Graphics_MegaMick_Pub
N $C4DC #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C4DC-$C521-$01-$18)(pub-mega-mick) }
. UDGTABLE#
  $C4DC,$48,$03

b $C524 Graphics: Devious Dave (Pub Scene)
@ $C524 label=Graphics_DeviousDave_Pub
N $C524 #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C524-$C569-$01-$18)(pub-devious-dave) }
. UDGTABLE#
  $C524,$48,$03

b $C56C Graphics: Sure Shot Sidney (Pub Scene)
@ $C56C label=Graphics_SureShotSidney_Pub
N $C56C #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C56C-$C5B1-$01-$18)(pub-sure-shot-sidney) }
. UDGTABLE#
  $C56C,$48,$03

b $C5B4 Graphics: Limp Wrist Larry (Pub Scene)
@ $C5B4 label=Graphics_LimpWristLarry_Pub
N $C5B4 #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C5B4-$C5F9-$01-$18)(pub-limp-wrist-larry) }
. UDGTABLE#
  $C5B4,$48,$03

b $C5FC Graphics: Tactical Tel (Pub Scene)
@ $C5FC label=Graphics_TacticalTel_Pub
N $C5FC #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C5FC-$C641-$01-$18)(pub-tactical-tel) }
. UDGTABLE#
  $C5FC,$48,$03

b $C644 Graphics: Throwing
@ $C644 label=Graphics_Throwing_01
N $C644 Frame #N$01:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C644-$C689-$01-$18)(throwing-1*) }
. UDGTABLE#
  $C644,$48,$03
@ $C68C label=Graphics_Throwing_02
N $C68C Frame #N$02:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C68C-$C6D1-$01-$18)(throwing-2*) }
. UDGTABLE#
  $C68C,$48,$03
@ $C6D4 label=Graphics_Throwing_03
N $C6D4 Frame #N$03:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C6D4-$C719-$01-$18)(throwing-3*) }
. UDGTABLE#
  $C6D4,$48,$03

b $C71C Graphics: Dart
@ $C71C label=Graphics_Dart
D $C71C #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($C71C-$C720-$01-$20){$00,$00,$80,$08}(dart) }
. UDGTABLE#
  $C71C,$08,$04

b $C724 Graphics: Bar Maid
@ $C724 label=Graphics_BarMaid_01
N $C724 Frame #N$01:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C724-$C781-$01-$18)(bar-maid-1) }
. UDGTABLE#
  $C724,$60,$03
@ $C784 label=Graphics_BarMaid_02
N $C784 Frame #N$02:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C784-$C7E1-$01-$18)(bar-maid-2) }
. UDGTABLE#
  $C784,$60,$03
@ $C7E4 label=Graphics_BarMaid_03
N $C7E4 Frame #N$03:
. #UDGTABLE(default)
. { #UDGARRAY$03,attr=$47,scale=$04,step=$03($C7E4-$C841-$01-$18)(bar-maid-3) }
. UDGTABLE#
  $C7E4,$60,$03

b $C844 Graphics: Dog
@ $C844 label=Graphics_Dog_01
N $C844 Frame #N$01:
. #UDGTABLE(default)
. { #UDGARRAY$05,attr=$47,scale=$04,step=$05($C844-$C8B7-$01-$28)(dog-1) }
. UDGTABLE#
  $C844,$78,$05
@ $C8BC label=Graphics_Dog_02
N $C8BC Frame #N$02:
. #UDGTABLE(default)
. { #UDGARRAY$05,attr=$47,scale=$04,step=$05($C8BC-$C92F-$01-$28)(dog-2) }
. UDGTABLE#
  $C8BC,$78,$05
@ $C934 label=Graphics_Dog_03
N $C934 Frame #N$03:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($C934-$C990-$01-$20)(dog-3) }
. UDGTABLE#
  $C934,$60,$04
@ $C994 label=Graphics_Dog_04
N $C994 Frame #N$04:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($C994-$C9F0-$01-$20)(dog-4) }
. UDGTABLE#
  $C994,$60,$04
@ $C9F4 label=Graphics_Dog_05
N $C9F4 Frame #N$05:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($C9F4-$CA50-$01-$20)(dog-5) }
. UDGTABLE#
  $C9F4,$60,$04

b $CA54 Graphics: Pint
@ $CA54 label=Graphics_Pint
N $CA54 #UDGTABLE(default)
. { #UDGARRAY$01,attr=$47,scale=$04,step=$01($CA54-$CA63-$01-$08)(pint) }
. UDGTABLE#
  $CA54,$10,$01

b $CA64 Graphics: Bar
@ $CA64 label=Graphics_Bar
N $CA64 #UDGTABLE(default)
. { #UDGARRAY$01,attr=$47,scale=$04,step=$01($CA64-$CA7B-$01-$08)(bar) }
. UDGTABLE#
  $CA64,$18,$01

c $CA7C

w $CAA3

c $CAEB
  $CAEB,$03 #REGhl=#R$CAA3.
  $CAEE,$03 #REGde=#N($0018,$04,$04).
  $CAF1,$01 Set the bits from #REGa.
  $CAF2,$02 Jump to #R$CAF8 if the result is zero.
  $CAF4,$01 #REGb=#REGa.
  $CAF5,$01 #REGhl+=#REGde.
  $CAF6,$02 Decrease counter by one and loop back to #R$CAF5 until counter is zero.
  $CAF8,$03 #REGde=#R$B431.
  $CAFB,$02 #REGb=#N$04.
  $CAFD,$01 Stash #REGbc on the stack.
  $CAFE,$01 Exchange the #REGde and #REGhl registers.
  $CAFF,$01 Write #REGe to *#REGhl.
  $CB00,$01 Increment #REGhl by one.
  $CB01,$01 Write #REGd to *#REGhl.
  $CB02,$01 Increment #REGhl by one.
  $CB03,$01 Exchange the #REGde and #REGhl registers.
  $CB04,$04 #REGhl+=#N($0006,$04,$04).
  $CB08,$01 Restore #REGbc from the stack.
  $CB09,$02 Decrease counter by one and loop back to #R$CAFD until counter is zero.
  $CB0B,$01 Exchange the #REGde and #REGhl registers.
  $CB0C,$02 Decrease #REGde by two.
  $CB0E,$01 Write #REGe to *#REGhl.
  $CB0F,$01 Increment #REGhl by one.
  $CB10,$01 Write #REGd to *#REGhl.
  $CB11,$01 Return.

c $CB12
  $CB12,$03 Jump to #R$CB1E.
  $CB15,$03 Jump to #R$CBF7.
  $CB18,$03 Jump to #R$CC62.
  $CB1B,$03 Jump to #R$CBC8.

c $CB1E
  $CB1E,$01 Stash #REGaf on the stack.
  $CB1F,$04 Write #N$00 to *#R$D009.
  $CB23,$01 Restore #REGaf from the stack.
  $CB24,$05 Multiply #REGa by #N$06 and store the result in #REGc.
  $CB29,$02 #REGb=#N$00.
  $CB2B,$03 #REGhl=#R$D00A.
  $CB2E,$01 #REGhl+=#REGbc.
  $CB2F,$04 #REGix=#R$CB6B.
  $CB33,$02 #REGc=#N$1F.
  $CB35,$02 #REGa=#N$03.
  $CB37,$01 #REGe=*#REGhl.
  $CB38,$01 Increment #REGhl by one.
  $CB39,$01 #REGd=*#REGhl.
  $CB3A,$01 Increment #REGhl by one.
  $CB3B,$01 Stash #REGhl on the stack.
  $CB3C,$04 Write #N$01 to *#REGix+#N$10.
  $CB40,$03 Write #REGb to *#REGix+#N$00.
  $CB43,$03 Write #REGb to *#REGix+#N$1D.
  $CB46,$03 Write #REGe to *#REGix+#N$03.
  $CB49,$03 Write #REGd to *#REGix+#N$04.
  $CB4C,$01 Exchange the #REGde and #REGhl registers.
  $CB4D,$01 #REGe=*#REGhl.
  $CB4E,$01 Increment #REGhl by one.
  $CB4F,$01 #REGd=*#REGhl.
  $CB50,$04 Write #N$02 to *#REGix+#N$05.
  $CB54,$03 Write #REGb to *#REGix+#N$06.
  $CB57,$01 Restore #REGhl from the stack.
  $CB58,$03 Write #REGe to *#REGix+#N$01.
  $CB5B,$03 Write #REGd to *#REGix+#N$02.
  $CB5E,$02 #REGix+=#REGbc.
  $CB60,$01 Decrease #REGa by one.
  $CB61,$02 Jump to #R$CB37 if #REGa is not equal to #N$03.
  $CB63,$01 Increment #REGa by one.
  $CB64,$03 Write #REGa to *#R$CC84.
  $CB67,$03 Write #REGa to *#R$D009.
  $CB6A,$01 Return.

b $CB6B
  $CB6E
  $CB6F
  $CB8A
  $CB8D
  $CB8E
  $CBA9
  $CBAC
  $CBAD

c $CBC8
  $CBC8,$05 Write #N$01 to *#R$D009.
  $CBCD,$01 Return.

c $CBCE
  $CBCE,$05 Multiply #REGa by #N$06 and store the result in #REGc.
  $CBD3,$02 #REGb=#N$00.
  $CBD5,$03 #REGhl=#R$D00A.
  $CBD8,$01 #REGhl+=#REGbc.
  $CBD9,$04 Write *#REGhl to *#R$CB6E.
  $CBDD,$01 Increment #REGhl by one.
  $CBDE,$04 Write *#REGhl to *#R$CB6F.
  $CBE2,$01 Increment #REGhl by one.
  $CBE3,$04 Write *#REGhl to *#R$CB8D.
  $CBE7,$01 Increment #REGhl by one.
  $CBE8,$04 Write *#REGhl to *#R$CB8E.
  $CBEC,$01 Increment #REGhl by one.
  $CBED,$04 Write *#REGhl to *#R$CBAC.
  $CBF1,$01 Increment #REGhl by one.
  $CBF2,$04 Write *#REGhl to *#R$CBAD.
  $CBF6,$01 Return.

c $CBF7
  $CBF7,$05 Return if *#R$D009 is zero.
  $CBFC,$05 Write #N$00 to *#R$CC49(#N$CC4A).
  $CC01,$03 #REGhl=#R$CC84.
  $CC04,$01 Decrease *#REGhl by one.
  $CC05,$02 Jump to #R$CC22 if *#REGhl is not equal to #N$00.
  $CC07,$01 #REGb=*#REGhl.
  $CC08,$04 #REGix=#R$CB6B.
  $CC0C,$03 Call #R$CD4A.
  $CC0F,$04 #REGix=#R$CB8A.
  $CC13,$03 Call #R$CD4A.
  $CC16,$04 #REGix=#R$CBA9.
  $CC1A,$03 Call #R$CD4A.
  $CC1D,$03 #REGhl=#R$CC84.
  $CC20,$02 Write #N$01 to *#REGhl.
  $CC22,$04 #REGix=#R$CB6B.
  $CC26,$03 Call #R$CDEC.
  $CC29,$03 Write #REGhl to *#R$CEFD.
  $CC2C,$03 Write #REGa to *#R$CF05.
  $CC2F,$04 #REGix=#R$CB8A.
  $CC33,$03 Call #R$CDEC.
  $CC36,$03 Write #REGhl to *#R$CEFF.
  $CC39,$03 Write #REGa to *#R$CF06.
  $CC3C,$04 #REGix=#R$CBA9.
  $CC40,$03 Call #R$CDEC.
  $CC43,$03 Write #REGhl to *#R$CF01.
  $CC46,$03 Write #REGa to *#R$CF07.
  $CC49,$05 Write #N$00 to *#R$CF03.
  $CC4E,$03 #REGhl=#R$CF0A.
  $CC51,$02 #REGa=#N$0D.
  $CC53,$02 #REGc=#N$FD.
  $CC55,$02 #REGb=#N$FF.
  $CC57,$02 Send #REGa to port *#REGc.
  $CC59,$02 #REGb=#N$BF.
  $CC5B,$02 OUTD.
  $CC5D,$01 Decrease #REGa by one.
  $CC5E,$03 Jump to #R$CC55 if #REGa is greater than or equal to #REGa.
  $CC61,$01 Return.

c $CC62 Initialise AY Sound
@ $CC62 label=Initialise_AYSound
  $CC62,$01 #REGa=#N$00.
  $CC63,$03 Write #REGa to *#R$D009.
  $CC66,$02 Set the port number for the AY sound in #REGc (#N$FD).
  $CC68,$03 #REGde=#N($0D00,$04,$04).
  $CC6B,$01 #REGa-=#REGa.
  $CC6C,$02 Select the register port.
  $CC6E,$02 Select register.
  $CC70,$02 Set the data port in #REGb (#N$BF).
  $CC72,$02 Write zero to the register.
  $CC74,$01 Decrease #REGd by one.
  $CC75,$03 Jump back to #R$CC6C if #REGd is greater than or equal to #N$00.
N $CC78 Set mixer control.
  $CC78,$03 #REGde=#N($073F,$04,$04).
  $CC7B,$02 #REGb=#N$FF.
  $CC7D,$02 Select mixer register.
  $CC7F,$02 Set the data port in #REGb (#N$BF).
  $CC81,$02 Set mixer state.
  $CC83,$01 Return.

c $CC84

b $CEFD
b $CEFF
b $CF01
b $CF03
b $CF05
b $CF06
b $CF07
b $CF0A

b $D009

w $D00A
N $D00A #N((#PC-$D00A)/$06).
  $D00A,$02
  $D00C,$02
  $D00E,$02
L $D00A,$06,$02
N $D016 Data?
N $D030 Data?
N $D04A Data?
N $D064 Data?
N $D068 Data?
N $D06C Data?

b $D2A0

b $D330

b $DD00 Graphics: Pub Scene
D $DD00 #UDGTABLE { =h Pub Scene } { #SCR$02,$00,$00,$20,$18,$DD00,$F500(pub-scene) } UDGTABLE#
@ $DD00 label=PubScene
  $DD00,$1800,$20 Pixels.
  $F500,$0300,$20 Attributes.

b $F800
  $F807

g $F80A Buffer Pointer
@ $F80A label=Buffer_Pointer
W $F80A,$02

g $F80C
B $F80C,$02,$01

b $F80E

g $F814 Buffer Control Code
@ $F814 label=Buffer_ControlCode
B $F814,$01

g $F815 Buffer Counter
@ $F815 label=Buffer_Counter
B $F815,$01

g $F816
B $F816,$02,$01

g $F818
B $F818,$01
B $F819,$01

g $F81A Font Pointer
@ $F81A label=Font_Pointer
W $F81A,$02

g $F81C Print: Attribute Buffer Pointer
@ $F81C label=PrintAttributeBuffer_Pointer
D $F81C Pointer to the attribute buffer location of where the characters will
. be printed.
W $F81C,$02

  $F81E

g $F821 Control Byte?
@ $F821 label=ControlByte
B $F821,$01

g $F822

g $F827 Initial Stack Pointer
@ $F827 label=Initial_StackPointer
D $F827 Holds the initial value of the stack pointer.
. This is set in #R$9183 and restored only at #R$95BE.
W $F827,$02

b $F829

g $F82B Print: Screen Buffer Pointer
@ $F82B label=PrintScreenBuffer_Pointer
D $F82B Pointer to the screen buffer location of where the characters will be
. printed.
W $F82B,$02

b $F82D
  $F864
  $F865

w $F900

b $FA00

c $FDFD Alias: Interrupt Jump Dispatcher
@ $FDFD label=AliasInterruptRedirect
D $FDFD All generated interrupts jump here and then are redirected to #R$95ED.
  $FDFD,$03 Jump to #R$95ED.

b $FE00 Interrupt Low-Order Byte Jump Table
@ $FE00 label=InterruptLowOrderByteJumpTable
D $FE00 Used as the low-order byte when an interrupt is generated.
. The high-order byte is also #N$FD, meaning all interrupts jump to #R$FDFD.
.
. See #R$95D2 and #R$FDFD.
  $FE00,$0100

b $FF01

b $FF58 Mystery Font
@ $FF58 label=MysteryFont
  $FF58,$08 #UDG(#PC,attr=$46)
L $FF58,$08,$15
