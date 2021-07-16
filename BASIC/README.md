### Basic Programs for the 6502 Badge

This is a small collection of arguably iconic BASIC games and demonstrations mostly from
the 70's and 80's. Now you have a convenient collection of several programs you
can run on your 6502 Badge and enjoy the 6502 goodness.

Some programs are very small and might be usable on the 2K RAM bare bones system. However,
most programs will probably require the "deluxe" version of the kit with 32K RAM.

### How to transfer these to the Badge and run them

Rather than enter these programs by hand, if you are using the Badge with
a terminal emulator, you can simply copy and paste them into the terminal
program as if you did enter them by hand. **HOWEVER** you need to have 
at least a 100msec delay 
a new line and a 10msec delay between characters since the Badge doesn't
have any hardware flow control. Most terminal programs have some way
of specifying this delay. Please see the instructions for your terminal
emulator for details on how to set this up. I have successfully done 
this on Windows using Putty and TeraTerm and on MacOS and Linux using minicom.

Once you have the program loaded you can save and later reload using the 
Badge-provided XMODEM facility. This is a much faster way to load files.
However, note that saving programs in this way stores the tokenized memory image
of the parsed text entry and will not be human readable like the original basic text.
I suggest saving XMODEM stored files with the file extension ".bbas" to indicate
"binary basic" and keep them separate from the original source as provided
in this repository.
