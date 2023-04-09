#!/bin/bash

# for file in *.sol
# do
#   python3 main.py 1 "$file" majority_unique >> output.csv
# done

#!/bin/bash

for file in *.sol
do
  output=$(python3 main.py 1 "$file" majority_unique)
  echo "$output" | tr ' ' ',' >> output.csv
done
