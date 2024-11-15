; Copyright Mastertronic 1986, 2024 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @org=$4000
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

c $8D72 Game Entry Point Alias
@ $8D72 label=GameEntryPointAlias
  $8D72,$03 Jump to #R$9183.

b $8D75 Custom Font
@ $8D75 label=CustomFont
S $8D75,$80
  $8DF5,$08 #UDG(#PC,attr=$47)
L $8DF5,$08,$2E

b $8F65

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
  $9218,$03 Call #R$9736.
B $921B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $921E,$16 #FONT#(:(#STR(#PC,$04,$16)))$8D75,attr=$47(one-hundred-and-eighty).
B $9234,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $9237,$01 #FONT#(:(#STR#(#PC,$02,$01)))$8D75,attr=$47(copyright).
B $9238,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $923B,$16 #FONT#(:(#STR#(#PC),$0B($b==$FF)))$8D75,attr=$47(mastertronic).
B $9251,$01 Terminator.
  $9252,$01 Return.

c $9253
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
  $9305,$04 Return if #REGe is greater than #N$20.
  $9309,$01 Stash #REGde on the stack.
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
  $9346,$03 Call #R$CB1E.
N $9349 Zero the displayed score.
  $9349,$03 #REGhl=#R$91AB(#N$91AE).
  $934C,$03 #REGde=#R$91AB(#N$91AF).
  $934F,$03 #REGbc=#N($0005,$04,$04).
  $9352,$02 Write "#CHR$30" to the first digit in #R$91AB.
  $9354,$02 Copy the zero to the next five digits.
N $9356 #PUSHS SIM(start=$9356,stop=$93D1)
. #UDGTABLE(default)
.   { #SCR$02(main-menu-1) }
. UDGTABLE# #POPS
N $9356 Print the menu options.
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
  $93CB,$03 Call #R$9218.
  $93CE,$03 Call #R$91B6.
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
. until counter is zero.
  $93E1,$03 #REGde=#N$0500.
  $93E4,$02 #REGb=#N$04.
  $93E6,$02 Stash #REGbc and #REGde on the stack.
  $93E8,$03 Call #R$9305.
  $93EB,$02 Restore #REGde and #REGbc from the stack.
  $93ED,$02 Increment #REGd by two.
  $93EF,$02 Decrease counter by one and loop back to #R$93E6 until counter is zero.
  $93F1,$03 Call #R$944E.
  $93F4,$03 Call #R$965F.
  $93F7,$01 Stash #REGaf on the stack.
  $93F8,$01 Restore #REGaf from the stack.
  $93F9,$02 Jump to #R$93F1 if #REGd is equal to #N$04.
  $93FB,$04 Jump to #R$9429 if #REGa is not equal to #N$30.
  $93FF,$03 Call #R$9942.
  $9402,$06 Write *#R$99F6 to *#R$99F5.
  $9408,$01 #REGa+=#REGa.
  $9409,$02 #REGa+=#N$05.
  $940B,$01 #REGd=#REGa.
  $940C,$02 #REGe=#N$01.
  $940E,$02 #REGb=#N$3E.
  $9410,$02 Stash #REGbc and #REGde on the stack.
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
  $9423,$01 Restore #REGbc from the stack.
  $9424,$02 Decrease counter by one and loop back to #R$9410 until counter is zero.
  $9426,$03 Jump to #R$94E6.
  $9429,$05 Jump to #R$93F1 if #REGa is greater than #N$36.
  $942E,$05 Jump to #R$93F1 if #REGa is less than #N$30.
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
R $94B8 HL The co-ordinates of the dart.
  $94B8,$03 Call #R$A862.
  $94BB,$0A Write #COLOUR$00 to #N$04 character blocks in this attribute row.
N $94C5 Move down one row, and back #N$04 character blocks (the width of the
. dart graphic).
  $94C5,$04 #REGhl+=#N($001C,$04,$04).
  $94C9,$09 Write #COLOUR$00 to #N$04 character blocks in this attribute row.
  $94D2,$01 Return.

