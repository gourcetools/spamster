#!/bin/bash



# Read the user input   
  
echo "Enter the domain where you will be hosting the nostr.json file: "  
echo "example : gourcetools.github.io"
read domain  

echo "Enter the relay where you will be broadcasting nip05 informations: "  
echo "example : relay.nostr.ch"
read relay  

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
	echo -ne " \"$name\" : \"$(cat $file)\"," >> ../../json/nostr.json
  echo "== Broadcasting NIP05 for $name =="
	nostril --kind 0 --envelope --sec "$privkey" --content "{\"name\": \"$name\", \"picture\":\"https://thiscatdoesnotexist.com/\", \"nip05\": \"$name@$domain\"}" | websocat wss://$relay
done
rm -f log.txt
truncate -s -1 ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
cd ../../scripts

  echo "== JSON FILE READY TO UPLOAD =="
  echo "== UPLOAD TO yourwebsite.com/.well.known/nostr.json =="
    echo "== JSON FILE is located at spamster/src/json/nostr.json =="













