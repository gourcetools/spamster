while read line
do
cd ../../tmp
message=$(cat message)
relay=$(cat relay)
privkey=$(cat privkey)
cd ../scripts/spam-dm
cd ../randomizer
./randomizer.sh

cd ../spam-channel

echo "==============================================================================	"
echo "     RELAY:	""$relay"" 							"
echo "     MESSAGE:	""$message""							"
echo "============================================================================== 	"
echo " "
nostril --envelope --sec "$privkey" --kind 42 --tag e "$line" --content "$message" | websocat $relay
# nostril --envelope --kind 42 --tag e 25e5c82273a271cb1a840d0060391a0bf4965cafeb029d5ab55350b418953fbb --content "send from CLI using nostril" | websocat wss://relay.nostr.ch


done < ../../../config/channels-list.txt
cd ../scripts/spam-channel
