#!/bin/bash
#keygen-pow.sh
mkdir -p ../../tmp					
mkdir -p ../../json				
mkdir -p ../../keys/pubkeys		
mkdir -p ../../keys/privkeys	 
mkdir -p ../../keys/names	 
rm -f ../../tmp/*		
rm -f ../../keys/pubkeys/*
rm -f ../../keys/privkeys/*
echo " ========================================= "
echo "Enter how many leading zeroes you want: "  
echo "example : 00000 "
read zeroes  
echo " ========================================= "
echo "Enter the time we will spend mining, per key"
echo "default is 20seconds for 00000 (5) leading zeroes: " 
echo "Keep in mind that benchmarking takes 5seconds and we cant skip it: "  
echo "example : 20s "
read timeout
## run command for each name
while read line
do
echo "== Generating pow-keypair starting with $zeroes for $line =="
# timeout 6s because rana bench for 5seconds and finding a 0000 key take less than a sec
timeout $timeout rana -v $zeroes > ../../tmp/rana.txt
sed -n 's/.*Nostr private key: //p' ../../tmp/rana.txt > ../../tmp/Priv.txt
sed -n 's/.*Found matching public key: //p' ../../tmp/rana.txt > ../../tmp/Pub.txt
rm -f ../../tmp/rana.txt
sed -i '1!d' ../../tmp/Priv.txt
sed -i '1!d' ../../tmp/Pub.txt
mv 		"../../tmp/Pub.txt" 		"../../keys/pubkeys/$line.txt"
mv 		"../../tmp/Priv.txt"		"../../keys/privkeys/$line.txt"
done < ../../../config/names-list.txt
cd ../../keys/pubkeys
sed -i 's/ //g' *.txt
cd ../../keys/privkeys
sed -i 's/ //g' *.txt
cat *.txt | sort -n > ../../../config/privkeys-list.txt
cd ../../scripts/keygen-pow
# copy all files from pubkeys to names
rm -f ../../keys/names/*
cp ../../../config/names-list.txt ./names.txt
cp ../../keys/pubkeys/* ../../keys/names
# replace the content of each file in names with a line from names.txt
cd ../../keys/names/
for file in *
do
  sed -i "1s/.*/$(head -n 1 ../../scripts/keygen-pow/names.txt)/" $file
  sed -i "1d" ../../scripts/keygen-pow/names.txt
done
cd ../../scripts/keygen-pow
rm -f ./names.txt
######