c $94D3
  $94D3,$03 Call #R$965F.
  $94D6,$01 Set the bits from #REGa.
  $94D7,$02 Jump to #R$94D3 if #REGhl is not equal to #REGa.
  $94D9,$02 #REGb=#N$32.
  $94DB,$01 Halt operation (suspend CPU until the next interrupt).
  $94DC,$01 #REGa=#N$00.
  $94DD,$02 #REGa=byte from port #N$FE.
  $94DF,$02,b$01 Set bits 5-7.
  $94E1,$01 Increment #REGa by one.
  $94E2,$01 Return if #REGa is not equal to #REGa.
  $94E3,$02 Decrease counter by one and loop back to #R$94DB until counter is zero.
  $94E5,$01 Return.

c $94E6
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
  $95F6,$06 Jump to #R$9626 if *#R$9B2B is equal to #N$C3.
  $95FC,$03 #REGhl=#R$9AB5.
  $95FF,$01 Decrease *#REGhl by one.
  $9600,$02 Jump to #R$9626 if *#REGhl is not equal to #N$C3.
  $9602,$02 Write #N$32 to *#REGhl.
  $9604,$03 #REGhl=#N$A38D.
  $9607,$01 Decrease *#REGhl by one.
  $9608,$05 Jump to #R$9623 if *#REGhl is not equal to #N$2F.
  $960D,$02 Write #N$39 to *#REGhl.
  $960F,$03 #REGhl=#R$A383(#N$A38C).
  $9612,$01 Decrease *#REGhl by one.
  $9613,$05 Jump to #R$9623 if *#REGl is not equal to #N$2F.
  $9618,$05 Write #N$01 to *#N$9B2A.
  $961D,$04 Write #N$00 to *#N$9B2B.
  $9621,$02 Jump to #R$9626.
  $9623,$03 Call #R$A380.
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
  $992A,$01 Stash #REGbc on the stack.
  $992B,$02 #REGc=#N$00.
  $992D,$02 #REGb=#N$14.
  $992F,$03 #REGhl=#N($0014,$04,$04).
  $9932,$01 Decrease #REGhl by one.
  $9933,$04 Jump to #R$9932 until #REGhl is zero.
  $9937,$01 Load #REGc into #REGa.
  $9938,$02,b$01 Flip the speaker bit.
  $993A,$01 Store the result back to #REGc.
  $993B,$02 Send #REGa to the speaker.
  $993D,$02 Decrease counter by one and loop back to #R$992F until counter is zero.
  $993F,$03 Jump to #R$9961.

c $9942
  $9942,$02 #REGc=#N$00.
  $9944,$02 #REGb=#N$3C.
  $9946,$03 #REGhl=#N($000A,$04,$04).
  $9949,$01 Decrease #REGhl by one.
  $994A,$04 Jump to #R$9949 until #REGhl is zero.
  $994E,$01 Load #REGc into #REGa.
  $994F,$02,b$01 Flip the speaker bit.
  $9951,$01 Store the result back to #REGc.
  $9952,$02 Send #REGa to the speaker.
  $9954,$02 Decrease counter by one and loop back to #R$9946 until counter is zero.
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

c $99F7

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

b $9A6F
  $9A6F
  $9A72,$01
  $9AA6,$01
  $9AA7,$01
  $9AA9,$01
  $9AAA,$01
  $9AAD,$01
W $9AAE,$02

g $9AB0 Player Current Total
@ $9AB0 label=2UP_Total
W $9AB0,$02
@ $9AB2 label=1UP_Total
W $9AB2,$02

b $9AB4
  $9AB5
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

g $9AC3
W $9AC3,$02

  $9B0F

g $9B1F Score?
@ $9B1F label=Score
B $9B1F,$02

  $9B2B
  $9B2F

