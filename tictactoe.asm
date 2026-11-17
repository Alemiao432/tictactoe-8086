; You may customize this and other start-up templates;
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

mov dx, offset lettera1
mov ah, 9
int 21h

mov dx, offset acapo
mov ah, 9
int 21h

mov dx, offset lettera2
mov ah, 9
int 21h

mov dx, offset acapo
mov ah, 9
int 21h

mov dx, offset lettera3
mov ah, 9
int 21h

mov dx, offset acapo
mov ah, 9
int 21h

mov dx, offset lettera4
mov ah, 9
int 21h

mov dx, offset acapo
mov ah, 9
int 21h

mov dx, offset lettera5
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 8                   ; Row 8 (Y)
mov dl, 11                  ; Column 11 (X)
int 10h

mov dx, offset chi
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 10                  ; Row 10 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov dx, offset start
mov ah, 9
int 21h

nonstart1:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 17                  ; Column 17 (X)
int 10h

mov ah, 1
int 21h

cmp al, 'p'
jne nonstart1

nonstart2:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 18                  ; Column 18 (X)
int 10h

mov ah, 1
int 21h

cmp al, 'l'
jne nonstart2

nonstart3:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 19                  ; Column 19 (X)
int 10h

mov ah, 1
int 21h

cmp al, 'a'
jne nonstart3

nonstart4:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 20                  ; Column 20 (X)
int 10h

mov ah, 1
int 21h

cmp al, 'y'
jne nonstart4

; Function to clear the screen
mov ah, 06h                 ; Scroll up function
mov al, 0                   ; Number of lines to scroll, 0 = whole screen
mov bh, 07h                 ; Attribute: black background with white text
mov cx, 0000h               ; Top-left coordinate: row 0, column 0
mov dx, 184fh               ; Bottom-right coordinate: row 24, column 79
int 10h                     ; Video interrupt call

; Move the cursor back to the top-left corner
mov ah, 02h                 ; Cursor positioning function
mov bh, 0                   ; Page number 0
mov dh, 0                   ; Row 0
mov dl, 0                   ; Column 0
int 10h                     ; Video interrupt call

iniziocolonna:              ; BUILDING THE BOARD

mov dx, offset colonna      ; Print the column message
mov ah, 9
int 21h

inc [1300h]                 ; Increment memory [1300h] by 1

mov ah, 2                   ; Carriage return
mov dl, 0dh
int 21h

mov ah, 2                   ; Go to a new line
mov dl, 0ah
int 21h

cmp [1300h], 3              ; Compare the content of memory [1300h] with 3
jb iniziocolonna            ; Jump to iniziocolonna if 3 is greater than the content of memory [600h]

inc [1302h]                 ; Increment memory [1302h] by 1

cmp [1302h], 3              ; Compare the content of memory [1302h] with 3
je finetabella              ; Jump to finetabella if they are equal

mov dx, offset riga         ; Print the row message
mov ah, 9
int 21h
                            ; Carriage return
mov ah, 2
mov dl, 0dh
int 21h

mov ah, 2                   ; Go to a new line
mov dl, 0ah
int 21h

mov [1300h], 0              ; Move 0 into memory [1300h]

inc [1310h]                 ; Increment memory [1310h] by 1

cmp [1301h], 3              ; Compare the content of memory [1301h] with 3
jb iniziocolonna            ; Jump to iniziocolonna if 3 is greater than the content of memory [1301h]

; INSERTING THE NUMBERS THAT IDENTIFY THE CELLS
finetabella:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 0                   ; Row 0 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset num1         ; Print the num1 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 0                   ; Row 0 (Y)
mov dl, 6                   ; Column 6 (X)
int 10h

mov dx, offset num2         ; Print the num2 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 0                   ; Row 0 (Y)
mov dl, 12                  ; Column 12 (X)
int 10h

mov dx, offset num3         ; Print the num3 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 4                   ; Row 4 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset num4         ; Print the num4 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 4                   ; Row 4 (Y)
mov dl, 6                   ; Column 6 (X)
int 10h

mov dx, offset num5         ; Print the num5 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 4                   ; Row 4 (Y)
mov dl, 12                  ; Column 12 (X)
int 10h

mov dx, offset num6         ; Print the num6 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 8                   ; Row 8 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset num7         ; Print the num7 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 8                   ; Row 8 (Y)
mov dl, 6                   ; Column 6 (X)
int 10h

