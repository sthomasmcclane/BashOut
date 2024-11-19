#!/bin/bash

# Get the absolute path of the script, even if it's invoked via a symlink
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"

# Construct paths relative to the script's directory
RESOURCE_DIR="$SCRIPT_DIR/resources"
DEBUG_LOG="$SCRIPT_DIR/debug.log"  # Define the debug log file


# Define your lists
voicelist=("formal" "informal" "conversational" "professional" "academic" "playful" "sarcastic" "intimate" "detached")
tonelist=("light-hearted" "serious" "dark" "humorous" "whimsical" "melancholic" "uplifting" "suspenseful" "nostalgic")
tenselist=("past" "present" "future")
povlist=("first-person" "second-person" "third-person (limited)" "third-person (omniscient)")
pacelist=("fast" "slow" "steadily" "frenetically")


selectedvoice=${voicelist[$RANDOM % ${#voicelist[@]} ]}
selectedtone=${tonelist[$RANDOM % ${#tonelist[@]} ]}
selectedpace=${pacelist[$RANDOM % ${#pacelist[@]} ]}
selectedpov=${povlist[$RANDOM % ${#povlist[@]} ]}
selectedtense=${tenselist[$RANDOM % ${#tenselist[@]} ]}

# Print the selected items
echo "Create a $selectedtone, $selectedpace-paced story with a $selectedvoice voice in $selectedtense-tense from a $selectedpov point of view." > "$RESOURCE_DIR/style.txt" #Use absolute path