c $9D33
  $9D33,$03 Call #R$A7A5.
  $9D36,$03 Call #R$A835.
  $9D39,$03 Call #R$A851.
  $9D3C,$03 Call #R$A505.
  $9D3F,$03 Jump to #R$A8F8.

c $9D42

  $A028,$03 Call #R$964C.
B $A02B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A02E,$05 "#STR#(#PC,$04,$05)".
L $A02B,$08,$03
B $A043,$01 Terminator.

  $A0D6,$03 Call #R$964C.
B $A0D9,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A0DC,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(bust)
B $A0E2,$01 Terminator.

c $9D33

c $A15C Messaging: You Win!
@ $A15C label=Messaging_YouWin
B $A181,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A184,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(great)
B $A18A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A18D,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(shot)
B $A193,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A196,$06 "#STR#(#PC,$04,$06)".
B $A19C,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A19F,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(you)
B $A1A5,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1A8,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(win)
B $A1AE,$01 Terminator.

B $A1BD,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1C0,$01 "#STR#(#PC,$04,$01)".
B $A1C1,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1C4,$06 #FONT#(:(#STR(#PC,$04,$06)))$8D75,attr=$47(player)
B $A1CA,$01 Terminator.

B $A1D4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1D7,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(two!)
B $A1DB,$01 Terminator.

B $A1E1,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A1E4,$04 #FONT#(:(#STR(#PC,$04,$04)))$8D75,attr=$47(one!)
B $A1E8,$01 Terminator.

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

c $A380
  $A380,$03 Call #R$964C.
B $A383,$02 INK: #INK(#PEEK(#PC+$01)).
B $A385,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A387,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A389,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A38C,$02 "#STR#(#PC,$04,$02)".
B $A38E,$01 Terminator.

  $A3A3,$01 Return.

c $A3A4

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

c $A434

c $A461

c $A491

c $A4AB

c $A4D4

c $A505

c $A50E

c $A532

c $A556

c $A58F

c $A5B2

c $A5E1

c $A613

c $A639

c $A652

c $A682

c $A69C

c $A6CC

c $A6E6

c $A73A

c $A774

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
  $A7D5,$03 #REGa=*#R$9AA6.
  $A7D8,$02 #REGa+=#N$30.
  $A7DA,$03 Write #REGa to *#R$A7F1.
  $A7DD,$03 #REGa=*#R$9AA7.
  $A7E0,$02 #REGa+=#N$30.
  $A7E2,$03 Write #REGa to *#R$A7F5.
  $A7E5,$03 Call #R$964C.
B $A7E8,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A7EA,$02 INK: #INK(#PEEK(#PC+$01)).
B $A7EC,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A7EE,$03,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A7F1,$01 "#STR#(#PC,$04,$01)".
B $A7F2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A7F5,$01 "#STR#(#PC,$04,$01)".
B $A7F6,$01 Terminator.
  $A7F7,$01 Return.

c $A7F8

c $A835

c $A851

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

c $A8CC
  $A8CC,$01 Increment #REGh by one.
  $A8CD,$01 #REGa=#REGh.
  $A8CE,$02,b$01 Keep only bits 0-2.
  $A8D0,$01 Return if #REGa is not equal to #N$00.
  $A8D1,$04 #REGl+=#N$20.
  $A8D5,$01 Return if #REGl is less than #N$00.
  $A8D6,$04 #REGh-=#N$08.
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

c $A8EA

c $A8F8
  $A916,$03 Call #R$964C.
