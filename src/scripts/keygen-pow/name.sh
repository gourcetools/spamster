#!/bin/bash

# copy all files from pubkeys to names
rm -f ../../keys/names/*
cp ../../../config/names-list.txt ./names.txt
cp ../../keys/pubkeys/* ../../keys/names

# replace the content of each file in names with a line from names.txt
cd ../../keys/names/
for file in *
do
  sed -i "1s/.*/$(head -n 1 ../../scripts/keygen/names.txt)/" $file
  sed -i "1d" ../../scripts/keygen/names.txt
done
cd ../../scripts/keygen-pow
rm -f ./names.txt