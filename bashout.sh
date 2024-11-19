#!/bin/bash


###################################################################
# Some files are excluded from git commits in the .gitignore file #
# Check this file and adjust accordingly if you plan to add new   #
# files or you want to commit the files that this script uses.    #
###################################################################

# Get the absolute path of the script, even if it's invoked via a symlink
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"

# Construct paths relative to the script's directory
SAVE_FILE="$SCRIPT_DIR/work/output.txt"
RESOURCE_DIR="$SCRIPT_DIR/resources"
DEBUG_LOG="$SCRIPT_DIR/debug.log"  # Define the debug log file

# Clear contents of the debug log, to prevent redundant entries with a new session.
echo "" > "$DEBUG_LOG"

# Create work directory and output file (if they don't exist)
touch "$SAVE_FILE" || { echo "Error: Cannot create $SAVE_FILE"; exit 1; }

echo "Choose a banner style:"
echo "1: Inspirational quote"
echo "2: Reminder"
echo "3: Style prompt"
read choice

case $choice in  # Corrected: Use $choice, not $style
	1) banner_file="$RESOURCE_DIR/quotes.txt" #Use absolute path
		;;

	2) read -p "Enter your reminder: " remind

       # Create reminder.txt if it doesn't exist (only for option 2)
       if [[ ! -f "$RESOURCE_DIR/reminder.txt" ]]; then  # -f checks for a regular file
           touch "$RESOURCE_DIR/reminder.txt" || { echo "Error creating $RESOURCE_DIR/reminder.txt"; exit 1; }
       fi

       echo "$remind" > "$RESOURCE_DIR/reminder.txt"
       banner_file="$RESOURCE_DIR/reminder.txt"
       ;;

    3) bash "$SCRIPT_DIR/styles.sh"  # Execute styles.sh
       echo "banner_file after styles.sh: $banner_file" >> "$DEBUG_LOG" # Redirect to log file
        banner_file="$RESOURCE_DIR/style.txt" #Use absolute path
		;;
esac

# Ensure banner_file is not empty before trying to read from it
if [[ -s "$banner_file" ]]; then
  BANNER=$(sort -R "$banner_file" | head -n 1)
else
  BANNER="No banner available."  # Or handle the empty file case differently
fi


# Initialize word counts (AFTER creating the file)
STARTING_WORD_COUNT=$(wc -w "$SAVE_FILE" | cut -f1 -d ' ')
SESSION_WORD_COUNT=0
TOTAL_WORD_COUNT=$STARTING_WORD_COUNT

# Function to update word counts
update_word_counts() {
    SENTENCE_WORD_COUNT=$(echo "$1" | wc -w)
    TOTAL_WORD_COUNT=$(wc -w "$SAVE_FILE" | cut -f1 -d ' ')
    SESSION_WORD_COUNT=$((TOTAL_WORD_COUNT - STARTING_WORD_COUNT))
}

trap 'exit' INT  # Terminate the script with Ctrl-C

while true; do
    clear

    # Display the banner (if it's set)
    if [[ -n "$BANNER" ]]; then  # Check if $BANNER is not empty
        printf "\e[94m%s\e[0m\n" "$BANNER"
    fi


    # Display the last sentence from the save file (if it's not empty)
    if [[ -s "$SAVE_FILE" ]]; then
        LAST_SENTENCE=$(tail -n 1 "$SAVE_FILE")
        echo "$LAST_SENTENCE"
    fi

    read -p "[$(printf "%d" $SESSION_WORD_COUNT)/$(printf "%d" $TOTAL_WORD_COUNT)]: " NEW_SENTENCE

    # Append new sentence (or blank line) to the save file
	echo "$NEW_SENTENCE" >> "$SAVE_FILE"

    update_word_counts "$NEW_SENTENCE"
done