#!/bin/bash

cd json
rm -f nostr.json
cd ..
echo -ne "{"	
echo -ne '"names":'
echo -ne " {"	

echo -ne "{"						> ./json/nostr.json
echo -ne '"names":'					>> ./json/nostr.json
echo -ne " {"						>> ./json/nostr.json

cd pubkeys
for f in *.txt;
do 
	r=$(( $r + RANDOM % 2000));
	while [ $r -lt 1 ];
	do
		r=$(( $r + RANDOM % 2000 ));
	done

	#echo -ne " $r : $(cat $f), " > temp.txt

	printf  "\"$r\": " 				>> ../json/nostr.json

	cat $f >> temp.txt
	cat temp.txt
	cat temp.txt 					>> ../json/nostr.json
	echo -ne "," 					>> ../json/nostr.json
	rm temp.txt
done

truncate -s-1 ../json/nostr.json
echo -e "}"	
echo -e "}"	
echo -e "}"						>> ../json/nostr.json
echo -e "}"						>> ../json/nostr.json
cd ..

$shell