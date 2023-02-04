while read line
do
cd ../../tmp
message=$(cat message)
relay=$(cat relay)
privkey=$(cat privkey)
cd ../scripts/spam-dm
cd ../randomizer
./randomizer.sh
cd ../spam-dm
echo " ======================================================================	"
timeout 2s nostr-tool -r "$relay" -p "$privkey" send-direct-message --receiver "$line" --message "$message"
done < ../../../config/pubkeys-list.txt
cd ../scripts/spam-dm
