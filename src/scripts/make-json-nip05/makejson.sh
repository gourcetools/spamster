#!/bin/bash

cd ../../json
rm -f nostr.json

echo -ne "{"						> nostr.json
echo -ne '"names":'					>> nostr.json
echo -ne " {"						>> nostr.json

cd ../keys/pubkeys
for file in *.txt;
do 
	name=$(cat ../names/$file)
	privkey=$(cat ../privkeys/$file)
	pubkey=$(cat ../pubkeys/$file)
	echo $name $(cat $file)
	echo -ne " \"$name\" : \"$(cat $file)\"," >> ../../json/nostr.json
	nostril --kind 0 --envelope --sec "$privkey" --content "{\"name\": \"$name\", \"nip05\": \"$name@gourcetools.github.io\"}" | websocat wss://relay.nostr.ch
done

truncate -s-1 ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
cd ../../scripts











