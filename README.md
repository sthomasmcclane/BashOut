# BashOut

A simple bash script to turn a terminal emulator into a distraction-free writing environment.

## Idea

I had a vision for a writing app that was super minimalist and not only allowed me to forge ahead with my writing, but forced me to.

I'd tried the panic-inducing writing tools like 'Write or Die' and 'Most Dangerous Writing App'. You know, the ones that delete your work if you pause long enough to scratch your nose!

They worked well enough, but not to create decent prose. MDWA got me my first NaNoWriMo success, and I deleted the utterly unusable manuscript the very next day.

My idea was an enviroment that separated you from your saved file (so editing wasn't an option) and showed nothing other than what you needed to move forward.

With that in mind, and a little help from ChatGPT, I created BashOut.

## Overview

BashOut is a bash script that turns your terminal emulator into a minimalist writing environment by:

* Setting the terminal window to the name of your manuscript.

* Clearing the terminal.

* Echoing you the last line you wrote.

* Showing session and word counts.

* Printing an affirmation or reminder, if you set one.

* Presenting a colon (`"`) prompt where you write.

And that's it. You get nothing more than you need to move forward with your manuscript.

## Configuration

To use BashOut (assuming you've got a local copy cloned/checkedout/copied/ that's in your $PATH)

. Ensure the `bashout.sh` file is executable (either through your file manager or CLI).

. Create a file that your work will be saved to.

. Open the `bashout.sh` in your favourite editor/IDE.

. Set an affirmation, should you want one, on line 4:
```
AFFIRM="Your Afffirmation Here"
```

. Set the path to the file you created in step 2 on line 7:
```
SAVE_FILE="/path/to/file.txt"
```

. If the title of your manuscript is not the first line in your file, you can manually set a title on line 8:
Otherwise leave this alone and the script will source the name of your manuscript for the terminal window title.
```
MANUSCRIPT_NAME=$(head -n 1 "$SAVE_FILE")
```


. If you want to change the colour of the wordcount/affirmation line, you can pick an ANSI colour to enter on line 16:
```
TEXT_COLOUR='\e[34m'
```

## Usage

. Run `sh bashout.sh` if you have the script somewhere that's sourced in your $PATH.
Otherwise run `sh /path/to/bashout.sh`

. Exit the script with _Ctrl + C_

. That's it.