mov dx, offset num8         ; Print the num8 message at the coordinates set above
mov ah, 9
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 8                   ; Row 8 (Y)
mov dl, 12                  ; Column 12 (X)
int 10h

mov dx, offset num9         ; Print the num9 message at the coordinates set above
mov ah, 9
int 21h

; LET THE PLAYERS CHOOSE WHO STARTS
giocatore:
mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 11                  ; Row 11 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset scegligiocatore
mov ah, 9
int 21h

mov ah, 1
int 21h

cmp al, "1"
je xcontinua

cmp al, "2"
je ocontinua

jmp giocatore

; THE GAME STARTS
xcontinua:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 11                  ; Row 11 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset player1      ; Print the player1 message
mov ah, 9
int 21h

mov ah, 1                   ; Wait for user input
int 21h

cmp al, 31h                 ; Compare the input just given with 31h
je xprimo                   ; Jump to xprimo if they are equal

cmp al, 32h                 ; Compare the input just given with 32h
je xsecondo                 ; Jump to xsecondo if they are equal

cmp al, 33h                 ; Compare the input just given with 33h
je xterzo                   ; Jump to xterzo if they are equal

cmp al, 34h                 ; Compare the input just given with 34h
je xquarto                  ; Jump to xquarto if they are equal

cmp al, 35h                 ; Compare the input just given with 35h
je xquinto                  ; Jump to xquinto if they are equal

cmp al, 36h                 ; Compare the input just given with 36h
je xsesto                   ; Jump to xsesto if they are equal

cmp al, 37h                 ; Compare the input just given with 37h
je xsettimo                 ; Jump to xsettimo if they are equal

cmp al, 38h                 ; Compare the input just given with 38h
je xottavo                  ; Jump to xottavo if they are equal

cmp al, 39h                 ; Compare the input just given with 39h
je xnono                    ; Jump to xnono if they are equal

jmp xrinserisci

xprimo:

cmp [1351h], 0              ; Compare the content of memory [1351h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1351h] is greater than 0