B $A919,$02 INK: #INK(#PEEK(#PC+$01)).
B $A91B,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A91D,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A91F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A922,$01 "#STR#(#PC,$04,$01)".
B $A923,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A926,$04 "#STR#(#PC,$04,$04)".
B $A92A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A92D,$02 "#STR#(#PC,$04,$02)".
B $A92F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A932,$01 "#STR#(#PC,$04,$01)".
B $A933,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A936,$04 "#STR#(#PC,$04,$04)".
B $A93A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A93D,$02 "#STR#(#PC,$04,$02)".
B $A93F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A942,$01 "#STR#(#PC,$04,$01)".
B $A943,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A946,$03 "#STR#(#PC,$04,$03)".
B $A949,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A94C,$06 "#STR#(#PC,$04,$06)".
B $A952,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A955,$01 "#STR#(#PC,$04,$01)".
B $A956,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A959,$05 "#STR#(#PC,$04,$05)".
B $A95E,$01 Terminator.

  $A980,$03 Call #R$964C.
B $A983,$02 INK: #INK(#PEEK(#PC+$01)).
B $A985,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A987,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A989,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A98C,$06 "#STR#(#PC,$04,$06)".
B $A992,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A995,$04 "#STR#(#PC,$04,$04)".
B $A999,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A99C,$06 "#STR#(#PC,$04,$06)".
B $A9A2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9A5,$04 "#STR#(#PC,$04,$04)".
B $A9A9,$01 Terminator.

c $A9E5
  $A9E5,$03 Call #R$964C.
B $A9E8,$02 INK: #INK(#PEEK(#PC+$01)).
B $A9EA,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $A9EC,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $A9EE,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9F1,$03 "#STR#(#PC,$04,$03)".
B $A9F4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9F7,$04 "#STR#(#PC,$04,$04)".
B $A9FB,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $A9FE,$05 "#STR#(#PC,$04,$05)".
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
  $AA3B,$05 Write #N$00 to *#R$9AA7.
  $AA40,$05 Write #N$00 to *#R$9AA6.
  $AA45,$03 Call #R$B517.
  $AA48,$03 Call #R$A7A5.
  $AA4B,$03 Call #R$B5BA.
  $AA4E,$03 Call #R$AE04.
  $AA51,$03 Call #R$AE04.
  $AA54,$03 Call #R$AE04.
  $AA57,$03 Jump to #R$AADC.

c $AA5A

c $AA7B

c $AA9B
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
T $AAB3,$06 "#STR#(#PC,$04,$06)".
B $AAB9,$01 Terminator.
N $AABA Flip the current player ID.
  $AABA,$08 Toggle *#R$9AB8 to switch from 1UP to 2UP/ 2UP to 1UP.
  $AAC2,$02 Jump to #R$AAD0 if the current player is 1UP.
N $AAC4 Print "2" (For Player 2).
  $AAC4,$03 Call #R$964C.
B $AAC7,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AACA,$01 "#STR#(#PC,$04,$01)".
B $AACB,$01 Terminator.
  $AACC,$03 Call #R$AE04.
  $AACF,$01 Return.
N $AAD0 Print "1" (For Player 1).
@ $AAD0 label=Print_1
  $AAD0,$03 Call #R$964C.
B $AAD3,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AAD6,$01 "#STR#(#PC,$04,$01)".
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
  $AAF5,$05 Write "#CHR$35" to *#R$ACF6.
  $AAFA,$03 Write "#CHR$30" to *#R$ACF6(#N$ACF7).
  $AAFD,$03 Write "#CHR$31" to *#R$ACF6(#N$ACF8).
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

c $AB2E Messaging: Dart Number
@ $AB2E label=Messaging_DartNumber
  $AB2E,$0B Copy #N$1B00 bytes of data from *#R$DD00 to #R$4000.
  $AB39,$04 #REGbc=*#R$9AAE.
  $AB3D,$02 #REGd=#N$06.
  $AB3F,$02 #REGe=#N$16.
  $AB41,$03 Call #R$B761.
  $AB44,$05 Write #N$ED to *#R$B8EA.
  $AB49,$05 Write #N$A0 to *#R$B8EB.
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
T $AB84,$08 "#STR#(#PC,$04,$08)".
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
T $ABBF,$08 "#STR#(#PC,$04,$08)".
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
T $ABF7,$08 "#STR#(#PC,$04,$08)".
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
T $AC47,$09 "#STR#(#PC,$04,$09)".
B $AC50,$01 Terminator.
  $AC51,$01 Return.

