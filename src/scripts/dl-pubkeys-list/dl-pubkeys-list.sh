rm -f pubkeys-list.txt
echo " === Downloading pubkeys from wellordered.net === "
echo " == if this fail you may have do modify line 5 of "
echo " spamster/src/scripts/dl-pubkeys-list/dl-pubkeys-list.sh  for another relay. =="
echo '["REQ", "RAND", {"kinds": [4], "limit": 10000}]' |   nostcat wss://nostr-pub.wellorder.net	 |   jq '.[2].pubkey' > ../../tmp/pubkeys.txt
awk '!seen[$0]++' ../../tmp/pubkeys.txt > ../../tmp/pubkeys-list-tmp.txt
awk '{print substr($0,2,length()-2);}' ../../tmp/pubkeys-list-tmp.txt > ../../../config/pubkeys-list.txt
rm -f ../../tmp/pubkeys-list-tmp.txt
rm -f ../../tmp/pubkeys.txt