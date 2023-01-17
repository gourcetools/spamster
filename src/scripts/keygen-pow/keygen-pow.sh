#!/bin/bash
#keygen.sh
mkdir -p ../../tmp					
mkdir -p ../../json				
mkdir -p ../../keys/pubkeys		
mkdir -p ../../keys/privkeys	 
mkdir -p ../../keys/names	 



rm -f ../../tmp/*		
rm -f ../../keys/pubkeys/*
rm -f ../../keys/privkeys/*


## run command for each name
while read line
do

echo == Generating keypair for $line ==
# ===================================================================================== #
# timeout 6s because rana bench for 5seconds and finding a 0000 key take less than a sec
timeout 10s rana -v 0000 > ../../tmp/rana.txt

sed -n 's/.*Nostr private key: //p' ../../tmp/rana.txt > ../../tmp/Priv.txt
sed -n 's/.*Found matching public key: //p' ../../tmp/rana.txt > ../../tmp/Pub.txt

sed -i '1!d' ../../tmp/Priv.txt
sed -i '1!d' ../../tmp/Pub.txt

mv 		"../../tmp/Pub.txt" 		"../../keys/pubkeys/$line.txt"
mv 		"../../tmp/Priv.txt"		"../../keys/privkeys/$line.txt"
# ===================================================================================== #


done < ../../../config/names-list.txt


cd ../../keys/privkeys
cat *.txt | sort -n > ../../../config/privkeys-list.txt
cd ../../scripts/keygen-pow