#!/bin/bash



while read line
do

cd ../../tmp
message=$(cat message)
relay=$(cat relay)
privkey=$(cat privkey)
cd ../scripts/sendtext-dm

cd ../randomizer
./randomizer.sh
cd ../sendtext-dm

echo "==============================================================================	"
echo "     RELAY:	""$relay"" 							"
echo "     MESSAGE:	""$message""							"
echo "============================================================================== 	"
echo " "
timeout 2s nostr-tool -r "$relay" -p "$privkey" send-direct-message --receiver "$line" --message "$message"

done < ../../../config/pubkeys-list.txt


cd ../scripts/sendtext-dm