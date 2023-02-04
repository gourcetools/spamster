succes=0
failed=0
IP=$($tor wget -qO- http://ipecho.net/plain)
while true
do
privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
message=$(shuf -n 1 ../../../config/messages-list.txt)
relay=$(shuf -n 1 ../../../config/relays-list.txt)
clear
echo "		┌───────────────────────────────┐"
echo "		│ *SPAMSTER IS RUNNING*		 "
echo "		│ * IP: "$IP"     		 "
echo "		├───────────────────────────────┤"
echo "		│ Total send: "$succes"		 "
echo "		│ Total failed : "$failed"	 "
echo "		└───────────────────────────────┘"
echo "Relay: $relay"
echo "Message: $message"
$tor timeout 5s nostr-tool -p "$privkey" -r "$relay" text-note -c "$message" 
if [ $? -eq 124 ]
then
  failed=$(($failed+1))
  echo "❌ Failed."
else
  succes=$(($succes+1))
  echo "✅ Succes."
  fi	
done
