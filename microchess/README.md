![Microchess](/docs/microchess-sml.png "Microchess")
### Playing Microchess

Hey! You can play chess on your 6502 Badge!

I did my best
to test this out and even had a bit of help from
Daryl Rictor, but there are many paths through the code. Let me know
if you run into any anomalies.

This version of Microchess is very close to the original written
by Peter Jennings in the 70's for the KIM-1. In fact it is based on that 
original source code with a few tweaks by others (including Daryl) and my own adaptiation 
for the 6502 badge. The UI for this version is a little strange to
those not familiar with the history of the KIM-1, so be sure and read
the original manual linked below to understand how to play (it is NOT obvious).
If that's TLDR; then I do have a brief explanation below along with some
important hints and caveats.

The original version of Microchess utilized the hexadecimal display of the
KIM-1, which was very limited. It did not display a full keyboard when run
standalone and one used a real chess board and moved the pieces for the
computer. Early days for sure...

This version still retains some of that UI, substituting keyboard letters for the
dedicated KIM-1 keys on the original.

To begin a game you first have to press "C" to reset the board.

You enter moves with 4 key presses indicating the row and column of the chessboard moves.
You enter the starting square and then the destination square for a total of 4 digits. 
You can see the result
of your entry in the 6 hexadecimal display at the bottom of the screen. If you
are statisfied with the coordinates of the move press return to enter it. ONLY
THEN will you see the actual piece move on the board. 

WARNING: AFAIK there is NO CHECK
for a valid move and NO UNDO. If you accidentally make an illegal move to an open location
you can simply do an additional move to the correct location - so long as you haven't
yet pressed P to invoke the computers move. THE BAD: if you accidentally move onto a
piece in error (including your own), it will essentially be captured and I've found no way to 
undo this mistake. So check carefully before you press return to enter the move.

There are a limited number of single letter commands:

0-6 ...... to enter row and column information<BR>
return .. enters your move<BR>
P ......... "play" tells the computer to make a move<BR>
C ......... "clears" the board and resets it for a new game<BR>
E ......... "exchanges" the white and black pieces (reverses the board)<BR>
Q ......... "quits" the game and returns to the system monitor<BR>

NOTE: A quirk of this implementation is that key input is and-ed with 0x4F
which means that some of the above key mappings have other equivalents. In
particular A serves the same function as Q and case doesn't matter either.

in the system monitor (not BASIC), upload the Microchess6502.bin file 
to the Badge using XMODEM. Then enter the command 400G to start the program.

If you are starting a new game press C to reset the board. Then either let the
computer play by pressing P or enter your 4 digit move and press enter.
The rest is up to you.

NOTE: if you quit a game in progress (perhaps by accident) and the Badge has not
been reset or restarted, you can restart your game
and begin where you left off. Just don't press the C command to reset the board
in order to keep your previous moves.

The overall history of Microchess is available from 
the original author:

http://www.benlo.com/microchess/

The Computer History Museum has a pdf of the original manual:

https://d1yx3ys82bpsa0.cloudfront.net/chess/microchessmanual.peter-jennings.062303071.pdf

### Uploading the binary to the Badge

To run microchess you need to transfer it onto the Badge. Using a terminal program
that supports xmodem (ExtraPutty, TerraTerm, etc.) do the following:

1. In the system monitor of the Badge enter command "400U" to upload the code
to address 0x400. The code expects to run from there and should be small enough
to even run on the 4K Badges (let me know).
2. In the terminal program invoke the xmodem send (app dependent). The transfer
should procede and end with a successful transfer.
3. Enter the system command "400G" to start the program.

### How to assemble the Badge

A preassembled binary is available in the repo. You can just load and run that
if you wish. If you want to make your own changes, simply download the BadgeOS
source code (http://sunrise-ev.com/photos/6502/BadgeOS.zip). It includes an
assembler/simulator. Use that to assemble the code and export a hex file. You then
need to convert this hex file into a binary with a program like hex2bin. This is
available on most platforms in some form. Here's one example for Windows:

http://sourceforge.net/projects/hex2bin

You can use the simulator to export a binary directly, but you need to specify the
exact location and size (or else you get a 65K image!). I find it easier to just
export the hex and convert it. YMMV...

### About this version

My intention to this port of microchess was to be as faithful to the original
KIM-1 UI so one could experience what that was like. So I only made some minor
changes to:

1. Hook the character input and output routines into the Badge's equivalent<BR>
2. Disable interrupts unless the program is asking for data input, so that the Badge's 
LED refresh wouldn't interfere with operation<BR>
4. Resolve some PAGE ZERO conflicts between the original source and the Badge's use of PAGE ZERO.
5. Added an ANSI screen refresh sequence so it just redraws the board in the same spot vs. infinite scrolling

You will still see the Badge's display flicker when entering data since IO causes an LED refresh
on the Badge. Also, I had to use some of PAGE ZERO that is used by EhBasic, so if you start
BASIC on the Badge, you'll trash those values. But it probably trashes microchess as well. So
you're no worse off.

### Future work...

I'm hoping for "extra credit" to evenually have the LED display of the badge mimic
the LED display of the KIM-1. That's still a small work-in-progress...

