NUMBER=$(cat NUMBER)
PORT=$(cat SOCKSPORT)
echo "======================================================================================="
echo "== 🤖  I'M SPAMSTER n°$NUMBER 🤖 "
echo "== 🧅 I will use TOR on port: $PORT "
echo "======================================================================================="
sleep $NUMBER

# Start tor on specified port.

echo "== Starting tor on port $PORT..."
tor -f "etc/torsocks.conf$NUMBER" -SocksPort $PORT &

# Let tor start properly.
echo "== Waiting for tor to start..."
echo "======================================================================================="
while true; do
  IP=$(curl --socks5-hostname 127.0.0.1:$PORT -s https://check.torproject.org | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1)

  if [ -z "$IP" ]; then
echo "======================================================================================="
    echo "== ❌ NO TOR IP FOUND ON $PORT, LET'S WAIT..."
echo "======================================================================================="
  else
echo "======================================================================================="
    echo "== ✅ READY - TOR IP FOUND ON PORT $PORT: $IP"
echo "======================================================================================="
    break
  fi
done

echo "======================================================================================="
    echo "== 🤖 STARTING SPAMSTER n°$NUMBER "
    echo "== 🧅 PORT: $PORT - IP: $IP"
echo "======================================================================================="


sleep 5


success=0
failed=0
timedout=0
noreply=0
while true
do
privkey=$(shuf -n 1 ../../../config/privkeys-list.txt)
message=$(shuf -n 1 ../../../config/messages-list.txt)
relay=$(shuf -n 1 ../../../config/relays-list.txt)
countrelayslist=$(wc -l < ../../../config/relays-list.txt)
echo " "
echo " "
clear
echo "======================================================================================="
echo "==   🤖 SPAMSTER $NUMBER IS RUNNING 🧅 PORT: $PORT | 🧅  IP: $IP"
echo "======================================================================================="
echo "		 ℹ️  RELAYS IN LIST: $countrelayslist"
echo " "
echo "==  | ✅ OK $success			| ❌ FAILED $failed 		| "
echo "==  | ⏰ TIMED-OUT $timedout		| 😟 NO REPLY $noreply 	| "
echo "======================================================================================="
echo "= RELAY: $relay"
echo "= MESSAGE: $message"
echo "======================================================================================="
echo " "

output=$(timeout 10s bash -c "nostril --envelope --sec \"$privkey\" --content \"$IP\" | websocat --socks5 127.0.0.1:$PORT $relay")
if [ $? -eq 124 ]; then
  timedout=$((timedout + 1))
  echo " ⏰ TIMED OUT."
  echo " Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt


elif echo "$output" | grep -q "true"; then
  success=$((success + 1))
  echo $relay >> ok-relays.txt
  echo "$relay replied:"
  echo " $output "
  echo " "
  echo " ✅ Success."
  
  
elif echo "$output" | grep -q "created"; then
  success=$((success + 1))
  echo $relay >> ok-relays.txt
  echo "$relay replied:"
  echo " $output "
    echo " "
  echo " ✅ Success."
  
  
elif echo "$output" | grep -q "false"; then
  failed=$((failed + 1))
  echo "$relay replied: "$output""
  echo " "
  echo " ❌ Failed, FALSE."
  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt

else
  noreply=$((noreply + 1))
  echo " Reply from $relay:"
  echo "  "$output" "
  echo " 😟 No reply / error from $relay. likelly failed."
  echo " ❌ Removing $relay  from relay list"
  grep -v "$relay" ../../../config/relays-list.txt > tmp_file
  mv tmp_file ../../../config/relays-list.txt
  
fi



if [ -f ok-relays.txt ]; then
  sort ok-relays.txt | uniq > temp.txt && mv temp.txt ok-relays.txt
  echo "======================================================================================="
  echo " 	✅ RELAYS THAT ACCEPTED EVENTS DURING THIS SESSION: ✅"
  cat ok-relays.txt
  cat ok-relays.txt >> ../../../config/relays-list.txt
  sort ../../../config/relays-list.txt | uniq > temp.txt && mv temp.txt ../../../config/relays-list.txt
else
  echo " "
fi

done

echo "======== CLOSING ============" 
