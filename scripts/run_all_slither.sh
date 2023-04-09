#!/bin/bash

for file in *.sol
do
    bash run_slither.sh "$file"
done
