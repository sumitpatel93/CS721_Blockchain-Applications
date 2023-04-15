#!/bin/bash

# Set the directory where the .sol files are located
DIRECTORY="/Users/apple/Documents/WORK/CS721_Blockchain-Applications/sol"

# Create the solhint directory if it doesn't exist
mkdir -p "$DIRECTORY/solhint"

# Loop through all the .sol files in the directory
for FILE in "$DIRECTORY"/*.sol; do
    # Run the solhint command with the -f tap option and save the output to a file with the same name as the input file
    solhint "$FILE" -f tap > "$DIRECTORY/solhint/$(basename "$FILE" .sol).txt"
done
