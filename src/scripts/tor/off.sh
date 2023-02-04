#!/bin/bash
# Find all .txt files in the ./src/scripts/ directory and its subdirectories
for file in $(find ../ -type f -name "*.sh" ! -path "../tor/*"); do
  # Check if the first line of the file is "tor=torify"
  first_line=$(head -n 1 $file)
  if [ "$first_line" == "tor=torify" ]; then
    # Remove the first line of the file if it is "tor=torify"
    sed -i '1d' $file
  fi
done
