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


echo " " > ok-relays.txt 

# IF 1 
# TOR LOOP
if [ "$USETOR" == "yes" ]
  then
    echo " == You asked me to use tor, let me start it first..."
    source ./START-TOR.sh

    PORT=$(cat PORT)
		CONTROLPORT=$(( $(cat PORT) + 1 ))


	function tor_stop {

  echo "============================================================================="
  echo "  == Stopping tor on port: $PORT hash-password $HASHEDPW "
  echo "============================================================================="
  tor --defaults-torrc ./etc/torrc --hush >/dev/null 2>&1 &
  echo "============================================================================="
  echo "  == Tor stopped properly on port: $PORT "
  echo "============================================================================="
  sleep 5

	}

	trap tor_stop EXIT
	trap tor_stop SIGHUP


       # TOR LOOP
	while true
	do
		privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
		message=$(shuf -n 1 ../../../config/messages-list.txt)
		relay=$(shuf -n 1 ../../../config/relays-list.txt)
		countrelayslist=$(wc -l < ../../../config/relays-list.txt)
		
		clear
		echo "============================================================================="
		echo "=== 🤖 SPAMSTER N°"$NUMBER" IS RUNNING | RELAYS IN LIST: "$countrelayslist" "
		echo "=== 🧅 TOR-IP: "$IP" ON PORT:$PORT "
		echo "=== 📨 TOTAL SEND :"$total" | ✅ OK FOR SURE:"$success""
		echo "=== ❓ NO REPLY (MAYBE OK) :"$noreply" | ❌ FAILED FOR SURE:"$failed" | ⏰ TIMED-OUT:"$timedout"" 
		echo "============================================================================="
		echo "=== ✅ RELAYS THAT ACCEPTED EVENTS DURING THIS SESSION:   "
		cat ok-relays.txt
		echo "============================================================================="
		echo "= RELAY: "$relay" "
		echo "= MESSAGE: "$message" "
	        total=$((total + 1))
		output=$(timeout "$TIMEOUT"s bash -c "nostril --envelope --sec '$privkey' --content '${message//\'/\'\\\'\'}' --pow "$POW" | websocat --socks5 127.0.0.1:$PORT $relay")
		source ./SORT.sh
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

clear
echo "============================================================================="
echo "=== 🤖 SPAMSTER N°"$NUMBER" IS RUNNING | RELAYS IN LIST: "$countrelayslist""
echo "=== 🌐 YOUR IP: "$IP""
echo "=== 📨 TOTAL SEND :"$total" | ✅ OK FOR SURE:"$success""
echo "=== ❓ NO REPLY (MAYBE OK) :"$noreply" | ❌ FAILED FOR SURE:"$failed" | ⏰ TIMED-OUT:"$timedout"" 
echo "============================================================================="
echo "=== ✅ RELAYS THAT ACCEPTED EVENTS DURING THIS SESSION:  "
cat ok-relays.txt
echo "============================================================================="
echo "= RELAY: "$relay" "
echo "= MESSAGE: "$message" "
total=$((total + 1))
output=$(timeout "$TIMEOUT"s bash -c "nostril --envelope --sec '$privkey' --content '${message//\'/\'\\\'\'}' --pow "$POW" | websocat $relay")
source ./SORT.sh
source ./COUNT.sh

done
fi