c $AC52
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
@ $ACB4 label=CurrentTotal
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
T $ACC5,$0C "#STR#(#PC,$04,$0C)".
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
T $ACE5,$0E "#STR#(#PC,$04,$0E)".
B $ACF3,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
@ $ACF6 label=Current_Total
T $ACF6,$03 "#STR#(#PC,$04,$03)".
B $ACF9,$01 Terminator.
  $ACFA,$01 Return.

c $ACFB

  $AD08,$03 Call #R$964C.
B $AD0B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD0E,$03 "#STR#(#PC,$04,$03)".
B $AD11,$01 Terminator.
  $AD24,$03 Call #R$964C.
B $AD27,$02 INK: #INK(#PEEK(#PC+$01)).
B $AD29,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AD2B,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $AD2D,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD30,$03 "#STR#(#PC,$04,$03)".
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

c $AD5C

  $AD63,$03 Call #R$964C.
B $AD66,$02 INK: #INK(#PEEK(#PC+$01)).
B $AD68,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $AD6A,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $AD6C,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD6F,$03 #FONT#(:(#STR(#PC,$04,$03)))$8D75,attr=$47(got)
B $AD72,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $AD75,$03 "#STR#(#PC,$04,$03)".
B $AD78,$01 Terminator.

c $AD82
  $AD82,$04 Jump to #R$AD97 if #REGa is equal to #N$53.
  $AD86,$04 Jump to #R$ADAD if #REGa is equal to #N$44.
  $AD8A,$04 Jump to #R$ADC3 if #REGa is equal to #N$54.
  $AD8E,$04 Jump to #R$ADD9 if #REGa is equal to #N$4D.
  $AD92,$04 Jump to #R$ADEE if #REGa is equal to #N$42.
  $AD96,$01 Return.

  $AD97,$04 Write #REGb to *#R$ADA2(#N$ADA3).
  $AD9B,$04 Write #REGc to *#R$ADA2(#N$ADA4).
  $AD9F,$03 Call #R$964C.
B $ADA2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADA5,$06 "#STR#(#PC,$04,$06)".
B $ADAB,$01 Terminator.
  $ADAC,$01 Return.

  $ADAD,$04 Write #REGb to *#R$ADB8(#N$ADB9).
  $ADB1,$04 Write #REGc to *#R$ADB8(#N$ADBA).
  $ADB5,$03 Call #R$964C.
B $ADB8,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADBB,$06 "#STR#(#PC,$04,$06)".
B $ADC1,$01 Terminator.
  $ADC2,$01 Return.

  $ADC3,$04 Write #REGb to *#R$ADCE(#N$ADCF).
  $ADC7,$04 Write #REGc to *#R$ADCE(#N$ADD0).
  $ADCB,$03 Call #R$964C.
B $ADCE,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADD1,$06 "#STR#(#PC,$04,$06)".
B $ADD7,$01 Terminator.
  $ADD8,$01 Return.

  $ADD9,$03 Call #R$964C.
B $ADDC,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADDF,$0D "#STR#(#PC,$04,$0D)".
B $ADEC,$01 Terminator.
  $ADED,$01 Return.

  $ADEE,$04 Write #REGb to *#R$ADF9(#N$ADFA).
  $ADF2,$04 Write #REGc to *#R$ADF9(#N$ADFB).
  $ADF6,$03 Call #R$964C.
B $ADF9,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $ADFC,$06 "#STR#(#PC,$04,$06)".
B $AE02,$01 Terminator.
  $AE03,$01 Return.

c $AE04

c $AE17

c $AEF0

