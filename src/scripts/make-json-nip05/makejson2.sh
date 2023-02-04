#!/bin/bash
# Read the user input   
echo "Enter the domain where you will be hosting the nostr.json file: "  
echo "example : gourcetools.github.io"
read domain  
mkdir -p ../../json
cd ../../json
rm -f nostr.json
echo "{" > nostr.json
echo '"names": {' >> nostr.json
cd ../keys/pubkeys
for file in *.txt;
do 
    name=$(<../names/$file)
    privkey=$(<../privkeys/$file)
    pubkey=$(<$file)
    relay=$(shuf -n 1 ../../../config/relays-list.txt)
    echo "\"$name\" : \"$pubkey\"," >> ../../json/nostr.json
    echo "== Broadcasting NIP05 for $name =="
    nostril --kind 0 --envelope --sec "$privkey" --content "{\"name\": \"$name\", \"picture\":\"https://nostr.build/i/5616.jpeg\", \"nip05\": \"$name@$domain\"}" | websocat $relay
done
truncate -s -1 ../../json/nostr.json
echo "}" >> ../../json/nostr.json
echo "}" >> ../../json/nostr.json
cd ../../scripts
echo "== JSON FILE READY TO UPLOAD =="
echo "== UPLOAD IT TO "$domain"/.well.known/nostr.json =="
echo "== JSON FILE is located at spamster/src/json/nostr.json =="