mov [1351h], 1              ; Move 1 into memory [1351h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 1                   ; Row 1 (Y)
mov dl, 2                   ; Column 2 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xsecondo:

cmp [1352h], 0              ; Compare the content of memory [1352h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1352h] is greater than 0

mov [1352h], 1              ; Move 1 into memory [1352h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 1                   ; Row 1 (Y)
mov dl, 8                   ; Column 8 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xterzo:

cmp [1353h], 0              ; Compare the content of memory [1353h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1353h] is greater than 0

mov [1353h], 1              ; Move 1 into memory [1353h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 1                   ; Row 1 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xquarto:

cmp [1354h], 0              ; Compare the content of memory [1354h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1354h] is greater than 0

mov [1354h], 1              ; Move 1 into memory [1354h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 5                   ; Row 5 (Y)
mov dl, 2                   ; Column 2 (X)
int 10h
                            ; Print x at the coordinates set above
mov ah, 2
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xquinto:

cmp [1355h], 0              ; Compare the content of memory [1355h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1355h] is greater than 0

mov [1355h], 1              ; Move 1 into memory [1355h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 5                   ; Row 5 (Y)
mov dl, 8                   ; Column 8 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xsesto:

cmp [1356h], 0              ; Compare the content of memory [1356h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1356h] is greater than 0

mov [1356h], 1              ; Move 1 into memory [1356h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 5                   ; Row 5 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xsettimo:

cmp [1357h], 0              ; Compare the content of memory [1357h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1357h] is greater than 0

mov [1357h], 1              ; Move 1 into memory [1357h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 9                   ; Row 9 (Y)
mov dl, 2                   ; Column 2 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xottavo:

cmp [1358h], 0              ; Compare the content of memory [1358h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1358h] is greater than 0

mov [1358h], 1              ; Move 1 into memory [1358h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 9                   ; Row 9 (Y)
mov dl, 8                   ; Column 8 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

xnono:

cmp [1359h], 0              ; Compare the content of memory [1359h] with 0
ja xrinserisci              ; Jump to xrinserisci if the content of memory [1359h] is greater than 0

mov [1359h], 1              ; Move 1 into memory [1359h]

inc [1400h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 9                   ; Row 9 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov ah, 2                   ; Print x at the coordinates set above
mov dl, 'x'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp finex                   ; Jump to finex

finex:

; CHECK X ROW 1
mov cx, [1351h]
mov [1800h], cx
mov cx, [1352h]
add [1800h], cx
mov cx, [1353h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X ROW 2
mov cx, [1354h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1356h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X ROW 3
mov cx, [1357h]
mov [1800h], cx
mov cx, [1358h]
add [1800h], cx
mov cx, [1359h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X COLUMN 1
mov cx, [1351h]
mov [1800h], cx
mov cx, [1354h]
add [1800h], cx
mov cx, [1357h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X COLUMN 2
mov cx, [1352h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1358h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X COLUMN 3
mov cx, [1353h]
mov [1800h], cx
mov cx, [1356h]
add [1800h], bx
mov cx, [1359h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X DIAGONAL 1
mov cx, [1351h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1359h]
add [1800h], cx
cmp [1800h], 3
je vintox

; CHECK X DIAGONAL 2
mov cx, [1353h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1357h]
add [1800h], cx
cmp [1800h], 3
je vintox

cmp [1400h], 5              ; Compare the content of memory [1400h] with 5
je finalissima              ; Jump to finalissima if they are equal

ocontinua:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 11                  ; Row 11 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset player2      ; Print the player2 message
mov ah, 9
int 21h

mov ah, 1                   ; Wait for user input
int 21h

cmp al, 31h                 ; Compare the input just given with 31h
je oprimo                   ; Jump to oprimo if they are equal

cmp al, 32h                 ; Compare the input just given with 32h
je osecondo                 ; Jump to osecondo if they are equal

cmp al, 33h                 ; Compare the input just given with 33h
je oterzo                   ; Jump to oterzo if they are equal

cmp al, 34h                 ; Compare the input just given with 34h
je oquarto                  ; Jump to oquarto if they are equal

cmp al, 35h                 ; Compare the input just given with 35h
je oquinto                  ; Jump to oquinto if they are equal

cmp al, 36h                 ; Compare the input just given with 36h
je osesto                   ; Jump to osesto if they are equal

cmp al, 37h                 ; Compare the input just given with 37h
je osettimo                 ; Jump to osettimo if they are equal

cmp al, 38h                 ; Compare the input just given with 38h
je oottavo                  ; Jump to oottavo if they are equal

cmp al, 39h                 ; Compare the input just given with 39h
je onono                    ; Jump to onono if they are equal

jmp orinserisci

oprimo:

cmp [1351h], 0              ; Compare the content of memory [1351h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1351h] is greater than 0

mov [1351h], 4              ; Move 4 into memory [1351h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 1                   ; Row 1 (Y)
mov dl, 2                   ; Column 2 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

osecondo:

cmp [1352h], 0              ; Compare the content of memory [1352h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1352h] is greater than 0

mov [1352h], 4              ; Move 4 into memory [1352h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 1                   ; Row 1 (Y)
mov dl, 8                   ; Column 8 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

oterzo:

cmp [1353h], 0              ; Compare the content of memory [1353h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1353h] is greater than 0

mov [1353h], 4              ; Move 4 into memory [1353h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 1                   ; Row 1 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

oquarto:

cmp [1354h], 0              ; Compare the content of memory [1354h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1354h] is greater than 0

mov [1354h], 4              ; Move 4 into memory [1354h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 5                   ; Row 5 (Y)
mov dl, 2                   ; Column 2 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

oquinto:

cmp [1355h], 0              ; Compare the content of memory [1355h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1355h] is greater than 0

mov [1355h], 4              ; Move 4 into memory [1355h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 5                   ; Row 5 (Y)
mov dl, 8                   ; Column 8 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

osesto:

cmp [1356h], 0              ; Compare the content of memory [1356h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1356h] is greater than 0

mov [1356h], 4              ; Move 4 into memory [1356h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 5                   ; Row 5 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

osettimo:

cmp [1357h], 0              ; Compare the content of memory [1357h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1357h] is greater than 0

mov [1357h], 4              ; Move 4 into memory [1357h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 9                   ; Row 9 (Y)
mov dl, 2                   ; Column 2 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

oottavo:

cmp [1358h], 0              ; Compare the content of memory [1358h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1358h] is greater than 0

mov [1358h], 4              ; Move 4 into memory [1358h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 9                   ; Row 9 (Y)
mov dl, 8                   ; Column 8 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

onono:

cmp [1359h], 0              ; Compare the content of memory [1359h] with 0
ja orinserisci              ; Jump to orinserisci if the content of memory [1359h] is greater than 0

mov [1359h], 4              ; Move 4 into memory [1359h]

inc [1401h]

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 9                   ; Row 9 (Y)
mov dl, 14                  ; Column 14 (X)
int 10h

mov ah, 2                   ; Print o at the coordinates set above
mov dl, 'o'
int 21h

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset levascritta1 ; Erase the "already taken" text
mov ah, 9
int 21h

jmp fineo                   ; Jump to fineo

fineo:

; CHECK O ROW 1
mov cx, [1351h]
mov [1800h], cx
mov cx, [1352h]
add [1800h], cx
mov cx, [1353h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O ROW 2
mov cx, [1354h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1356h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O ROW 3
mov cx, [1357h]
mov [1800h], cx
mov cx, [1358h]
add [1800h], cx
mov cx, [1359h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O COLUMN 1
mov cx, [1351h]
mov [1800h], cx
mov cx, [1354h]
add [1800h], cx
mov cx, [1357h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O COLUMN 2
mov cx, [1352h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1358h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O COLUMN 3
mov cx, [1353h]
mov [1800h], cx
mov cx, [1356h]
add [1800h], cx
mov cx, [1359h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O DIAGONAL 1
mov cx, [1351h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1359h]
add [1800h], cx
cmp [1800h], 12
je vintoo

; CHECK O DIAGONAL 2
mov cx, [1353h]
mov [1800h], cx
mov cx, [1355h]
add [1800h], cx
mov cx, [1357h]
add [1800h], cx
cmp [1800h], 12
je vintoo

cmp [1401h], 5              ; Compare the content of memory [1401h] with 5
je finalissima              ; Jump to finalissima if they are equal

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 11                  ; Row 11 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

jmp xcontinua               ; Jump to xcontinua

xrinserisci:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset rinserisci   ; Print the rinserisci message at the coordinates set above
mov ah, 9
int 21h

jmp xcontinua               ; Jump to xcontinua

orinserisci:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 12                  ; Row 12 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset rinserisci   ; Print the rinserisci message at the coordinates set above
mov ah, 9
int 21h

jmp ocontinua               ; Jump to ocontinua

finalissima:
mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 14                  ; Row 14 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset pareggio
mov ah, 9
int 21h

jmp hofinito

vintox:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 14                  ; Row 14 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset vittox
mov ah, 9
int 21h

jmp hofinito

vintoo:

mov ah, 02h                 ; Function 02h - Set cursor position
mov dh, 14                  ; Row 14 (Y)
mov dl, 0                   ; Column 0 (X)
int 10h

mov dx, offset vittoo
mov ah, 9
int 21h

hofinito:

ret

colonna db 1fh, 1fh, 1fh, 1fh, 1fh, 0B3h, 1fh, 1fh, 1fh, 1fh, 1fh, 0B3h, "$"
riga db 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C5h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C5h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, "$"
num1 db "1 $"
num2 db "2 $"
num3 db "3 $"
num4 db "4 $"
num5 db "5 $"
num6 db "6 $"
num7 db "7 $"
num8 db "8 $"
num9 db "9 $"
player1 db "player 1, enter a number from 1 to 9: $ "
player2 db "player 2, enter a number from 1 to 9: $ "
rinserisci db "cell already taken or does not exist $ "
vittox db "player 1 (x) wins $"
vittoo db "player 2 (o) wins $"
pareggio db "it's a draw, well played both $"
levascritta1 db 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, "$"
acapo db 0ah, 0dh, "$"
start db "write play $"
chi db "player vs player $"
scegligiocatore db "who starts, player 1 or 2 $"
lettera1 db 0dbh, 0dbh, 0dbh,1fh, 0dbh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 1fh, 0dbh, 0dbh, 0dbh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 1fh, 0dbh, 0dbh, 0dbh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 0dbh, 0dbh, "$"
lettera2 db 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 0dbh, "$"
lettera3 db 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 0dbh, 0dbh, 0dbh, 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh,  0dbh, 1fh, 0dbh, 0dbh, "$"
lettera4 db 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh,  0dbh, 1fh, 0dbh, "$"
lettera5 db 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 1fh, 1fh, 0dbh, 1fh, 1fh, 1fh, 0dbh, 0dbh, 1fh, 1fh, 1fh, 0dbh, 0dbh, "$"
