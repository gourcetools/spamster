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

# Navigate and echo instructions 
cd ../../scripts/make-json-nip05
echo "== JSON FILE READY TO UPLOAD "
echo "== UPLOAD IT TO YOUR-WEBSITE.COM/.well.known/nostr.json "
echo "== THE JSON FILE is located at spamster/src/json/nostr.json "
