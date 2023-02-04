#!/bin/bash
cd ../randomizer
./randomizer.sh
ls
cd ../../tmp
message=$(cat message)
relay=$(cat relay)
echo "==============================================================================	"
echo "     RELAY:	""$relay"" 							"
echo "     MESSAGE:	""$message""							"
echo "============================================================================== 	"
echo " "
nostril --envelope --sec "$PRIVKEY" --content "$message" | websocat wss://"$relay"
cd ../scripts/sendtext
