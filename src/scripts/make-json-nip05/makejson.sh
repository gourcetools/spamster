#!/bin/bash
# keygen.sh
clear
echo " "
echo " "
echo "     \│/  ┌┬┐┌─┐┬┌─┌─┐  ┌┐┌┌─┐┌─┐┌┬┐┬─┐      ┬┌─┐┌─┐┌┐┌  \│/   ";
echo "  ──── ─  │││├─┤├┴┐├┤   ││││ │└─┐ │ ├┬┘      │└─┐│ ││││  ─ ────";
echo "     /│\  ┴ ┴┴ ┴┴ ┴└─┘  ┘└┘└─┘└─┘ ┴ ┴└─  o  └┘└─┘└─┘┘└┘  /│\   ";
echo " "
echo " "
sleep 1



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
	(
		flock -x 200
		echo -ne " \"$name\" : \"$(cat $file)\"," >> ../../json/nostr.json
	) 200>/tmp/nostr_json.lock & 
 	
 	echo "== Adding $name to json "
done
wait


truncate -s -1 ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
echo -e "}"						>> ../../json/nostr.json
## Finish writing nostr.json 



# Echo instructions 
echo " "
echo " "
echo "          \│/  ┌┬┐┌─┐┌┐┌┌─┐  ┬  \│/   "
echo "       ──── ─   │││ ││││├┤   │  ─ ────"
echo "          /│\  ─┴┘└─┘┘└┘└─┘  o  /│\   "
echo " "
echo " ✔️  nostr.json created succesfully. "
echo " 📡 You still have to upload it to YOUR-WEBSITE.COM/.well.known/nostr.json "
echo " 📁 The file is located at spamster/src/json/nostr.json "
echo " "
echo " "
sleep 1


cd ../../scripts/make-json-nip05




