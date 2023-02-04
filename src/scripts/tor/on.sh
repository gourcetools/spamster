#!/bin/bash
# Find all .txt files in the ./src/scripts/ directory and its subdirectories
for file in $(find ../ -type f -name "*.sh" ! -path "../tor/*"); do
  # Add "tor=torify" at the beginning of each file
  sed -i '1i tor=torify' $file
done
