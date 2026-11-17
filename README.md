## 🇬🇧 English Description & Setup

# Tic-Tac-Toe in 8086 Assembly

A two-player Tic-Tac-Toe (Tris) game written in **x86 8086 assembly language**, designed to run with the [emu8086](https://emu8086.com/) emulator. It runs in real mode on a `.COM` program model (`org 100h`) and uses classic BIOS/DOS interrupts (`int 10h`, `int 21h`) for all input and output.

## What it is

A complete player-vs-player Tic-Tac-Toe game on a classic 3x3 board displayed in a text-mode console:

- An ASCII-art title screen ("XOX") with a "write play" prompt
- A 3x3 grid drawn with box-drawing characters, with cells numbered 1-9
- Player 1 plays `x`, Player 2 plays `o`
- Win detection on all 8 lines (3 rows, 3 columns, 2 diagonals)
- Draw detection when the board is full
- Invalid moves (already-taken or non-existent cells) are rejected and must be re-entered

## How it works

### Program flow

1. **Title screen** — the game prints 5 rows of box-drawing characters that spell out "XOX", then the caption `player vs player` and `write play`. It then loops, reading one character at a time, until the user types the word `play`.
2. **Screen clear** — BIOS video interrupt `10h` with function `06h` (scroll up window) wipes the screen, and function `02h` puts the cursor back at the top-left corner.
3. **Board drawing** — a nested loop (controlled by counters in memory at `1300h`, `1302h`, etc.) prints the vertical (`0B3h`) and horizontal (`0C4h`, `0C5h`) line segments to build the grid, then prints the cell numbers `1` to `9` at fixed cursor positions.
4. **Who starts** — the game asks `who starts, player 1 or 2` and jumps to either the X or the O input routine.
5. **Turn loop**
   - Player 1 (X) is prompted to enter a number from 1 to 9. A chain of `cmp`/`je` dispatches to one of nine routines (`xprimo` … `xnono`).
   - Each routine checks the corresponding memory cell (`1351h`–`1359h`): if it is non-zero the cell is already taken and the player is sent back to re-enter; otherwise the cell is marked with `1` (for X) or `4` (for O), a move counter is incremented, and the symbol is printed at the cell's screen coordinates.
   - After each move, the win-check section sums the three cells of every row, column and diagonal into a scratch cell (`1800h`):
     - a sum of **3** means X has three cells in a line → X wins (`vintox`)
     - a sum of **12** (3 × 4) means O has three cells in a line → O wins (`vintoo`)
   - If 5 moves have been made (`1400h` = 5 for X, `1401h` = 5 for O) with no winner, the game declares a draw (`finalissima`).
   - Otherwise the cursor is repositioned and control jumps back to the other player's routine.

### Memory map

| Address                   | Purpose                                                      |
| :------------------------ | :----------------------------------------------------------- |
| `1300h`, `1302h`, `1310h` | Loop counters used while drawing the board                   |
| `1301h`                   | Row-loop counter (used in the board-drawing loop)            |
| `1351h`–`1359h`           | Board state: `0` = free, `1` = X, `4` = O (cells 1-9)        |
| `1400h`                   | Number of X moves played                                     |
| `1401h`                   | Number of O moves played                                     |
| `1800h`                   | Scratch cell holding the sum of three cells during win checks|

### Interrupts used

| Interrupt | Function | Purpose                                           |
| :-------- | :------- | :------------------------------------------------ |
| `int 10h` | `02h`    | Set cursor position (DH = row, DL = column)       |
| `int 10h` | `06h`    | Scroll up window (used to clear the whole screen) |
| `int 21h` | `01h`    | Read one character from keyboard (with echo)      |
| `int 21h` | `02h`    | Print one character in DL                         |
| `int 21h` | `09h`    | Print a `$`-terminated string at DS:DX            |

The values `1` and `4` stored for X and O were chosen so that a winning line sums to 3 for X and 12 for O — two different, unambiguous numbers.

## How to run it

### With emu8086 (easiest)

1. Download and install the [emu8086 emulator](https://emu8086.com/).
2. Open `tictactoe.asm` in the emulator (or paste the source into a new file).
3. Press **Emulate**, then **Run** (or **Single Step** to debug instruction by instruction).
4. Play!

### Gameplay

1. Type `play` on the title screen (the game checks the letters one at a time).
2. Choose who starts: press `1` or `2`.
3. On your turn, type the number of the cell you want to claim (1-9, laid out like a phone keypad on the grid).
4. First to line up three symbols wins; a full board with no line is a draw.
5. The game ends by returning from the program (`ret`).

## Notes and quirks

- All in-game messages (prompts, win/draw messages) are in **English**, same as the code comments.
- The code is intentionally repetitive (one routine per cell): it favors readability for learning over compactness.
- A couple of labels and a stray `add [1800h], bx` (instead of `cx`) in the X column-3 check exist in the original source; the logic still works because `bx` is effectively 0 in this program, but cleaning it up would be a good exercise.

## License

MIT — feel free to learn from it, remix it, and improve it.

---

## 🇮🇹 Descrizione e Configurazione in Italiano

# Tris in Assembly 8086 (versione italiana)

Un gioco del Tris a due giocatori scritto in **linguaggio assembly x86 8086**, pensato per girare con l'emulatore [emu8086](https://emu8086.com/). Il programma usa il modello `.COM` in real mode (`org 100h`) e le classiche interrupt BIOS/DOS (`int 10h`, `int 21h`) per tutto l'input e l'output.

## Cos'è

Un gioco completo del Tris (giocatore contro giocatore) su una classica griglia 3x3 mostrata in console a modalità testo:

- Una schermata iniziale in ASCII art ("XOX") con il messaggio `write play`
- Una griglia 3x3 disegnata con i caratteri di line-drawing, con le celle numerate da 1 a 9
- Il giocatore 1 gioca con `x`, il giocatore 2 con `o`
- Controllo della vittoria su tutte le 8 linee (3 righe, 3 colonne, 2 diagonali)
- Controllo del pareggio quando la griglia si riempie
- Le mosse non valide (cella già occupata o inesistente) vengono rifiutate e bisogna reinserire

## Come funziona

### Flusso del programma

1. **Schermata iniziale** — il programma stampa 5 righe di caratteri che compongono la scritta "XOX", poi la didascalia `player vs player` e `write play`. Poi cicla leggendo un carattere alla volta finché l'utente non scrive la parola `play`.
2. **Pulizia dello schermo** — l'interrupt video BIOS `10h` con funzione `06h` (scroll della finestra) cancella tutto lo schermo, e la funzione `02h` riporta il cursore in alto a sinistra.
3. **Disegno della griglia** — un ciclo annidato (controllato dai contatori in memoria a `1300h`, `1302h`, ecc.) stampa i segmenti verticali (`0B3h`) e orizzontali (`0C4h`, `0C5h`) per costruire la griglia, poi stampa i numeri delle celle da `1` a `9` a posizioni fisse del cursore.
4. **Scelta di chi inizia** — il gioco chiede `who starts, player 1 or 2` e salta alla routine di input della X o della O.
5. **Ciclo di gioco**
   - Al giocatore 1 (X) viene chiesto di inserire un numero da 1 a 9. Una catena di `cmp`/`je` instrada verso una delle nove routine (`xprimo` … `xnono`).
   - Ogni routine controlla la cella di memoria corrispondente (`1351h`–`1359h`): se è diversa da zero la cella è già occupata e il giocatore deve reinserire; altrimenti la cella viene marcata con `1` (per la X) o `4` (per la O), il contatore delle mosse viene incrementato e il simbolo viene stampato alle coordinate a schermo della cella.
   - Dopo ogni mossa, la sezione di controllo vittoria somma le tre celle di ogni riga, colonna e diagonale in una cella di lavoro (`1800h`):
     - una somma di **3** significa che la X ha tre celle in fila → vince la X (`vintox`)
     - una somma di **12** (3 × 4) significa che la O ha tre celle in fila → vince la O (`vintoo`)
   - Se sono state fatte 5 mosse (`1400h` = 5 per la X, `1401h` = 5 per la O) senza vincitore, il gioco dichiara il pareggio (`finalissima`).
   - Altrimenti il cursore viene riposizionato e il controllo salta alla routine dell'altro giocatore.

### Mappa della memoria

| Indirizzo                 | Uso                                                                     |
| :------------------------ | :---------------------------------------------------------------------- |
| `1300h`, `1302h`, `1310h` | Contatori di ciclo usati per disegnare la griglia                       |
| `1301h`                   | Contatore del ciclo di riga (usato nel disegno della griglia)           |
| `1351h`–`1359h`           | Stato della griglia: `0` = libera, `1` = X, `4` = O (celle 1-9)         |
| `1400h`                   | Numero di mosse giocate dalla X                                         |
| `1401h`                   | Numero di mosse giocate dalla O                                         |
| `1800h`                   | Cella di lavoro con la somma di tre celle durante i controlli vittoria  |

### Interrupt usati

| Interrupt | Funzione | Uso                                                             |
| :-------- | :------- | :-------------------------------------------------------------- |
| `int 10h` | `02h`    | Posizionare il cursore (DH = riga, DL = colonna)                |
| `int 10h` | `06h`    | Scroll della finestra (usato per cancellare tutto lo schermo)   |
| `int 21h` | `01h`    | Leggere un carattere da tastiera (con echo)                     |
| `int 21h` | `02h`    | Stampare un carattere da DL                                     |
| `int 21h` | `09h`    | Stampare una stringa terminata da `$` presente in DS:DX         |

I valori `1` e `4` memorizzati per X e O sono stati scelti così che una linea vincente sommi a 3 per la X e a 12 per la O — due numeri diversi e non ambigui.

## Come farlo funzionare

### Con emu8086 (più semplice)

1. Scarica e installa l'emulatore [emu8086](https://emu8086.com/).
2. Apri `tictactoe.asm` nell'emulatore (oppure incolla il sorgente in un file nuovo).
3. Premi **Emulate**, poi **Run** (oppure **Single Step** per eseguire istruzione per istruzione).
4. Gioca!

### Come si gioca

1. Scrivi `play` nella schermata iniziale (il gioco controlla le lettere una alla volta).
2. Scegli chi inizia: premi `1` o `2`.
3. Nel tuo turno, digita il numero della cella che vuoi occupare (1-9, disposti come un tastierino telefonico sulla griglia).
4. Il primo che allinea tre simboli vince; se la griglia si riempie senza allineamenti c'è pareggio.
5. Il gioco termina ritornando dal programma (`ret`).

## Note e particolarità

- Tutti i messaggi di gioco (richieste di input, messaggi di vittoria/pareggio) sono in **inglese**, come i commenti del codice.
- Il codice è volutamente ripetitivo (una routine per ogni cella): privilegia la leggibilità didattica rispetto alla compattezza.
- Nell'originale restano qualche etichetta e un `add [1800h], bx` (invece di `cx`) nel controllo della colonna 3 della X: la logica funziona comunque perché `bx` vale di fatto 0 in questo programma, ma ripulirlo sarebbe un buon esercizio.

## Licenza

MIT — sentiti libero di imparare da questo codice, rimixerlo e migliorarlo.
