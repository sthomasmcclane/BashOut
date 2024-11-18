#! /bin/bash

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
echo "Create a $selectedtone, $selectedpace-paced story in a $selectedvoice voice in $selectedtense-tense $selectedpov point-of-view." > ./style.txt