b $AF49
  $AF5D

b $AF73 Graphics: Dart Pointer
@ $AF73 label=Graphics_DartPointer
D $AF73 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($AF73-$AFAF-$01-$30){$00,$00,$C0,$2C}(dart-pointer) }
. UDGTABLE#
  $AF73,$42,$06

c $AFB5

c $B16B

  $B173,$03 Call #R$964C.
B $B176,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B179,$16 "#STR#(#PC,$04,$16)".
B $B18F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B192,$10 "#STR#(#PC,$04,$10)".
B $B1A2,$01 Terminator.

  $B1FA,$03 Call #R$964C.
B $B1FD,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B200,$02 INK: #INK(#PEEK(#PC+$01)).
B $B202,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B204,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B206,$01
T $B207,$0D "#STR#(#PC,$04,$0D)".
B $B214,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B217,$12 "#STR#(#PC,$04,$12)".
B $B229,$01 Terminator.
  $B22A,$03 Call #R$AE04.
  $B22D,$03 Jump to #R$933F.

c $B230

c $B5BA Quarter Finals
@ $B5BA label=QuarterFinals

  $B5D3,$03 Call #R$964C.
B $B5D6,$02 INK: #INK(#PEEK(#PC+$01)).
B $B5D8,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B5DA,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B5DC,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B5DF,$0F "#STR#(#PC,$04,$0F)".
B $B5EE,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B5F1,$02 INK: #INK(#PEEK(#PC+$01)).
T $B5F3,$0D "#STR#(#PC,$04,$0D)".
B $B600,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B603,$02 INK: #INK(#PEEK(#PC+$01)).
T $B605,$10 "#STR#(#PC,$04,$10)".
B $B615,$01 Terminator.

  $B63F,$01 Return.

c $B640 Semi Finals
@ $B640 label=SemiFinals

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
T $B687,$10 "#STR#(#PC,$04,$10)".
B $B697,$01 Terminator.

  $B6C1,$01 Return.

c $B6C2 The Final
@ $B6C2 label=TheFinal

  $B6DB,$03 Call #R$964C.
B $B6DE,$02 INK: #INK(#PEEK(#PC+$01)).
B $B6E0,$02 PAPER: #INK(#PEEK(#PC+$01)).
B $B6E2,$02 FLASH: #MAP(#PEEK(#PC+$01))(?,0:OFF,1:ON).
B $B6E4,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
T $B6E7,$09 "#STR#(#PC,$04,$09)".
B $B6F0,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B6F3,$02 INK: #INK(#PEEK(#PC+$01)).
T $B6F5,$0D "#STR#(#PC,$04,$0D)".
B $B702,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $B705,$02 INK: #INK(#PEEK(#PC+$01)).
T $B707,$10 "#STR#(#PC,$04,$10)".
B $B717,$01 Terminator.

  $B741,$01 Return.

c $B742
  $B742,$03 Call #R$A8AE.
  $B745,$01 #REGd=#REGb.
  $B746,$01 #REGe=#REGc.
  $B747,$02 #REGb=#N$38.
  $B749,$02 Stash #REGbc and #REGhl on the stack.
  $B74B,$01 Exchange the #REGde and #REGhl registers.
  $B74C,$02 LDI.
  $B74E,$02 LDI.
  $B750,$02 LDI.
  $B752,$02 LDI.
  $B754,$02 LDI.
  $B756,$02 LDI.
  $B758,$01 Exchange the #REGde and #REGhl registers.
  $B759,$01 Restore #REGhl from the stack.
  $B75A,$03 Call #R$A8CC.
  $B75D,$01 Restore #REGbc from the stack.
  $B75E,$02 Decrease counter by one and loop back to #R$B749 until counter is zero.
  $B760,$01 Return.

