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
done < ../../../config/channels-list.txt
cd ../scripts/spam-channel
