#!/bin/bash

# Create the smartcheck folder if it doesn't exist
mkdir -p smartcheck

# Loop through all .sol files in the directory
for file in *.sol
do
    # Run the smartcheck command for the file and save the output in the smartcheck folder
    smartcheck -p "/home/apple/CS721_Blockchain-Applications/sol/$file" > "smartcheck/${file%.*}.txt"
done