c $B761
  $B761,$03 Call #R$A8AE.
  $B764,$01 #REGd=#REGb.
  $B765,$01 #REGe=#REGc.
  $B766,$02 #REGb=#N$18.
  $B768,$02 Stash #REGbc and #REGhl on the stack.
  $B76A,$01 Exchange the #REGde and #REGhl registers.
  $B76B,$02 LDI.
  $B76D,$02 LDI.
  $B76F,$02 LDI.
  $B771,$01 Exchange the #REGde and #REGhl registers.
  $B772,$01 Restore #REGhl from the stack.
  $B773,$03 Call #R$A8CC.
  $B776,$01 Restore #REGbc from the stack.
  $B777,$02 Decrease counter by one and loop back to #R$B768 until counter is zero.
  $B779,$01 Return.

c $B77A
  $B77A,$04 #REGde=*#R$9AC3.
  $B77E,$02 #REGb=#N$08.
  $B780,$05 Jump to #R$B79C if #REGd is less than #N$00.
  $B785,$04 Jump to #R$B79C if #REGd is greater than or equal to #N$18.
  $B789,$03 Stash #REGbc, #REGde and #REGde on the stack.
  $B78C,$01 #REGa=#REGe.
  $B78D,$01 Exchange the #REGaf register with the shadow #REGaf register.
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

c $B83D
  $B83D,$03 #REGde=#R$C724.
  $B840,$03 Call #R$B8F5.
  $B843,$03 #REGde=#R$C784.
  $B846,$03 Call #R$B8F5.
  $B849,$03 #REGde=#R$C7E4.
  $B84C,$03 Call #R$B8F5.
  $B84F,$03 #REGde=#R$C7E4.
  $B852,$03 Call #R$B8F5.
  $B855,$03 #REGde=#R$C784.
  $B858,$03 Call #R$B8F5.
  $B85B,$03 #REGde=#R$C724.
  $B85E,$03 Call #R$B8F5.
  $B861,$02 #REGb=#N$0A.
  $B863,$03 #REGhl=#N$4810 (screen buffer location).
  $B866,$02 Stash #REGbc and #REGhl on the stack.
  $B868,$03 Call #R$B965.
  $B86B,$02 Restore #REGhl and #REGbc from the stack.
  $B86D,$01 Decrease #REGl by one.
  $B86E,$02 Decrease counter by one and loop back to #R$B866 until counter is zero.
  $B870,$01 Return.

c $B871
  $B871,$05 Write #N$ED to *#R$B8EA.
  $B876,$05 Write #N$A0 to *#R$B8EB.
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
  $B8AA,$01 #REGa=#N$00.
  $B8AB,$03 Write #REGa to *#R$B8EA.
  $B8AE,$03 Write #REGa to *#R$B8EB.
  $B8B1,$03 #REGde=#R$C934.
  $B8B4,$03 Call #R$B8D6.
  $B8B7,$03 #REGde=#R$C994.
  $B8BA,$03 Call #R$B8D6.
  $B8BD,$03 #REGde=#R$C9F4.
  $B8C0,$03 Call #R$B8D6.
  $B8C3,$03 #REGde=#R$C9F4.
  $B8C6,$03 Call #R$B8D6.
  $B8C9,$03 #REGde=#R$C994.
  $B8CC,$03 Call #R$B8D6.
  $B8CF,$03 #REGde=#R$C934.
  $B8D2,$03 Call #R$B8D6.
  $B8D5,$01 Return.

