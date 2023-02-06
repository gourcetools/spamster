success=0
failed=0
timedout=0
noreply=0
total=1

IP=$(wget -qO- http://ipecho.net/plain)
USETOR=$(cat USETOR)
COUNT=$(cat COUNT.sh)
TIMEOUT=$(cat ../../../config/TIMEOUT)
POW=$(cat ../../../config/POW-EVENTS)
NUMBER=$(cat NUMBER)
PORT=$(cat PORT)


# IF 1 
if [ "$USETOR" == "yes" ]
  then
    echo " == You asked me to use tor, let me start it first..."
    source ./START-TOR.sh
       # Tor loop
	while true
	do
		privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
		message=$(shuf -n 1 ../../../config/messages-list.txt)
		relay=$(shuf -n 1 ../../../config/relays-list.txt)
		countrelayslist=$(wc -l < ../../../config/relays-list.txt)
		echo " "
		echo " "
		echo " "
		clear
		echo "============================================================================================"
		echo "=== 🤖 SPAMSTER N°"$NUMBER" IS RUNNING | RELAYS: "$countrelayslist" "
		echo "=== 🧅 TOR-IP: "$IP" ON PORT:$PORT "
		echo "=== 📨 TOTAL SEND :"$total" | ✅ OK FOR SURE::"$success" | ❓ NO REPLY (MAYBE OK) :"$noreply" | ❌ FAILED FOR SURE:"$failed" | ⏰ TIMED-OUT:"$timedout"" 
		echo "============================================================================================"
		echo "= SENDING TO RELAY: "$relay" | MESSAGE: "$message" "
		echo ""
		total=$((total + 1))
		output=$(timeout "$TIMEOUT"s bash -c "nostril --envelope --sec '$privkey' --content '${message//\'/\'\\\'\'}' | websocat --socks5 127.0.0.1:$PORT $relay")
		source ./COUNT.sh
	done
 

else
 
# NON-TOR LOOP

while true
do
privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
message=$(shuf -n 1 ../../../config/messages-list.txt)
relay=$(shuf -n 1 ../../../config/relays-list.txt)
countrelayslist=$(wc -l < ../../../config/relays-list.txt)
echo " "
echo " "
echo " "
echo " "


clear
echo "============================================================================================"
echo "=== 🤖 SPAMSTER N°"$NUMBER" IS RUNNING | RELAYS: "$countrelayslist""
echo "=== 🌐 YOUR IP: "$IP""
echo "=== 📨 TOTAL SEND :"$total" | ✅ OK FOR SURE::"$success" | ❓ NO REPLY (MAYBE OK) :"$noreply" | ❌ FAILED FOR SURE:"$failed" | ⏰ TIMED-OUT:"$timedout"" 
echo "============================================================================================"
echo "= SENDING TO RELAY: "$relay" | MESSAGE: "$message" "
echo "= . . . . . . . . . . . . . . . . . . . . . . . . . "
total=$((total + 1))
output=$(timeout "$TIMEOUT"s bash -c "nostril --envelope --sec '$privkey' --content '${message//\'/\'\\\'\'}' | websocat $relay")
source ./COUNT.sh
echo "




"
done
fi
















