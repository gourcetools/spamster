#!/bin/bash
cd tmp
message=$(cat message)
relay=$(cat relay)
privkey=$(cat privkey)

echo "==============================================================================	"
echo "     RELAY:	""$relay"" 							"
echo "     MESSAGE:	""$message""							"
echo "============================================================================== 	"
echo " "

nostr-tool -p "$privkey" -d 2 -r "$relay" text-note -c "$message"	
cd ..


$shell