c $B8D6
  $B8D6,$03 #REGhl=#N$48A9 (screen buffer location).
  $B8D9,$01 Halt operation (suspend CPU until the next interrupt).
  $B8DA,$01 Halt operation (suspend CPU until the next interrupt).
  $B8DB,$01 Halt operation (suspend CPU until the next interrupt).
  $B8DC,$01 Halt operation (suspend CPU until the next interrupt).
  $B8DD,$02 #REGb=#N$18.
  $B8DF,$02 Stash #REGbc and #REGhl on the stack.
  $B8E1,$01 Exchange the #REGde and #REGhl registers.
  $B8E2,$02 LDI.
  $B8E4,$02 LDI.
  $B8E6,$02 LDI.
  $B8E8,$02 LDI.
  $B8EA,$01 No operation.
  $B8EB,$01 No operation.
  $B8EC,$01 Exchange the #REGde and #REGhl registers.
  $B8ED,$01 Restore #REGhl from the stack.
  $B8EE,$03 Call #R$A8CC.
  $B8F1,$01 Restore #REGbc from the stack.
  $B8F2,$02 Decrease counter by one and loop back to #R$B8DF until counter is zero.
  $B8F4,$01 Return.

c $B8F5
  $B8F5,$01 Halt operation (suspend CPU until the next interrupt).
  $B8F6,$01 Halt operation (suspend CPU until the next interrupt).
  $B8F7,$01 Halt operation (suspend CPU until the next interrupt).
  $B8F8,$01 Halt operation (suspend CPU until the next interrupt).
  $B8F9,$02 #REGb=#N$20.
  $B8FB,$03 #REGhl=#N$40AE (screen buffer location).
  $B8FE,$02 Stash #REGbc and #REGhl on the stack.
  $B900,$01 Exchange the #REGde and #REGhl registers.
  $B901,$02 LDI.
  $B903,$02 LDI.
  $B905,$02 LDI.
  $B907,$01 Exchange the #REGde and #REGhl registers.
  $B908,$01 Restore #REGhl from the stack.
  $B909,$03 Call #R$A8CC.
  $B90C,$01 Restore #REGbc from the stack.
  $B90D,$02 Decrease counter by one and loop back to #R$B8FE until counter is zero.
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

c $B92F
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

c $B965
  $B965,$02 #REGb=#N$10.
  $B967,$03 #REGde=#R$CA54.
  $B96A,$01 #REGa=*#REGhl.
  $B96B,$01 Stash #REGaf on the stack.
  $B96C,$01 #REGa=*#REGde.
  $B96D,$01 Write #REGa to *#REGhl.
  $B96E,$03 Call #R$A8CC.
  $B971,$01 Increment #REGde by one.
  $B972,$02 Decrease counter by one and loop back to #R$B96A until counter is zero.
  $B974,$01 Halt operation (suspend CPU until the next interrupt).
  $B975,$01 Halt operation (suspend CPU until the next interrupt).
  $B976,$01 Halt operation (suspend CPU until the next interrupt).
  $B977,$03 Call #R$A8DB.
  $B97A,$02 #REGb=#N$10.
  $B97C,$01 Restore #REGaf from the stack.
  $B97D,$01 Write #REGa to *#REGhl.
  $B97E,$03 Call #R$A8DB.
  $B981,$02 Decrease counter by one and loop back to #R$B97C until counter is zero.
  $B983,$01 Return.

b $B984 Graphics: Jammy Jim

b $B985 Graphics: Beer Belly Bill

b $B986 Graphics: Del Boy Desmond

b $B987 Graphics: Mega Mick

b $B988 Graphics: Devious Dave

b $B989 Graphics: Sure Shot Sidney

b $B98A Graphics: Limp Wrist Larry

b $B98B Graphics: Tactical Tel

b $C404

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

b $C724

b $C784

b $C7E4

b $C934

b $C994

b $C9F4

c $CB1E
  $CB1E,$01 Stash #REGaf on the stack.
  $CB1F,$04 Write #N$00 to *#R$D009.
  $CB23,$01 Restore #REGaf from the stack.
  $CB24,$01 #REGc=#REGa.
  $CB25,$01 #REGa+=#REGa.
  $CB26,$01 #REGa+=#REGc.
  $CB27,$01 #REGa+=#REGa.
  $CB28,$01 #REGc=#REGa.
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

c $CBC8

b $D00A

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
  $F821

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
