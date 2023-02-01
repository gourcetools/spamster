#!/bin/bash
cd ../../tmp
message=$(cat message)
relay=$(cat relay)
privkey=$(cat privkey)

echo "==============================================================================	"
echo "     RELAY:	""$relay"" 							"
echo "     MESSAGE:	""$message""							"
echo "============================================================================== 	"
echo " "

timeout 3s nostr-tool -p "$privkey" -d 2 -r "$relay" text-note -c "$message"	

cd ../scripts/send-kind1-public
