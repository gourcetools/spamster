#!/bin/bash
# Read the user input   
echo "Enter the domain where you will be hosting the nostr.json file: "  
echo "example : gourcetools.github.io"
read domain  

# Create json directory
mkdir -p ../../json

# Delete potential old json
rm -f ../../json/nostr.json

##  Start writing nostr.json 
echo -ne "{"						> ../../json/nostr.json
echo -ne '"names":'					>> ../../json/nostr.json
echo -ne " {"						>> ../../json/nostr.json


cd ../../keys/pubkeys
for file in *.txt;
do 
	name=${file%.txt}
	privkey=$(cat ../privkeys/$file)
	pubkey=$(cat ../pubkeys/$file)
  	relay=$(shuf -n 1 ../../../config/relays-list.txt)
	(
		flock -x 200
		echo -ne " \"$name\" : \"$(cat $file)\"," >> ../../json/nostr.json
	) 200>/tmp/nostr_json.lock & 
 	
 	echo "== Broadcasting NIP05 for $name "
	timeout 5s nostril --kind 0 --envelope --sec "$privkey" --content "{\"name\":\"$name\",\" picture\":\"https://nostr.build/i/5616.jpeg\",\"nip05\":\"$name@$domain\"}" | websocat "$relay" &
done
wait


rm -f log.txt
truncate -s -1 ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
## Finish writing nostr.json 

# Navigate and echo instructions 
cd ../../scripts
echo "== JSON FILE READY TO UPLOAD "
echo "== UPLOAD IT TO "$domain"/.well.known/nostr.json "
echo "== JSON FILE is located at spamster/src/json/nostr.json "
